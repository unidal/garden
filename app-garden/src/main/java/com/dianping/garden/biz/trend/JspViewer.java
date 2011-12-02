package com.dianping.garden.biz.trend;


import com.dianping.garden.biz.GardenPage;
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
