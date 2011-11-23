package com.dianping.garden.biz.home;


import com.dianping.garden.biz.TrendPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<TrendPage, Action> {
	private TrendPage m_page;

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
	public TrendPage getPage() {
		return m_page;
	}

	@Override
	public void setPage(String page) {
		m_page = TrendPage.getByName(page, TrendPage.HOME);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
	}
}