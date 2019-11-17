package org.unidal.orchid.uml.view;

import java.util.List;

import org.unidal.helper.Joiners;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.ActionPayload;
import org.unidal.web.mvc.payload.annotation.FieldMeta;
import org.unidal.web.mvc.payload.annotation.PathMeta;

public class Payload implements ActionPayload<UmlPage, Action> {
	private UmlPage m_page;

	@FieldMeta("op")
	private Action m_action;

	@FieldMeta("type")
	private String m_type;

	@PathMeta("path")
	private List<String> m_path;

	@Override
	public Action getAction() {
		return m_action;
	}

	@Override
	public UmlPage getPage() {
		return m_page;
	}

	public String getPath() {
		if (m_path != null && m_path.size() > 1) {
			String path = Joiners.by('/').join(m_path.subList(1, m_path.size()));

			return path;
		} else {
			return null;
		}
	}

	public String getProduct() {
		if (m_path != null && m_path.size() > 0) {
			return m_path.get(0);
		} else {
			return "default";
		}
	}

	public String getType() {
		return m_type;
	}

	public void setAction(String action) {
		m_action = Action.getByName(action, Action.VIEW);
	}

	@Override
	public void setPage(String page) {
		m_page = UmlPage.getByName(page, UmlPage.VIEW);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
		if (m_action == null) {
			m_action = Action.VIEW;
		}
	}
}
