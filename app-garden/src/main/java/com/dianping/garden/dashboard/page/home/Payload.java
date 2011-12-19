package com.dianping.garden.dashboard.page.home;

import com.dianping.garden.dashboard.DashboardPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<DashboardPage, Action> {
	private DashboardPage m_page;

	@FieldMeta("op")
	private Action m_action;

	public void setAction(Action action) {
		m_action = action;
	}

	@Override
	public Action getAction() {
		return m_action;
	}

	@Override
	public DashboardPage getPage() {
		return m_page;
	}

	@Override
	public void setPage(String page) {
		m_page = DashboardPage.getByName(page, DashboardPage.HOME);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
	}
}