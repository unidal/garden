package com.dianping.garden.toolkit;

import com.site.web.mvc.Page;
import com.site.web.mvc.annotation.ModuleMeta;

public enum ToolkitPage implements Page {
	QUERY("query", "query", "DB Query", true);

	private String m_name;

	private String m_path;

	private String m_description;

	private boolean m_realPage;

	private ToolkitPage(String name, String path, String description, boolean realPage) {
		m_name = name;
		m_path = path;
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

	@Override
	public String getName() {
		return m_name;
	}

	@Override
	public String getPath() {
		return m_path;
	}

	public ToolkitPage[] getValues() {
		return ToolkitPage.values();
	}

	public boolean isRealPage() {
		return m_realPage;
	}
}
