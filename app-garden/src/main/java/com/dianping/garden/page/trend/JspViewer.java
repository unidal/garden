package com.dianping.garden.page.trend;


import com.dianping.garden.GardenPage;
import com.site.web.mvc.view.BaseJspViewer;

public class JspViewer extends BaseJspViewer<GardenPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		Action action = model.getAction();

		switch (action) {
		case LIST:
			return JspFile.LIST.getPath();
		case REFRESH:
			return JspFile.REFRESH.getPath();
		}

		throw new RuntimeException("Unknown action: " + action);
	}
}
