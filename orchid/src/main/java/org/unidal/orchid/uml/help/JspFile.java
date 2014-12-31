package org.unidal.orchid.uml.help;

public enum JspFile {
	VIEW("/jsp/uml/help.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
