package org.unidal.orchid.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.dal.jdbc.configuration.AbstractJdbcResourceConfigurator;
import org.unidal.dal.jdbc.datasource.DataSourceProvider;
import org.unidal.dal.jdbc.datasource.DefaultDataSourceProvider;
import org.unidal.initialization.DefaultModuleManager;
import org.unidal.initialization.ModuleManager;
import org.unidal.lookup.configuration.Component;
import org.unidal.orchid.OrchidModule;
import org.unidal.orchid.WebPageValidator;
import org.unidal.orchid.diagram.DefaultDiagramGenerator;
import org.unidal.orchid.diagram.DefaultDiagramManager;
import org.unidal.orchid.diagram.DefaultDiagramService;
import org.unidal.orchid.diagram.GitBasedDiagramRepository;

public class ComponentsConfigurator extends AbstractJdbcResourceConfigurator {
	@Override
	public List<Component> defineComponents() {
		List<Component> all = new ArrayList<Component>();

		all.add(A(OrchidModule.class));
		all.add(C(ModuleManager.class, DefaultModuleManager.class) //
				.config(E("topLevelModules").value(OrchidModule.ID)));

		all.add(A(DefaultDiagramManager.class));
		all.add(A(DefaultDiagramService.class));

		all.add(A(GitBasedDiagramRepository.class));

		all.add(A(DefaultDiagramGenerator.class));
		
		all.add(A(WebPageValidator.class));

		all.add(C(DataSourceProvider.class, DefaultDataSourceProvider.class) //
				.config(E("datasourceFile").value("datasources.xml"), //
						E("baseDirRef").value("GARDEN_HOME")));

		// Please keep it as last
		all.addAll(new WebComponentConfigurator().defineComponents());

		return all;
	}

	public static void main(String[] args) {
		generatePlexusComponentsXmlFile(new ComponentsConfigurator());
	}
}
