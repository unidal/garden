package org.unidal.maven.plugin.uml;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.webapp.WebAppContext;
import org.unidal.test.browser.DefaultBrowser;

/**
 * @goal run
 * @requiresProject false
 * @author Wenchao Meng
 */
public class RunMojo extends AbstractMojo {
	/**
	 * @parameter property="port" default-value="8650"
	 */
	private int port = 8650;

	/**
	 * @parameter property="warVersion"
	 */
	private String warVersion = "1.2.0";

	@Override
	public void execute() throws MojoExecutionException, MojoFailureException {
		String prefix = "jar:file:";
		String pluginMavenPath = "org/unidal/maven/plugins";
		String warPath = String.format("org/unidal/garden/orchid/%s/orchid-%s.war", warVersion, warVersion);
		URL url = getClass().getResource(String.format("%s.class", getClass().getSimpleName()));

		int beginIndex = prefix.length();
		int endIndex = url.toString().indexOf(pluginMavenPath);

		String basePath = url.toString().substring(beginIndex, endIndex);
		getLog().debug(String.format("basePath(%s)", basePath));

		File war = new File(basePath + warPath);

		getLog().debug(String.format("warPath(%s)", war));

		if (!war.exists()) {
			getLog().warn("can not find the war:" + war);
			return;
		}

		try {
			startWar(war);
		} catch (Exception e) {
			throw new MojoFailureException("start war fail ", e);
		}
	}

	private void startWar(File war) throws Exception {
		Server server = new Server(port);
		WebAppContext webapp = new WebAppContext();

		webapp.setContextPath("/");
		webapp.setWar(war.getAbsolutePath());
		server.setHandler(webapp);
		server.start();
		openIndexPage();
		server.join();
	}

	private void openIndexPage() throws MalformedURLException {
		DefaultBrowser browser = new DefaultBrowser();
		browser.display(new URL(String.format("http://localhost:%d", port)));
	}
}
