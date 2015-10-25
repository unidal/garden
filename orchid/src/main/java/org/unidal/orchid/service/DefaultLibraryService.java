package org.unidal.orchid.service;

import java.io.File;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.codehaus.plexus.logging.LogEnabled;
import org.codehaus.plexus.logging.Logger;
import org.codehaus.plexus.personality.plexus.lifecycle.phase.Initializable;
import org.codehaus.plexus.personality.plexus.lifecycle.phase.InitializationException;
import org.unidal.helper.Files;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.library.entity.Libraries;
import org.unidal.orchid.library.entity.Library;
import org.unidal.orchid.library.transform.DefaultSaxParser;

@Named(type = LibraryService.class)
public class DefaultLibraryService implements LibraryService, Initializable, LogEnabled {
	private File m_libraryFile;

	private Libraries m_libraries;

	private Logger m_logger;

	@Override
	public void enableLogging(Logger logger) {
		m_logger = logger;
	}

	@Override
	public String getXml() {
		return m_libraries.toString();
	}

	@Override
	public void initialize() throws InitializationException {
		String homeProperty = System.getProperty("orchidHome");
		String homeEnv = System.getenv("ORCHID_HOME");
		File home;

		if (homeProperty != null) {
			home = new File(homeProperty);
		} else if (homeEnv != null) {
			home = new File(homeEnv);
		} else {
			home = new File("data");
		}

		if (!home.exists()) {
			Files.forDir().createDir(home);
		}

		m_libraryFile = new File(home, "library.xml");

		try {
			m_libraryFile = m_libraryFile.getCanonicalFile();

			if (m_libraryFile.exists()) {
				String xml = Files.forIO().readFrom(m_libraryFile, "utf-8");

				m_libraries = DefaultSaxParser.parse(xml);
				m_logger.info(String.format("Loaded library from file(%s)", m_libraryFile));
			} else {
				Library sample = new Library("sample").setName("sample.dll").setProduct("sample");

				sample.setCurrentVersion("1.1").setMinVersion("1.0").setStableVersion("1.0");

				m_libraries = new Libraries().addLibrary(sample);
				Files.forIO().writeTo(m_libraryFile, m_libraries.toString());
				m_logger.info(String.format("File(%s) created.", m_libraryFile));
			}
		} catch (Exception e) {
			throw new InitializationException("Error when loading library.xml from " + m_libraryFile, e);
		}
	}

	@Override
	public List<Library> list() {
		Collections.sort(m_libraries.getLibraries(), new Comparator<Library>() {
			@Override
         public int compare(Library o1, Library o2) {
	         return o1.getName().compareTo(o2.getName());
         }
		});
		
		return m_libraries.getLibraries();
	}

	@Override
	public void update(String xml) throws Exception {
		Libraries libraries = DefaultSaxParser.parse(xml);

		Files.forIO().writeTo(m_libraryFile, libraries.toString());
		m_libraries = libraries;
	}
}
