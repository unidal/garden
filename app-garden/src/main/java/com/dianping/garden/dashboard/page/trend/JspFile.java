package com.dianping.garden.dashboard.page.trend;

public enum JspFile {
	TREND("/jsp/dashboard/trend.jsp"),

	;

	private String m_path;

	private JspFile(String path) {
		m_path = path;
	}

	public String getPath() {
		return m_path;
	}
}
