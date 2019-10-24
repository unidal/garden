package org.unidal.orchid.uml.help;

import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.view.BaseJspViewer;

@Named
public class JspViewer extends BaseJspViewer<UmlPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		Action action = model.getAction();

		switch (action) {
		case VIEW:
			String language = ctx.getPayload().getLanguage();
			String pageName = ctx.getPayload().getPageName();

			return String.format("/jsp/help/%s/%s.jsp", language, pageName);
		}

		throw new RuntimeException("Unknown action: " + action);
	}
}
