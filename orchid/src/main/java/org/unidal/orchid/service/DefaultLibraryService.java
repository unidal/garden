package org.unidal.orchid.service;

import java.io.File;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.unidal.helper.Files;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.lookup.logging.LogEnabled;
import org.unidal.lookup.logging.Logger;
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
		String home = System.getenv("GARDEN_HOME");
		File baseDir;

		home = System.getProperty("baseDir", home);

		if (home == null) {
			baseDir = new File("data");
		} else {
			baseDir = new File(home, "data");
		}

		m_libraryFile = new File(baseDir, "library.xml");

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
