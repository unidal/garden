package com.dianping.garden.toolkit.page.home;

import com.dianping.garden.toolkit.ToolkitPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<ToolkitPage, Action> {
	private ToolkitPage m_page;

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
	public ToolkitPage getPage() {
		return m_page;
	}

	@Override
	public void setPage(String page) {
		m_page = ToolkitPage.getByName(page, ToolkitPage.HOME);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
	}
}
