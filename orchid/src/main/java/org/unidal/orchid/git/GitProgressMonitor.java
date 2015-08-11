package org.unidal.orchid.git;

import java.util.concurrent.TimeUnit;

import org.codehaus.plexus.logging.LogEnabled;
import org.codehaus.plexus.logging.Logger;
import org.eclipse.jgit.lib.BatchingProgressMonitor;

public class GitProgressMonitor extends BatchingProgressMonitor implements LogEnabled {
	private Logger m_logger;

	public GitProgressMonitor() {
		setDelayStart(2, TimeUnit.SECONDS);
	}

	@Override
	public void enableLogging(Logger logger) {
		m_logger = logger;
	}

	private void info(String pattern, Object... args) {
		if (args.length == 0) {
			m_logger.info(pattern);
		} else {
			m_logger.info(String.format(pattern, args));
		}
	}

	private void log(String taskName, int cmp, int totalWork, int pcnt, boolean isEnd) {
		StringBuilder sb = new StringBuilder(256);

		sb.append(taskName);
		sb.append(": ");

		while (sb.length() < 25) {
			sb.append(' ');
		}

		if (pcnt < 10) {
			sb.append(' ');
		}

		if (pcnt < 100) {
			sb.append(' ');
		}

		sb.append(pcnt);
		sb.append("% (").append(cmp).append('/').append(totalWork).append(')');

		if (isEnd) {
			sb.append('\n');
		}

		info(sb.toString());
	}

	@Override
	protected void onEndTask(String taskName, int workCurr) {
		log(taskName, workCurr, -1, -1, true);
	}

	@Override
	protected void onEndTask(String taskName, int cmp, int totalWork, int pcnt) {
		log(taskName, cmp, totalWork, pcnt, true);
	}

	@Override
	protected void onUpdate(String taskName, int workCurr) {
		log(taskName, workCurr, -1, -1, false);
	}

	@Override
	protected void onUpdate(String taskName, int cmp, int totalWork, int pcnt) {
		log(taskName, cmp, totalWork, pcnt, false);
	}
}