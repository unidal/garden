package com.dianping.garden.biz.home;


import com.dianping.garden.biz.TrendPage;
import com.site.web.mvc.view.BaseJspViewer;

public class JspViewer extends BaseJspViewer<TrendPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		return JspFile.HOME.getPath();
	}
}
