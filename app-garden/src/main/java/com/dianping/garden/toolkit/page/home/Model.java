package com.dianping.garden.toolkit.page.home;

import com.dianping.garden.toolkit.ToolkitPage;
import com.site.web.mvc.ViewModel;

public class Model extends ViewModel<ToolkitPage, Action, Context> {
	public Model(Context ctx) {
		super(ctx);
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}
}
