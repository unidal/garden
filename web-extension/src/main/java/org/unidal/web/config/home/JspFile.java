package org.unidal.web.config.home;

public enum JspFile {
	VIEW("/jsp/config/home.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
