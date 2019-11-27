package org.unidal.orchid.diagram;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public interface DiagramGenerator {
	public void generate(HttpServletResponse res, String content, String type) throws IOException;

	public byte[] generate(String content, String type) throws IOException;
}