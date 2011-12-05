package com.dianping.garden.page.query;


import com.dianping.garden.GardenPage;
import com.site.web.mvc.view.BaseJspViewer;

public class JspViewer extends BaseJspViewer<GardenPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		Action action = model.getAction();

		switch (action) {
		case MAIN:
			return JspFile.MAIN.getPath();
		}

		throw new RuntimeException("Unknown action: " + action);
	}
}
