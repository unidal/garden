package com.dianping.garden.biz.home;


import com.dianping.garden.biz.GardenPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<GardenPage, Action> {
	private GardenPage m_page;

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
	public GardenPage getPage() {
		return m_page;
	}

	@Override
	public void setPage(String page) {
		m_page = GardenPage.getByName(page, GardenPage.HOME);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
	}
}