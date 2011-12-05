package com.dianping.garden.page.trend;

public enum JspFile {
	LIST("/jsp/trend/list.jsp"),
	
	REFRESH("/jsp/trend/refresh.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
