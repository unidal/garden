package com.dianping.garden;

import java.io.File;
import java.net.URL;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mortbay.jetty.Handler;
import org.mortbay.jetty.servlet.Context;
import org.mortbay.jetty.servlet.ServletHolder;
import org.mortbay.servlet.GzipFilter;
import org.unidal.lookup.ComponentTestCase;
import org.unidal.test.browser.BrowserManager;
import org.unidal.web.MVC;
import org.unidal.webres.server.support.SimpleServerSupport;
import org.unidal.webres.taglib.support.JettyTestSupport;

public class SimpleServer extends SimpleServerSupport {
	private static ComponentAdaptor s_adaptor = new ComponentAdaptor();

	private static MVC s_mvc = new MVC();

	@AfterClass
	public static void afterClass() throws Exception {
		JettyTestSupport.shutdownServer();
	}

	@BeforeClass
	public static void beforeClass() throws Exception {
		JettyTestSupport.startServer(new SimpleServer());
	}

	@Override
	protected File getWarRoot() {
		return new File("src/main/webapp");
	}

	public static void main(String[] args) throws Exception {
		SimpleServer server = new SimpleServer();

		SimpleServer.beforeClass();

		try {
			server.before();
			server.startServer();
			server.after();
		} finally {
			SimpleServer.shutdownServer();
		}
	}

	@Override
	public void after() {
		super.after();
		s_adaptor.after();
	}

	@Override
	public void before() {
		s_adaptor.setServerPort(getServerPort());
		s_adaptor.before();
		s_mvc.setContainer(s_adaptor.getContainer());
		super.before();
	}

	@Override
	protected void postConfigure(Context ctx) {
		ServletHolder holder = new ServletHolder(s_mvc);

		ctx.addServlet(holder, "/d/*");
		ctx.addServlet(holder, "/t/*");
		ctx.addFilter(GzipFilter.class, "/d/*", Handler.ALL);
		ctx.addFilter(GzipFilter.class, "/t/*", Handler.ALL);
		super.postConfigure(ctx);
	}

	@Override
	protected String getContextPath() {
		return "/dp";
	}

	@Override
	protected File getScratchDir() {
		File work = new File(System.getProperty("java.io.tmpdir", "."), "Garden");

		work.mkdirs();
		return work;
	}

	@Override
	protected int getServerPort() {
		return 2000;
	}

	@Test
	public void startServer() throws Exception {
		s_adaptor.display("/dp/d");
		System.out.println(String.format("[%s] Press any key to stop server ... ", getTimestamp()));
		System.in.read();
	}

	static class ComponentAdaptor extends ComponentTestCase {
		private int m_serverPort;

		public void after() {
			try {
				super.tearDown();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void before() {
			try {
				super.setUp();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void setServerPort(int serverPort) {
			m_serverPort = serverPort;
		}

		public void display(String requestUri) throws Exception {
			StringBuilder sb = new StringBuilder(256);
			BrowserManager manager = lookup(BrowserManager.class);

			sb.append("http://localhost:").append(m_serverPort).append(requestUri);

			try {
				manager.display(new URL(sb.toString()));
			} finally {
				release(manager);
			}
		}
	}
}
