package com.dianping.garden.dashboard.page.trend;

public enum JspFile {
	LIST("/jsp/dashboard/trend/list.jsp"),
	
	REFRESH("/jsp/dashboard/trend/refresh.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
