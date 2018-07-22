package org.unidal.orchid.pages;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;

import org.junit.Test;
import org.unidal.helper.Files;
import org.unidal.helper.Scanners;
import org.unidal.helper.Scanners.FileMatcher;
import org.unidal.lookup.ComponentTestCase;
import org.unidal.orchid.service.UmlService;
import org.unidal.tuple.Triple;
import org.unidal.web.jsp.function.CodecFunction;

public class PageGenerator extends ComponentTestCase {
	@Test
	public void testSample() throws IOException {
//		List<Triple<String, String, String>> diagrams = extractDiagrams("/plantuml/sample.html");
		List<Triple<String, String, String>> diagrams = extractDiagrams("/plantuml/pages/salt.html");


		for (Triple<String, String, String> d: diagrams) {
			System.out.println(d.getFirst());
		}
		Assert.assertEquals(13, diagrams.size());
	}

	@Test
	public void generateJspSources() throws IOException {
		File sourceDir = new File("src/test/resources/plantuml/pages");
		final List<String> ids = new ArrayList<String>();

		Scanners.forDir().scan(sourceDir, new FileMatcher() {
			@Override
			public Direction matches(File base, String path) {
				int pos = path.indexOf(".html");

				if (pos > 0) {
					ids.add(path.substring(0, pos));
				}

				return Direction.NEXT;
			}
		});

		for (String id : ids) {
			generateJspSource(id);
		}
	}

	private void generateJspSource(String id) throws IOException {
		String page = String.format("/plantuml/pages/%s.html", id);
		List<Triple<String, String, String>> diagrams = extractDiagrams(page);
		StringBuilder sb = new StringBuilder(2048);
		int index = 101;

		// build JSP content
		for (Triple<String, String, String> diagram : diagrams) {
			String name = diagram.getFirst();
			String description = diagram.getMiddle();
			String uml = diagram.getLast();
			String path = String.valueOf(index++).substring(1) + "-" + name + ".uml";

			sb.append("<div>\r\n");
			sb.append("<h2>").append(name).append("</h2>\r\n");

			if (description != null) {
				sb.append("<div>").append(description).append("</div>\r\n");
			}

			sb.append("<pre>").append(CodecFunction.htmlEncode(uml)).append("</pre>\r\n");
			sb.append("<img src='${model.webapp}/uml/help/").append(id).append('/');
			sb.append(path.replaceAll(" ", "+")).append("'>\r\n");
			sb.append("</div>\r\n\r\n");

			generateUml(id, name, path, page, htmlDecode(uml));
		}

		File targetSource = new File(String.format("src/main/webapp/jsp/help/%s.jsp", id)).getCanonicalFile();
		String template = Files.forIO().readFrom(getClass().getResourceAsStream("/plantuml/template.jsp"), "utf-8");

		Files.forIO().writeTo(targetSource, template.replace("${content}", sb.toString()));
		System.out.println(String.format("File(%s) generated", targetSource));
	}

	private void generateUml(String id, String name, String path, String page, String uml) throws IOException {
		UmlService service = lookup(UmlService.class);
		byte[] content = service.generateImage(uml, "svg");

		// if it's a valid uml
		if (content != null) {
			File file = new File(String.format("src/main/resources/help/%s/%s", id, path)).getCanonicalFile();

			Files.forIO().writeTo(file, uml);
			System.out.println(String.format("File(%s) generated", file));
		} else {
			System.out.println(String.format("Section(%s) of page(%s) is invalid!", name, page));
		}
	}

	private String htmlDecode(String str) {
		return str.replace("&#64;", "@") //
		      .replace("&gt;", ">") //
		      .replace("&lt;", "<") //
		;
	}

	private Triple<String, String, String> extractDiagram(String section) {
		Triple<String, String, String> diagram = new Triple<String, String, String>();
		int parts = 0;

		// for title
		int p1 = section.indexOf("<h2");
		int p2 = section.indexOf(">", p1 + 1);
		int p3 = section.indexOf("</h2>", p2 + 1);

		if (p1 >= 0 && p2 > p1 && p3 > p2) {
			String title = section.substring(p2 + 1, p3);

			diagram.setFirst(title.replace("/", "&"));
			parts++;
		}

		// for description
		int p4 = section.indexOf("</div>\r\n", p3 + 1);
		int p5 = section.indexOf("\r\n<div>", p4 + 1);

		if (p4 > 0 && p5 > p4 + "</div>\r\n".length()) {
			String description = section.substring(p4 + "</div>\r\n".length(), p5);

			diagram.setMiddle(description);
			parts++;
		}

		// for UML source
		int p6 = section.indexOf("<pre>\r\n", p5 + 1);
		int p7 = section.indexOf("</pre>", p6 + 1);

		if (p6 > 0 && p7 > p6) {
			String uml = section.substring(p6 + "<pre>\r\n".length(), p7);

			diagram.setLast(uml);
			parts++;
		}

		if (parts >= 2) {
			return diagram;
		} else {
			return null;
		}
	}

	private List<Triple<String, String, String>> extractDiagrams(String name) throws IOException {
		InputStream in = getClass().getResourceAsStream(name);
		String content = Files.forIO().readFrom(in, "utf-8");
		List<String> sections = extractSections(content);
		List<Triple<String, String, String>> diagrams = new ArrayList<Triple<String, String, String>>();

		for (String section : sections) {
			Triple<String, String, String> diagram = extractDiagram(section);

			if (diagram != null) {
				diagrams.add(diagram);
			}
		}

		return diagrams;
	}

	private List<String> extractSections(String content) {
		List<String> sections = new ArrayList<String>();
		int off = 0;

		while (true) {
			int p1 = content.indexOf("<section>", off);
			int p2 = content.indexOf("</section>", p1 + 1);

			if (p1 < 0 && p2 < 0) {
				p1 = content.indexOf("<h2>", off);
				p2 = content.indexOf("<h2>", p1 + 1);

				if (p1 > 0 && p2 > p1) {
					sections.add(content.substring(p1, p2));

					off = p2;
				} else {
					break;
				}
			} else if (p1 > 0 && p2 > p1) {
				sections.add(content.substring(p1 + "<section>".length(), p2));

				off = p2;
			} else {
				break;
			}
		}

		return sections;
	}
}
