package org.unidal.orchid.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.plexus.logging.LogEnabled;
import org.codehaus.plexus.logging.Logger;
import org.codehaus.plexus.personality.plexus.lifecycle.phase.Initializable;
import org.codehaus.plexus.personality.plexus.lifecycle.phase.InitializationException;
import org.unidal.helper.Dates;
import org.unidal.helper.Files;
import org.unidal.helper.Scanners;
import org.unidal.helper.Scanners.FileMatcher;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.git.GitRepositories;
import org.unidal.orchid.git.GitRepositories.RepositoryHelper;

import com.dianping.cat.Cat;

@Named(type = StorageService.class)
public class FileStorageService implements StorageService, Initializable, LogEnabled {
	private File m_home;

	private RepositoryHelper m_git;

	private String m_lastTime;

	private Logger m_logger;

	@Override
	public boolean createUmlFile(String umlFile) {
		File file = new File(m_home, umlFile);

		if (file.exists()) {
			return false;
		} else {
			file.getParentFile().mkdirs();

			try {
				FileOutputStream fos = new FileOutputStream(file);

				fos.close();
				return true;
			} catch (IOException e) {
				return false;
			}
		}
	}

	@Override
	public void enableLogging(Logger logger) {
		m_logger = logger;
	}

	@Override
	public String getUmlContent(String umlFile) {
		try {
			String uml = Files.forIO().readFrom(new File(m_home, umlFile), "utf-8");

			return uml;
		} catch (IOException e) {
			Cat.logError(e);
		}

		return null;
	}

	@Override
	public List<String> getUmlFiles() {
		final List<String> files = new ArrayList<String>();

		FileMatcher matcher = new FileMatcher() {
			@Override
			public Direction matches(File base, String path) {
				if (path.endsWith(".uml")) {
					files.add(path);
				}

				return Direction.DOWN;
			}
		};

		Scanners.forDir().scan(m_home, matcher);

		return files;
	}

	@Override
	public void initialize() throws InitializationException {
		String homeProperty = System.getProperty("orchidHome");
		String homeEnv = System.getenv("ORCHID_HOME");

		if (homeProperty != null) {
			m_home = new File(homeProperty);
		} else if (homeEnv != null) {
			m_home = new File(homeEnv);
		} else {
			m_home = new File("data");
		}

		if (!m_home.exists()) {
			Files.forDir().createDir(m_home);
		}

		try {
			m_home = m_home.getCanonicalFile();
			m_git = GitRepositories.at(m_home).open(true);

			m_logger.info(String.format("Orchid home is %s", m_home));
		} catch (Exception e) {
			throw new InitializationException(String.format("Error when opening git repository(%s)", m_home), e);
		}
	}

	@Override
	public synchronized void saveUmlFile(String umlFile, String uml) throws Exception {
		File file = new File(m_home, umlFile);

		Files.forIO().writeTo(file, uml);

		String date = Dates.now().asString("YYYY-MM-dd");

		if (m_lastTime == null || !date.equals(m_lastTime)) {
			m_git.addAll().commit(date).tag(date);
			m_lastTime = date;
		}
	}
}
