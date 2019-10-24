package org.unidal.orchid.pages;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;

import javax.swing.text.html.parser.ParserDelegator;

import org.junit.Test;
import org.unidal.helper.Files;
import org.unidal.helper.Urls;

public class PageFetcher {
	private void download(String page, File file, String url) throws IOException {
		System.out.println(String.format("Downloading page(%s) from %s ...", page, url));

		try {
			InputStream in = Urls.forIO().connectTimeout(10000).readTimeout(10000).openStream(url);
			byte[] content = Files.forIO().readFrom(in);

			Files.forIO().writeTo(file, content);
			System.out.println(String.format("Page created at %s. size: %s", file, file.length()));
		} catch (Exception e) {
			throw new IOException(String.format("Unable to download page(%s) from %s!", page, url), e);
		}
	}

	@Test
	public void downloadPages() throws IOException {
		String[] pages = { "sequence-diagram", "use-case-diagram", "class-diagram", "activity-diagram-beta",
				"component-diagram", "state-diagram", "object-diagram", "deployment-diagram", "timing-diagram", "salt",
				"archimate-diagram", "ditaa", "gantt-diagram", "mindmap-diagram", "wbs-diagram", "ascii-math",
				"ie-diagram" };
		String[] langs = { "en", "zh" };

		for (String lang : langs) {
			for (String page : pages) {
				String url = String.format("http://plantuml.com/%s/%s", lang, page);
				File origin = new File(String.format("src/test/resources/plantuml/%s/%s.html", lang, page));
				File umlBase = new File(String.format("src/main/resources/help/%s", page));
				File target = new File(String.format("src/main/webapp/jsp/help/%s/%s.jsp", lang, page));

				if (!origin.exists()) {
					download(page, origin, url);
				}

				process(page, origin, target, umlBase);
			}
		}
	}

	@Test
	public void test() throws IOException {
		String lang = "en";
		String page = "use-case-diagram";
		File origin = new File(String.format("src/test/resources/plantuml/%s/%s.html", lang, page));
		File umlBase = new File(String.format("src/main/resources/help/%s", page));
		File target = new File(String.format("src/main/webapp/jsp/help/%s/%s.jsp", lang, page));

		process(page, origin, target, umlBase);
	}

	private void process(String page, File source, File target, File umlBase) throws IOException {
		String template = Files.forIO().readFrom(getClass().getResourceAsStream("/plantuml/template.jsp"), "utf-8");
		HtmlParserCallback cb = new HtmlParserCallback(page, umlBase, (int) source.length());

		new ParserDelegator().parse(new FileReader(source), cb, true);
		Files.forIO().writeTo(target, template.replace("${content}", cb.getResult()).getBytes("utf-8"));
	}
}
