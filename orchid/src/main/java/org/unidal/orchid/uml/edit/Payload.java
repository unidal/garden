package org.unidal.orchid.uml.edit;

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

	@FieldMeta("update")
	private boolean m_update;

	@FieldMeta("save")
	private boolean m_save;

	@FieldMeta("saveAs")
	private boolean m_saveAs;

	@FieldMeta("content")
	private String m_content;

	@FieldMeta("es")
	private String m_editStyle;

	@PathMeta("path")
	private List<String> m_path;

	@FieldMeta("product")
	private String m_product;

	@FieldMeta("diagram")
	private String m_diagram;

	@FieldMeta("newfile")
	private String m_newfile;

	@Override
	public Action getAction() {
		return m_action;
	}

	public String getContent() {
		return m_content;
	}

	public String getDiagram() {
		if (m_saveAs) {
			return m_newfile;
		} else if (m_path != null && m_path.size() > 1) {
			String path = Joiners.by('/').join(m_path.subList(1, m_path.size()));

			return path;
		} else {
			return m_diagram;
		}
	}

	public String getEditStyle() {
		return m_editStyle;
	}

	@Override
	public UmlPage getPage() {
		return m_page;
	}

	// used by layout.tag
	public String getPageName() {
		return "edit";
	}

	public String getProduct() {
		if (m_path != null && m_path.size() > 0) {
			return m_path.get(0);
		} else if (m_product != null) {
			return m_product;
		} else {
			return "default";
		}
	}

	public boolean isSave() {
		return m_save;
	}

	public boolean isSaveAs() {
		return m_saveAs;
	}

	public boolean isUpdate() {
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
