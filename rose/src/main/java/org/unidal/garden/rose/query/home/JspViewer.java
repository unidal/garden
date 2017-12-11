package org.unidal.garden.rose.query.home;

import org.unidal.garden.rose.query.QueryPage;
import org.unidal.lookup.annotation.Named;
import org.unidal.web.mvc.view.BaseJspViewer;

@Named
public class JspViewer extends BaseJspViewer<QueryPage, Action, Context, Model> {
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
