package org.unidal.garden.rose;

import java.util.EnumSet;

import javax.servlet.DispatcherType;

import org.eclipse.jetty.servlets.GzipFilter;
import org.eclipse.jetty.webapp.WebAppContext;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.unidal.test.jetty.JettyServer;

@RunWith(JUnit4.class)
public class TestServer extends JettyServer {
	public static void main(String[] args) throws Exception {
		TestServer server = new TestServer();

		server.startServer();
		server.startWebapp();
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

	@Override
	protected boolean isWebXmlDefined() {
		return false;
	}

	@Override
	protected void postConfigure(WebAppContext context) {
		context.addFilter(GzipFilter.class, "/*", EnumSet.allOf(DispatcherType.class));
	}

	@Test
	public void startWebapp() throws Exception {
		// open the page in the default browser
		display("/rose/query");
		waitForAnyKey();
	}
}
