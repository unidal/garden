package org.unidal.orchid.diagram;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.eclipse.jgit.api.Status;
import org.unidal.cat.Cat;
import org.unidal.helper.Files;
import org.unidal.helper.Scanners;
import org.unidal.helper.Scanners.FileMatcher;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.logging.LogEnabled;
import org.unidal.lookup.logging.Logger;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.transform.DefaultSaxParser;
import org.unidal.orchid.git.GitRepositories;
import org.unidal.orchid.git.GitRepositories.RepositoryHelper;

@Named(type = DiagramRepository.class, value = GitBasedDiagramRepository.ID, instantiationStrategy = Named.PER_LOOKUP)
public class GitBasedDiagramRepository implements DiagramRepository, LogEnabled {
	public static final String ID = "git";

	private File m_gitBase;

	private String m_product;

	private RepositoryHelper m_git;

	private Logger m_logger;

	@Override
	public void enableLogging(Logger logger) {
		m_logger = logger;
	}

	@Override
	public List<DiagramModel> getDiagrams() throws Exception {
		final List<String> files = new ArrayList<String>();

		Scanners.forDir().scan(m_gitBase, new FileMatcher() {
			@Override
			public Direction matches(File base, String path) {
				if (path.endsWith(".uml") && new File(base, path).isFile()) {
					files.add(path);
				}

				return Direction.NEXT;
			}
		});

		List<DiagramModel> diagrams = new ArrayList<DiagramModel>();

		for (String file : files) {
			FileInputStream in = new FileInputStream(new File(m_gitBase, file));
			DiagramModel diagram = DefaultSaxParser.parseEntity(DiagramModel.class, in);

			diagrams.add(diagram);
		}

		return diagrams;
	}

	@Override
	public void setup(String product, Properties properties) {
		String baseDir = properties.getStringProperty("base-dir", ".");

		m_product = product;
		m_gitBase = new File(baseDir, product);

		if (!m_gitBase.exists()) {
			Files.forDir().createDir(m_gitBase);
		}

		try {
			m_gitBase = m_gitBase.getCanonicalFile();
			m_git = GitRepositories.at(m_gitBase).open(true);

			m_logger.info(String.format("Setup git repository(%s)", m_gitBase));
		} catch (Exception e) {
			throw new RuntimeException(String.format("Error when setup git repository(%s)", m_gitBase), e);
		}

		new Timer("Timer-" + m_product, true).schedule(new GitCheckinTask(), 0, 30 * 60 * 1000L);
	}

	@Override
	public void updateDiagram(DiagramModel diagram) throws Exception {
		String id = diagram.getId();
		File file = new File(m_gitBase, id);

		Files.forIO().writeTo(file, diagram.getContent());
	}

	public class GitCheckinTask extends TimerTask {
		@Override
		public void run() {
			try {
				Status status = m_git.addAll().status();

				if (!status.isClean()) {
					int modified = status.getAdded().size() + status.getChanged().size();

					m_git.commit(String.format("%s diagrams modified", modified));
				}
			} catch (Throwable e) {
				Cat.logError(e);
			}
		}
	}
}
