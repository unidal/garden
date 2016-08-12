package org.unidal.maven.plugin.uml;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;

/**
 * @goal deploy
 * @requiresProject false
 * @author Leo Liang
 */
public class DeployMojo extends AbstractMojo {
	/**
	 * @parameter property="product"
	 * @required
	 */
	private String product;

	/**
	 * @parameter property="repository"
	 * @required
	 */
	private String repository;

	/**
	 * @parameter property="acceptFileExtents"
	 */
	private String acceptFileExtents = "uml";

	private List<String> acceptFileExtendList = new ArrayList<String>();

	private File baseDir = new File(System.getProperty("user.dir"));

	private File docDir;

	private void assertDirExists(File docDir) throws MojoExecutionException {
		if (!docDir.exists()) {
			throw new MojoExecutionException(String.format("Doc folder not found in %s", baseDir));
		}
	}

	private void attachContent(File file, ZipOutputStream zos) throws IOException {
		InputStream is = null;

		try {
			is = new FileInputStream(file);
			byte[] content = new byte[1024];
			int readCount = -1;

			while ((readCount = is.read(content)) != -1) {
				zos.write(content, 0, readCount);
			}
		} finally {
			if (is != null) {
				is.close();
			}
		}

	}

	private byte[] compressDir(File docDir) throws MojoExecutionException {
		getLog().info("Start archiving...");

		ZipOutputStream zos = null;

		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream(4096);

			zos = new ZipOutputStream(baos);
			compressRecursively(zos, docDir);
			zos.finish();
			zos.flush();
			return baos.toByteArray();
		} catch (IOException e) {
			throw new MojoExecutionException(String.format("Exception occured while compressing %s",
			      docDir.getAbsolutePath()), e);
		} finally {
			if (zos != null) {
				try {
					zos.close();
				} catch (IOException e) {
					// ignore it
				}
			}
			getLog().info(String.format("Archive completed...", docDir));
		}
	}

	private void compressRecursively(ZipOutputStream zos, File file) throws IOException {
		if (file.isDirectory()) {
			File[] subFiles = file.listFiles();
			if (subFiles != null && subFiles.length > 0) {
				for (File subFile : subFiles) {
					compressRecursively(zos, subFile);
				}
			}
		} else {

			if (fileAccept(file)) {
				getLog().info(String.format("Archiving file %s", file.getAbsolutePath()));
				zos.putNextEntry(new ZipEntry(getRelativePath(file)));
				attachContent(file, zos);
			}
		}
	}

	public static void main(String[] args) throws MojoExecutionException, MojoFailureException {
		DeployMojo mojo = new DeployMojo();

		mojo.product = "UML";
		mojo.repository = "http://localhost:2567";
		mojo.baseDir = new File("../orchid");

		mojo.execute();
	}

	@Override
	public void execute() throws MojoExecutionException, MojoFailureException {
		docDir = new File(baseDir, "doc");
		assertDirExists(docDir);
		init();
		upload(compressDir(docDir));
	}

	private boolean fileAccept(File file) {
		String fileName = file.getName();
		int lastIndexOfDot = fileName.lastIndexOf(".");
		if (lastIndexOfDot >= 0) {
			return acceptFileExtents.contains(fileName.substring(lastIndexOfDot + 1));
		} else {
			return false;
		}
	}

	private String getRelativePath(File file) {
		String absPath = file.getAbsolutePath();
		return absPath.substring(docDir.getAbsolutePath().length() + 1);
	}

	private void init() throws MojoExecutionException {
		if (acceptFileExtents == null && acceptFileExtents.trim().length() == 0) {
			throw new MojoExecutionException("acceptFileExtents can not be null or empty");
		}
		String[] exts = acceptFileExtents.split("\\s*,\\s*");

		for (String ext : exts) {
			acceptFileExtendList.add(ext);
		}

		getLog().info(String.format("Accepted doc extension %s", acceptFileExtendList));
	}

	private void upload(byte[] content) throws MojoExecutionException {
		String url = String.format("%s/uml/upload/%s", repository, product);

		getLog().info(String.format("Start uploading documents to %s...", url));

		OutputStream os = null;
		InputStream is = null;

		try {
			URLConnection conn = new URL(url).openConnection();

			conn.setConnectTimeout(2000);
			conn.setDoOutput(true);
			conn.setRequestProperty("Content-Type", "application/octet-stream");
			conn.connect();

			os = conn.getOutputStream();

			os.write(content);
			os.flush();

			is = conn.getInputStream();
		} catch (Exception e) {
			throw new MojoExecutionException("Exception occured while uploading!", e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e) {
					// ignore it
				}
			}

			if (os != null) {
				try {
					os.close();
				} catch (Exception e) {
					// ignore it
				}
			}
		}

		getLog().info("Upload completed.");
	}
}
