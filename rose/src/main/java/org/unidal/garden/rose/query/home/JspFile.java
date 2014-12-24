package org.unidal.garden.rose.query.home;

public enum JspFile {
	VIEW("/jsp/query/home.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
