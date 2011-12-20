package com.dianping.garden.toolkit;

import com.site.web.mvc.Page;
import com.site.web.mvc.annotation.ModuleMeta;

public enum ToolkitPage implements Page {

   QUERY("query", "DB Query", true),

	;

	private String m_name;

	private String m_description;

	private boolean m_realPage;

	private ToolkitPage(String name, String description, boolean realPage) {
		m_name = name;
		m_description = description;
		m_realPage = realPage;
	}

	public static ToolkitPage getByName(String name, ToolkitPage defaultPage) {
		for (ToolkitPage action : ToolkitPage.values()) {
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

	public String getModuleName() {
		ModuleMeta meta = ToolkitModule.class.getAnnotation(ModuleMeta.class);

		if (meta != null) {
			return meta.name();
		} else {
			return null;
		}
	}

	public boolean isRealPage() {
		return m_realPage;
	}

	public ToolkitPage[] getValues() {
		return ToolkitPage.values();
	}
}
