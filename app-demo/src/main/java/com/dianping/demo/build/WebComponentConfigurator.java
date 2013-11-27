package com.dianping.demo.build;

import java.util.ArrayList;
import java.util.List;

import com.dianping.demo.doc.DocModule;

import com.site.lookup.configuration.Component;
import com.site.web.configuration.AbstractWebComponentsConfigurator;

class WebComponentConfigurator extends AbstractWebComponentsConfigurator {
	@SuppressWarnings("unchecked")
	@Override
	public List<Component> defineComponents() {
		List<Component> all = new ArrayList<Component>();

		defineModuleRegistry(all, DocModule.class, DocModule.class);

		return all;
	}
}
