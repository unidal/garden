package com.dianping.demo.doc.page.home;

import com.dianping.demo.doc.DocPage;
import com.site.web.mvc.ViewModel;

public class Model extends ViewModel<DocPage, Action, Context> {
	public Model(Context ctx) {
		super(ctx);
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}
}
