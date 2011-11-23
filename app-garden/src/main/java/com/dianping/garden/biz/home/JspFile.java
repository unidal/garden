package com.dianping.garden.biz.home;

public enum JspFile {
	HOME("/jsp/home/home.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
