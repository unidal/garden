package com.dianping.garden.dashboard.page.home;

import com.dianping.garden.dashboard.DashboardPage;
import org.unidal.web.mvc.view.BaseJspViewer;

public class JspViewer extends
		BaseJspViewer<DashboardPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		return JspFile.HOME.getPath();
	}
}
