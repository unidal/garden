package com.dianping.garden.dashboard.page.trend;

import com.dianping.garden.dashboard.DashboardPage;
import com.site.web.mvc.view.BaseJspViewer;

public class JspViewer extends BaseJspViewer<DashboardPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		Action action = model.getAction();

		switch (action) {
		case TREND:
			return JspFile.TREND.getPath();
		}

		throw new RuntimeException("Unknown action: " + action);
	}
}
