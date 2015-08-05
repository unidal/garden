package org.unidal.orchid.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.initialization.DefaultModuleManager;
import org.unidal.initialization.Module;
import org.unidal.initialization.ModuleManager;
import org.unidal.lookup.configuration.AbstractResourceConfigurator;
import org.unidal.lookup.configuration.Component;
import org.unidal.orchid.OrchidModule;
import org.unidal.orchid.service.DefaultUmlService;
import org.unidal.orchid.service.FileStorageService;

public class ComponentsConfigurator extends AbstractResourceConfigurator {
	@Override
	public List<Component> defineComponents() {
		List<Component> all = new ArrayList<Component>();

		all.add(C(Module.class, OrchidModule.ID, OrchidModule.class));
		all.add(C(ModuleManager.class, DefaultModuleManager.class) //
		      .config(E("topLevelModules").value(OrchidModule.ID)));

		all.add(A(DefaultUmlService.class));
		all.add(A(FileStorageService.class));

		// Please keep it as last
		all.addAll(new WebComponentConfigurator().defineComponents());

		return all;
	}

	public static void main(String[] args) {
		generatePlexusComponentsXmlFile(new ComponentsConfigurator());
	}
}
