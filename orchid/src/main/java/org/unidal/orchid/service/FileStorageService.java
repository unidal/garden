package org.unidal.orchid.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.unidal.helper.Files;
import org.unidal.helper.Scanners;
import org.unidal.helper.Scanners.FileMatcher;
import org.unidal.lookup.annotation.Named;

import com.dianping.cat.Cat;

@Named(type = StorageService.class)
public class FileStorageService implements StorageService {
	@Override
	public String getUmlContent(String umlFile) {
		try {
			String uml = Files.forIO().readFrom(new File(umlFile), "utf-8");

			return uml;
		} catch (IOException e) {
			Cat.logError(e);
		}

		return null;
	}

	@Override
	public List<File> getUmlFiles() {
		final List<File> files = new ArrayList<File>();

		FileMatcher matcher = new FileMatcher() {
			@Override
			public Direction matches(File base, String path) {
				if (path.endsWith(".uml")) {
					files.add(new File(base, path));
				}

				return Direction.DOWN;
			}
		};

		for (String doc : Arrays.asList("doc")) {
			Scanners.forDir().scan(new File(doc), matcher);
		}

		return files;
	}

	@Override
	public void save(String umlFile, String uml) throws IOException {
		File file = new File(umlFile);
		Files.forIO().writeTo(file, uml);
	}

	@Override
	public boolean tryCreateFile(String umlFile) {
		File file = new File(umlFile);

		if (file.exists()) {
			return false;
		} else {
			file.getParentFile().mkdirs();

			try {
				FileOutputStream fos = new FileOutputStream(file);

				fos.close();
				return true;
			} catch (IOException e) {
				return false;
			}
		}
	}
}
