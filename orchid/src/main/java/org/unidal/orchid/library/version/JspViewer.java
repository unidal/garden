package org.unidal.orchid.library.version;

import org.unidal.orchid.library.LibraryPage;
import org.unidal.web.mvc.view.BaseJspViewer;

public class JspViewer extends BaseJspViewer<LibraryPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		Action action = model.getAction();

		switch (action) {
		case VIEW:
		case EDIT:
			return JspFile.VIEW.getPath();
		default:
			break;
		}

		throw new RuntimeException("Unknown action: " + action);
	}
}
