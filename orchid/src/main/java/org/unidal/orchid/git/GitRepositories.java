package org.unidal.orchid.git;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.MergeResult.MergeStatus;
import org.eclipse.jgit.api.PullResult;
import org.eclipse.jgit.api.ResetCommand.ResetType;
import org.eclipse.jgit.api.Status;
import org.eclipse.jgit.api.errors.JGitInternalException;
import org.eclipse.jgit.api.errors.NoHeadException;
import org.eclipse.jgit.diff.DiffEntry;
import org.eclipse.jgit.diff.DiffFormatter;
import org.eclipse.jgit.diff.RawTextComparator;
import org.eclipse.jgit.errors.LockFailedException;
import org.eclipse.jgit.lib.NullProgressMonitor;
import org.eclipse.jgit.lib.ObjectId;
import org.eclipse.jgit.lib.ObjectReader;
import org.eclipse.jgit.lib.ProgressMonitor;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.lib.StoredConfig;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.revwalk.RevWalk;
import org.eclipse.jgit.treewalk.CanonicalTreeParser;
import org.eclipse.jgit.treewalk.TreeWalk;
import org.eclipse.jgit.util.io.NullOutputStream;
import org.unidal.helper.Files;
import org.unidal.helper.Files.Policy;

import org.unidal.cat.Cat;
import org.unidal.cat.message.Message;
import org.unidal.cat.message.Transaction;

public class GitRepositories {
	public static RepositoryHelper at(File repositoryDir) throws Exception {
		return new RepositoryHelper(repositoryDir);
	}

	public static RepositoryHelper at(String repositoryDir) throws Exception {
		return new RepositoryHelper(new File(repositoryDir));
	}

	public static class RepositoryHelper {
		private File m_repositoryBase;

		private Git m_git;

		private String m_uri;

		private ProgressMonitor m_progressMonitor = NullProgressMonitor.INSTANCE;

		public RepositoryHelper(File repositoryBase) throws Exception {
			m_repositoryBase = repositoryBase.getCanonicalFile();
		}

		public RepositoryHelper addAll() throws Exception {
			try {
				m_git.add().addFilepattern(".").call();
			} catch (JGitInternalException e) {
				Throwable cause = e.getCause();

				if (cause instanceof LockFailedException) {
					File lock = new File(m_git.getRepository().getDirectory(), "index.lock");

					lock.delete();

					// retry
					m_git.add().addFilepattern(".").call();
				}
			}

			return this;
		}

		public RepositoryHelper addFile(String path, String content) throws Exception {
			Files.forIO().writeTo(new File(m_repositoryBase, path), content);
			m_git.add().addFilepattern(path).call();
			return this;
		}

		public RepositoryHelper addPath(String path) throws Exception {
			m_git.add().addFilepattern(path).call();
			return this;
		}

		public RepositoryHelper clean() throws Exception {
			m_git.clean().setIgnore(true).call();
			return this;
		}

		public RepositoryHelper clear() {
			Cat.logError(new Exception("Clear the respository at " + m_repositoryBase));

			Files.forDir().delete(new File(m_repositoryBase + ".lock"));
			Files.forDir().delete(m_repositoryBase, true);
			return this;
		}

		public RepositoryHelper clone(boolean withHistory) throws Exception {
			if (m_uri == null) {
				throw new IllegalStateException("No remote uri was set, please call withUri(uri) fist!");
			}

			File lockFile = new File(m_repositoryBase + ".lock");

			if (lockFile.exists()) {
				// clear the corrupted repository first
				clear();
			}

			lock(lockFile);

			m_git = null;

			// shallow clone is only support by shell script right now
			if (!withHistory && shellCloneShallow()) {
				m_git = Git.open(m_repositoryBase);
			}

			if (m_git == null) {
				Transaction t = Cat.newTransaction("Git", "GitClone");

				t.addData("uri", m_uri);

				try {
					m_git = Git.cloneRepository().setBranch("master") //
					      .setDirectory(m_repositoryBase) //
					      .setURI(m_uri).setProgressMonitor(m_progressMonitor).call();

					t.setStatus(Message.SUCCESS);
				} catch (Exception e) {
					t.setStatus(e);
					throw e;
				} finally {
					t.complete();
				}
			}

			unlock(lockFile);

			return this;
		}

		public RepositoryHelper commit(String message) throws Exception {
			m_git.commit().setMessage(message).setAll(true).call();
			return this;
		}

		public RepositoryHelper config(String section, Map<String, String> pairs) throws Exception {
			StoredConfig config = m_git.getRepository().getConfig();

			for (Map.Entry<String, String> e : pairs.entrySet()) {
				config.setString(section, null, e.getKey(), e.getValue());
			}

			config.save();
			return this;
		}

		public RepositoryHelper config(String section, String subsection, String key, String value) throws Exception {
			StoredConfig config = m_git.getRepository().getConfig();

			config.setString(section, subsection, key, value);
			config.save();
			return this;
		}

		public List<File> diff(String baseline) throws Exception {
			Repository repo = m_git.getRepository();
			ObjectReader reader = repo.newObjectReader();
			CanonicalTreeParser oldTreePraser = new CanonicalTreeParser();
			CanonicalTreeParser newTreeParser = new CanonicalTreeParser();

			newTreeParser.reset(reader, repo.resolve("HEAD^{tree}"));
			oldTreePraser.reset(reader, repo.resolve(baseline + "^{tree}"));

			List<DiffEntry> diffs = m_git.diff().setNewTree(newTreeParser).setOldTree(oldTreePraser).call();

			reader.close();

			System.out.println(diffs.size());
			return null;
		}

		private boolean executeScript(String name, String script) {
			CommandLine cmd = CommandLine.parse(script);
			ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
			PumpStreamHandler handler = new PumpStreamHandler(out);
			DefaultExecutor executor = new DefaultExecutor();

			executor.setStreamHandler(handler);
			executor.setExitValue(0);

			long start = System.currentTimeMillis();
			Transaction t = Cat.newTransaction("Git", name);

			System.out.println("Executing script " + script);
			t.addData("script", script);

			try {
				executor.execute(cmd);

				t.setStatus(Message.SUCCESS);
				return true;
			} catch (Throwable e) {
				t.setStatus(e);
				Cat.logError(e);
				return false;
			} finally {
				t.complete();
				System.out.println(out.toString());
				System.out.println(String.format("Executed in %s seconds.", (System.currentTimeMillis() - start) / 1000L));
			}
		}

		/**
		 * @see https://github.com/gitblit/gitblit/blob/master/src/main/java/com/gitblit/utils/JGitUtils.java#getFilesInCommit
		 * @param commit
		 * @return
		 * @throws Exception
		 */
		public List<String> files(String commit) throws Exception {
			List<String> list = new ArrayList<String>();
			Repository repository = m_git.getRepository();
			ObjectId id = repository.resolve(commit == null ? "HEAD" : commit);
			RevWalk rw = new RevWalk(repository);
			RevCommit rc = rw.parseCommit(id);

			if (rc.getParentCount() == 0) { // initial commit
				TreeWalk tw = new TreeWalk(repository);

				try {
					tw.reset();
					tw.setRecursive(true);
					tw.addTree(rc.getTree());

					while (tw.next()) {
						list.add(tw.getPathString());
					}
				} finally {
					tw.close();
				}
			} else {
				RevCommit parent = rw.parseCommit(rc.getParent(0).getId());
				DiffFormatter df = new DiffFormatter(NullOutputStream.INSTANCE);

				try {
					df.setRepository(repository);
					df.setDiffComparator(RawTextComparator.DEFAULT);
					df.setDetectRenames(true);

					List<DiffEntry> diffs = df.scan(parent.getTree(), rc.getTree());

					for (DiffEntry diff : diffs) {
						list.add(diff.getNewPath());
					}
				} finally {
					df.close();
				}
			}

			rw.close();
			return list;
		}

		public RepositoryHelper gc() throws Exception {
			m_git.gc().call();
			return this;
		}

		public File getRepositoryDir() {
			return m_git.getRepository().getWorkTree();
		}

		public String head() throws Exception {
			try {
				Iterable<RevCommit> commits = m_git.log().setMaxCount(1).call();

				for (RevCommit commit : commits) {
					return commit.name();
				}
			} catch (NoHeadException e) {
			}

			return "";
		}

		public RepositoryHelper init() throws Exception {
			m_git = Git.init().setDirectory(m_repositoryBase).call();
			m_uri = m_repositoryBase.toURI().toString();
			return this;
		}

		private void lock(File lockFile) throws IOException {
			String ts = String.valueOf(System.currentTimeMillis());

			Files.forIO().writeTo(lockFile, ts);
		}

		public RepositoryHelper open(boolean initIfNotExist) throws Exception {
			if (new File(m_repositoryBase, ".git").isDirectory()) {
				m_git = Git.open(m_repositoryBase);
				m_uri = m_repositoryBase.toURI().toString();
			} else if (initIfNotExist) {
				m_repositoryBase.mkdirs();

				m_git = Git.init().setDirectory(m_repositoryBase).call();
				m_uri = m_repositoryBase.toURI().toString();
			} else {
				throw new IOException(String.format("No git repository found at %s!", m_repositoryBase));
			}

			return this;
		}

		public RepositoryHelper pull() throws Exception {
			try {
				m_git.pull().setProgressMonitor(m_progressMonitor).call();
			} catch (Exception e) {
				// fall back to shell script
				if (!shellPull()) {
					throw e;
				}
			}

			return this;
		}

		public RepositoryHelper pullFrom(RepositoryHelper child, String toPath) throws Exception {
			// ideally subtree should be used here, but it's not supported yet
			File src = child.getRepositoryDir();
			File dst = new File(m_repositoryBase, toPath);

			Files.forDir().delete(dst, true);
			Files.forDir().copyDir(src, dst, new Policy() {
				@Override
				public boolean apply(String path) {
					return !path.endsWith(".git");
				}
			});

			return this;
		}

		public boolean pullSafely() {
			try {
				PullResult result = m_git.pull().setProgressMonitor(m_progressMonitor).call();
				MergeStatus status = result.getMergeResult().getMergeStatus();

				return status == MergeStatus.ALREADY_UP_TO_DATE || status == MergeStatus.FAST_FORWARD
				      || status == MergeStatus.FAST_FORWARD_SQUASHED;
			} catch (Exception e) {
				// commit is not included in the shallow clone, it's okay
				if (e.getMessage().startsWith("Missing commit")) {
					return true;
				}

				Cat.logError(e);
				return false;
			}
		}

		public RepositoryHelper reset(String ref) throws Exception {
			m_git.reset().setRef(ref).setMode(ResetType.HARD).call();
			return this;
		}

		private boolean shellCloneShallow() {
			String uri = m_uri;

			// git does not recognize uri like 'file:/data/...'
			if (uri.startsWith("file:/") && !uri.startsWith("file:///")) {
				uri = "file://" + uri.substring(5);
			}

			String script = String.format("/usr/bin/git clone --depth=1 %s %s", uri, m_repositoryBase.getPath());

			return executeScript("ShellCloneShallow", script);
		}

		private boolean shellPull() {
			String script = String.format("/usr/bin/git pull");

			return executeScript("ShellPull", script);
		}

		public Status status() throws Exception {
			return m_git.status().call();
		}
		
		public RepositoryHelper tag(String name) throws Exception {
			m_git.tag().setName(name).setForceUpdate(true).call();
			return this;
		}

		private void unlock(File lockFile) {
			Files.forDir().delete(lockFile);
		}

		public boolean validate() {
			File gitDir = new File(m_repositoryBase, ".git");
			File lockFile = new File(m_repositoryBase + ".lock");

			if (!gitDir.isDirectory()) {
				return false;
			}

			if (lockFile.exists()) {
				return false;
			}

			String[] files = m_repositoryBase.list();

			if (files == null || files.length == 1) {
				return false;
			}

			return true;
		}

		public RepositoryHelper withProgressMonitor(ProgressMonitor progressMonitor) {
			m_progressMonitor = progressMonitor;
			return this;
		}

		public RepositoryHelper withUri(String uri) {
			m_uri = uri;
			return this;
		}
	}
}
