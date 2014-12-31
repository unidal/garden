package org.unidal.orchid.uml.edit;

import java.util.List;

import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.ActionPayload;
import org.unidal.web.mvc.payload.annotation.FieldMeta;
import org.unidal.web.mvc.payload.annotation.PathMeta;

public class Payload implements ActionPayload<UmlPage, Action> {
	private UmlPage m_page;

	@FieldMeta("op")
	private Action m_action;

	@FieldMeta("update")
	private String m_update;

	@FieldMeta("saveAs")
	private String m_saveAs;

	@FieldMeta("type")
	private String m_type;

	@FieldMeta("uml")
	private String m_uml;

	@FieldMeta("es")
	private String m_editStyle;

	@FieldMeta("file")
	private String m_file;

	@FieldMeta("newfile")
	private String m_newFile;

	@PathMeta("pathSections")
	private List<String> m_pathSections;

	@Override
	public Action getAction() {
		return m_action;
	}

	public String getEditStyle() {
		return m_editStyle;
	}

	public String getFile() {
		return m_file;
	}

	public String getNewFile() {
		return m_newFile;
	}

	@Override
	public UmlPage getPage() {
		return m_page;
	}

	public List<String> getPathSections() {
		return m_pathSections;
	}

	public String getSaveAs() {
		return m_saveAs;
	}

	public String getType() {
		return m_type;
	}

	public String getUml() {
		return m_uml;
	}

	public String getUpdate() {
		return m_update;
	}

	public void setAction(String action) {
		m_action = Action.getByName(action, Action.VIEW);
	}

	@Override
	public void setPage(String page) {
		m_page = UmlPage.getByName(page, UmlPage.EDIT);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
		if (m_action == null) {
			m_action = Action.VIEW;
		}
	}
}
