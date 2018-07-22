package org.unidal.orchid;

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
		return "/";
	}

	@Override
	protected int getServerPort() {
		return 8650;
	}

	@Test
	public void startWebApp() throws Exception {
		// open the page in the default browser
		display("/uml");
		waitForAnyKey();
	}
}
