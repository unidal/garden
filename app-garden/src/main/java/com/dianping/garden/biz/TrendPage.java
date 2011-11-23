package com.dianping.garden.biz;

import com.site.web.mvc.Page;

public enum TrendPage implements Page {
	HOME("home", "Home", true),
	
	TRENDS("trends", "Trends", true),
	
	;

	private String m_name;

	private String m_description;

	private boolean m_realPage;

	private TrendPage(String name, String description, boolean realPage) {
		m_name = name;
		m_description = description;
		m_realPage = realPage;
	}

	public static TrendPage getByName(String name, TrendPage defaultPage) {
		for (TrendPage action : TrendPage.values()) {
			if (action.getName().equals(name)) {
				return action;
			}
		}

		return defaultPage;
	}

	public String getName() {
		return m_name;
	}

	public String getDescription() {
		return m_description;
	}

	public boolean isRealPage() {
		return m_realPage;
	}

	public TrendPage[] getValues() {
		return TrendPage.values();
	}
}
