package org.unidal.orchid.uml.view;

public enum JspFile {
	VIEW("/jsp/uml/view.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
