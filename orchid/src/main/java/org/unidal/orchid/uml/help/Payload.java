package org.unidal.orchid.uml.help;

import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.jsp.function.CodecFunction;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.ActionPayload;
import org.unidal.web.mvc.payload.annotation.FieldMeta;
import org.unidal.web.mvc.payload.annotation.PathMeta;

public class Payload implements ActionPayload<UmlPage, Action> {
	private UmlPage m_page;

	@FieldMeta("op")
	private Action m_action;

	@PathMeta("path")
	private String[] m_pathSections;

	@FieldMeta("type")
	private String m_type;

	@Override
	public Action getAction() {
		return m_action;
	}

	@Override
	public UmlPage getPage() {
		return m_page;
	}

	public String getLanguage() {
		if (m_pathSections.length == 1) {
			return "en";
		} else {
			return m_pathSections[1];
		}
	}

	public String getPageName() {
		if (m_pathSections.length == 0) {
			return "use-case-diagram";
		} else {
			return m_pathSections[0];
		}
	}

	public String getType() {
		return m_type;
	}

	public String getUmlFile() {
		if (m_pathSections.length >= 2 && m_pathSections[1].endsWith(".uml")) {
			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < m_pathSections.length; i++) {
				sb.append('/').append(m_pathSections[i]);
			}

			return CodecFunction.urlDecode(sb.toString());
		} else {
			return null;
		}
	}

	public void setAction(String action) {
		m_action = Action.getByName(action, Action.VIEW);
	}

	@Override
	public void setPage(String page) {
		m_page = UmlPage.getByName(page, UmlPage.HELP);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
		if (m_action == null) {
			m_action = Action.VIEW;
		}
	}
}
