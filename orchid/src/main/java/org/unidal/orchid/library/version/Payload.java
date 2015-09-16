package org.unidal.orchid.library.version;

import org.unidal.orchid.library.LibraryPage;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.ActionPayload;
import org.unidal.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<LibraryPage, Action> {
	private LibraryPage m_page;

	@FieldMeta("op")
	private Action m_action;

	@FieldMeta("update")
	private boolean m_update;

	@FieldMeta("xml")
	private String m_xml;

	@Override
	public Action getAction() {
		return m_action;
	}

	@Override
	public LibraryPage getPage() {
		return m_page;
	}

	public String getXml() {
		return m_xml;
	}

	public boolean isUpdate() {
		return m_update;
	}

	public void setAction(String action) {
		m_action = Action.getByName(action, Action.VIEW);
	}

	@Override
	public void setPage(String page) {
		m_page = LibraryPage.getByName(page, LibraryPage.VERSION);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
		if (m_action == null) {
			m_action = Action.VIEW;
		}
	}
}
