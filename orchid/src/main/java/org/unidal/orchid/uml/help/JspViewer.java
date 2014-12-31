package org.unidal.orchid.uml.help;

import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.view.BaseJspViewer;

public class JspViewer extends BaseJspViewer<UmlPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		Action action = model.getAction();

		switch (action) {
		case VIEW:
			String pageName = ctx.getPayload().getPageName();

			return String.format("/jsp/help/%s.jsp", pageName);
		}

		throw new RuntimeException("Unknown action: " + action);
	}
}
