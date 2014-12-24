package com.dianping.garden.build;

import java.util.ArrayList;
import java.util.List;

import com.dianping.garden.dashboard.DashboardModule;
import com.dianping.garden.toolkit.ToolkitModule;
import org.unidal.lookup.configuration.Component;
import org.unidal.web.configuration.AbstractWebComponentsConfigurator;

public class ComponentsConfigurator extends AbstractWebComponentsConfigurator {
	@Override
	@SuppressWarnings("unchecked")
	public List<Component> defineComponents() {
		List<Component> all = new ArrayList<Component>();

		all.addAll(new DatabaseConfigurator().defineComponents());
		all.addAll(new WdbcConfigurator().defineComponents());

		defineModuleRegistry(all, DashboardModule.class, DashboardModule.class, ToolkitModule.class);

		return all;
	}

	public static void main(String[] args) {
		generatePlexusComponentsXmlFile(new ComponentsConfigurator());
	}
}
