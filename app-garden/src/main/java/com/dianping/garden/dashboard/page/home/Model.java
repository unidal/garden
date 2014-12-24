package com.dianping.garden.dashboard.page.home;

import com.dianping.garden.dashboard.DashboardPage;
import org.unidal.web.mvc.ViewModel;

public class Model extends ViewModel<DashboardPage, Action, Context> {
	public Model(Context ctx) {
		super(ctx);
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}
}
