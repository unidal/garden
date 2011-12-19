package com.dianping.garden.view;

import com.dianping.garden.dashboard.DashboardPage;
import com.dianping.garden.toolkit.ToolkitPage;
import com.site.web.mvc.Page;

public class NavigationBar {
	public Page[] getVisiblePages() {
		return new Page[] {

		DashboardPage.HOME,

		DashboardPage.TREND,

		ToolkitPage.QUERY,

		};
	}
}
