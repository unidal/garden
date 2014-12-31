package org.unidal.orchid.uml.edit;

public enum JspFile {
	VIEW("/jsp/uml/edit.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
