package com.dianping.demo.doc.page.home;

public enum JspFile {
	VIEW("/jsp/doc/home.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
