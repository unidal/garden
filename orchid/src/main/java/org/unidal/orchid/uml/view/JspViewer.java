package org.unidal.orchid.uml.view;

import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.view.BaseJspViewer;

@Named
public class JspViewer extends BaseJspViewer<UmlPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		return JspFile.VIEW.getPath();
	}
}
