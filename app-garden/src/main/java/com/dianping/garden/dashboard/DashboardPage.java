package com.dianping.garden.dashboard;

import com.site.web.mvc.Page;
import com.site.web.mvc.annotation.ModuleMeta;

public enum DashboardPage implements Page {
   HOME("home", "home", "Home", true),

   TREND("trend", "trend", "Trends", true);

	private String m_name;
	
	private String m_path;

	private String m_description;

	private boolean m_realPage;

	private DashboardPage(String name, String path, String description, boolean realPage) {
		m_name = name;
		m_path = path;
		m_description = description;
		m_realPage = realPage;
	}

	public static DashboardPage getByName(String name, DashboardPage defaultPage) {
		for (DashboardPage action : DashboardPage.values()) {
			if (action.getName().equals(name)) {
				return action;
			}
		}

		return defaultPage;
	}

	public String getDescription() {
		return m_description;
	}

	public String getModuleName() {
		ModuleMeta meta = DashboardModule.class.getAnnotation(ModuleMeta.class);

		if (meta != null) {
			return meta.name();
		} else {
			return null;
		}
	}

	@Override
	public String getName() {
		return m_name;
	}

	@Override
	public String getPath() {
   	return m_path;
   }

	public DashboardPage[] getValues() {
		return DashboardPage.values();
	}

	public boolean isRealPage() {
		return m_realPage;
	}
}
