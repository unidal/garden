package com.dianping.garden.toolkit.page.home;

public enum JspFile {
	VIEW("/jsp/toolkit/home/view.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
