package com.dianping.garden.toolkit.page.query;

public enum JspFile {
	QUERY("/jsp/toolkit/query.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
