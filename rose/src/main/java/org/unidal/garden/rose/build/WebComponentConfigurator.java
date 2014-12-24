package org.unidal.garden.rose.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.garden.rose.query.QueryModule;

import org.unidal.lookup.configuration.Component;
import org.unidal.web.configuration.AbstractWebComponentsConfigurator;

class WebComponentConfigurator extends AbstractWebComponentsConfigurator {
	@SuppressWarnings("unchecked")
	@Override
	public List<Component> defineComponents() {
		List<Component> all = new ArrayList<Component>();

		defineModuleRegistry(all, QueryModule.class, QueryModule.class);

		return all;
	}
}
