package org.unidal.orchid.library.version;

public enum JspFile {
	VIEW("/jsp/library/version.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
