package org.unidal.orchid.uml.upload;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import org.junit.Test;
import org.unidal.helper.Files;
import org.unidal.helper.Files.AutoClose;

public class UploadPageTest {
	@Test
	public void testUpload() throws Exception {
		String url = "http://localhost:2567/uml/upload/test";
		URLConnection conn = new URL(url).openConnection();

		conn.setDoOutput(true);
		conn.setRequestProperty("Content-Type", "application/octet-stream");
		conn.connect();

		OutputStream out = conn.getOutputStream();
		InputStream in = getClass().getResourceAsStream("doc.zip");

		Files.forIO().copy(in, out, AutoClose.INPUT);

		out.flush();
		conn.getInputStream();
	}
}
