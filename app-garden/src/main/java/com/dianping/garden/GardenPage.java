package com.dianping.garden;

import com.site.web.mvc.Page;

public enum GardenPage implements Page {
	HOME("home", "Home", true),
	
	TRENDS("trends", "Trends", true),
	
	DB_QUERY("dbquery", "DB Query", true),
	
	;

	private String m_name;

	private String m_description;

	private boolean m_realPage;

	private GardenPage(String name, String description, boolean realPage) {
		m_name = name;
		m_description = description;
		m_realPage = realPage;
	}

	public static GardenPage getByName(String name, GardenPage defaultPage) {
		for (GardenPage action : GardenPage.values()) {
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

	public GardenPage[] getValues() {
		return GardenPage.values();
	}
}
