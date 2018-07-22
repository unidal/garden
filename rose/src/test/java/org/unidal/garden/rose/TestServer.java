package org.unidal.garden.rose;

import java.io.File;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.unidal.test.jetty.JettyServer;

@RunWith(JUnit4.class)
public class TestServer extends JettyServer {
	public static void main(String[] args) throws Exception {
		TestServer server = new TestServer();

		server.startServer();
		server.startWebApp();
		server.stopServer();
	}

	@Override
	protected String getContextPath() {
		return "/rose";
	}

	@Override
	protected int getServerPort() {
		return 7673;
	}

	@Test
	public void startWebApp() throws Exception {
		// open the page in the default browser
		display("/rose/query");
		waitForAnyKey();
	}
	
	protected File getWarRoot() {
		return new File("src/main/resources/META-INF/resources");
	}
}
