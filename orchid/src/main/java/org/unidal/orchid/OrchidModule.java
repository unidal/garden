package org.unidal.orchid;

import org.unidal.initialization.AbstractModule;
import org.unidal.initialization.Module;
import org.unidal.initialization.ModuleContext;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.service.DiagramGenerator;

@Named(type = Module.class, value = OrchidModule.ID)
public class OrchidModule extends AbstractModule {
	public static final String ID = "orchid";

	@Override
	public Module[] getDependencies(ModuleContext ctx) {
		return null;
	}

	@Override
	protected void execute(ModuleContext ctx) throws Exception {
		DiagramGenerator generator = ctx.lookup(DiagramGenerator.class);
		byte[] content = generator.generate("testdot", "atxt");
		String result = new String(content, "utf-8");

		System.out.println(result);

		if (result != null && result.contains("Error")) {
			ctx.warn("Failed to testdot, the system will be run in downgraded mode, "
			      + "only sequence diagrams will be generated!\r\n"
			      + "Please make sure graphviz is installed, and mare sure file /usr/bin/dot exist!");
		}
	}
}
