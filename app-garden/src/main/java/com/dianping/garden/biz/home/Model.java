package com.dianping.garden.biz.home;


import com.dianping.garden.biz.TrendPage;
import com.site.web.mvc.ViewModel;

public class Model extends ViewModel<TrendPage, Action, Context> {
	public Model(Context ctx) {
		super(ctx);
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}
}
