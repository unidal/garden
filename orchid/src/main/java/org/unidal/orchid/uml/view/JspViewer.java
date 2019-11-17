package org.unidal.orchid.uml.view;

import org.unidal.lookup.annotation.Named;
import org.unidal.web.mvc.view.BaseJspViewer;

import org.unidal.orchid.uml.UmlPage;

@Named
public class JspViewer extends BaseJspViewer<UmlPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		Action action = model.getAction();

		switch (action) {
		case VIEW:
			return JspFile.VIEW.getPath();
		}

		throw new RuntimeException("Unknown action: " + action);
	}
}
