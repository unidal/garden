package org.unidal.orchid.pages;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import junit.framework.Assert;

import org.junit.Test;
import org.unidal.helper.Files;
import org.unidal.helper.Urls;

public class PageUpdater {

	private void downloadPage(File baseDir, String page) throws IOException {
		File file = new File(baseDir, page + ".html");
		String url = String.format("http://plantuml.com/%s.html", page);

		System.out.println(String.format("Downloading page(%s) from %s ...", page, url));

		try {
			Map<String, List<String>> headers = new HashMap<String, List<String>>();
			InputStream in = Urls.forIO().connectTimeout(5000).readTimeout(8000).openStream(url, headers);
			byte[] content = Files.forIO().readFrom(in);

			Files.forIO().writeTo(file, content);
			System.out.println(String.format("Page has been placed at %s.", file));
		} catch (Exception e) {
			throw new IOException(String.format("Unable to download page(%s)!", url), e);
		}
	}

	@Test
	public void downloadUMLPages() throws IOException {
		String[] pages = { "activity", "activity2", "classes", "component", "objects", "sequence", "state", "usecase" };
		File baseDir = new File("./src/test/resources/plantuml/pages").getCanonicalFile();
		List<String> missingPages = new ArrayList<String>();
		List<String> existedPages = new ArrayList<String>();

		for (String page : pages) {
			File file = new File(baseDir, page + ".html");

			if (file.exists()) {
				existedPages.add(page);
			} else {
				missingPages.add(page);
			}
		}

		for (String page : missingPages) {
			downloadPage(baseDir, page);
		}

		for (String page : existedPages) {
			updatePage(baseDir, page);
		}
	}

	@Test
	public void testDateFormat() throws ParseException {
		String src = "Sun, 18 Oct 2015 13:21:08";
		SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss", Locale.US);

		Assert.assertEquals(src, format.format(format.parse(src)));
	}

	private void updatePage(File baseDir, String page) throws IOException {
		File file = new File(baseDir, page + ".html");
		String url = String.format("http://plantuml.com/%s.html", page);
		SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss z", Locale.US);

		System.out.println(String.format("Updating page(%s) from %s ...", page, url));

		try {
			Map<String, List<String>> headers = new HashMap<String, List<String>>();
			InputStream in = Urls.forIO().connectTimeout(5000).readTimeout(8000).openStream(url, headers);
			byte[] content = Files.forIO().readFrom(in);
			List<String> lastModified = headers.get("Last-Modified");

			if (lastModified != null && lastModified.size() > 0) {
				Date date = format.parse(lastModified.get(0));

				if (date.getTime() != file.lastModified()) {
					Files.forIO().writeTo(file, content);

					file.setLastModified(date.getTime());

					System.out.println(String.format("Page(%s) has been updated.", file));
				} else {
					System.out.println(String.format("Page(%s) is already up-to-date.", file));
				}
			}

		} catch (Exception e) {
			System.out.println(String.format("Unable to update page(%s)! " + e, url));
		}
	}
}
