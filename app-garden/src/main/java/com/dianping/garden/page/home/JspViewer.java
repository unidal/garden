package com.dianping.garden.page.home;

import com.dianping.garden.GardenPage;
import com.site.web.mvc.view.BaseJspViewer;

public class JspViewer extends
		BaseJspViewer<GardenPage, Action, Context, Model> {
	@Override
	protected String getJspFilePath(Context ctx, Model model) {
		return JspFile.HOME.getPath();
	}
}
