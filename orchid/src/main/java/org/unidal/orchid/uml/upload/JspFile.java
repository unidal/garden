package org.unidal.orchid.uml.upload;

public enum JspFile {
	VIEW("/jsp/uml/upload.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
