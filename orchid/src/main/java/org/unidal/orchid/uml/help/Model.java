package org.unidal.orchid.uml.help;

import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.ViewModel;

public class Model extends ViewModel<UmlPage, Action, Context> {
	public Model(Context ctx) {
		super(ctx);
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}
}
