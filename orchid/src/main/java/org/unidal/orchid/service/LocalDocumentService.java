package org.unidal.orchid.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.codehaus.plexus.personality.plexus.lifecycle.phase.Initializable;
import org.codehaus.plexus.personality.plexus.lifecycle.phase.InitializationException;
import org.unidal.helper.Files;
import org.unidal.helper.Scanners;
import org.unidal.helper.Scanners.FileMatcher;
import org.unidal.lookup.annotation.Named;

@Named(type = DocumentService.class, value = LocalDocumentService.ID)
public class LocalDocumentService implements DocumentService, Initializable {
	public static final String ID = "local";

	private File m_docBase;

	@Override
	public void deleteDocument(String product, String id) throws Exception {
		File file = new File(m_docBase, id);

		Files.forDir().delete(file);
	}

	@Override
	public String getDocument(String product, String id) throws Exception {
		File file = new File(m_docBase, id);

		if (file.exists()) {
			String content = Files.forIO().readFrom(file, "utf-8");

			return content;
		} else {
			throw new FileNotFoundException(file.getCanonicalPath());
		}
	}

	@Override
	public List<String> getDocumentIds(String product) throws Exception {
		final List<String> ids = new ArrayList<String>();

		Scanners.forDir().scan(m_docBase, new FileMatcher() {
			@Override
			public Direction matches(File base, String path) {
				if (new File(base, path).isDirectory()) {
					return Direction.DOWN;
				} else if (path.endsWith(".uml")) {
					ids.add(path);
				}

				return Direction.NEXT;
			}
		});

		return ids;
	}

	@Override
	public List<String> getProducts() throws Exception {
		return Arrays.asList("LOCAL");
	}

	@Override
   public boolean hasDocument(String product, String id) {
		File file = new File(m_docBase, id);

		return file.exists();
   }

	@Override
	public void initialize() throws InitializationException {
		m_docBase = new File("doc"); // fix directory as expected

		if (!m_docBase.exists()) {
			if (!m_docBase.mkdirs()) {
				throw new InitializationException(String.format("Unable to create directory(%s), "
				      + "please check if you have permission!", m_docBase));
			}
		} else if (!m_docBase.isDirectory()) {
			throw new InitializationException(String.format("%s is expected to be a directory!", m_docBase));
		}
	}

	@Override
	public void storeDocument(String product, String id, String content) throws Exception {
		File file = new File(m_docBase, id);

		Files.forIO().writeTo(file, content);
	}
}
