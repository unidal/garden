package com.dianping.garden.view;

import com.dianping.garden.dashboard.DashboardPage;
import com.dianping.garden.toolkit.ToolkitPage;
import org.unidal.web.mvc.Page;

public class NavigationBar {
	public Page[] getVisiblePages() {
		return new Page[] {

		DashboardPage.HOME,

		DashboardPage.TREND,

		ToolkitPage.QUERY,

		};
	}
}
