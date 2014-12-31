package org.unidal.orchid.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.orchid.uml.UmlModule;

import org.unidal.lookup.configuration.Component;
import org.unidal.web.configuration.AbstractWebComponentsConfigurator;

class WebComponentConfigurator extends AbstractWebComponentsConfigurator {
	@SuppressWarnings("unchecked")
	@Override
	public List<Component> defineComponents() {
		List<Component> all = new ArrayList<Component>();

		defineModuleRegistry(all, UmlModule.class, UmlModule.class);

		return all;
	}
}
