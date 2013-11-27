package com.dianping.demo.doc.page.home;

import com.dianping.demo.doc.DocPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<DocPage, Action> {
	private DocPage m_page;

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
	public DocPage getPage() {
		return m_page;
	}

	@Override
	public void setPage(String page) {
		m_page = DocPage.getByName(page, DocPage.HOME);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
	}
}
