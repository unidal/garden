package org.unidal.orchid.uml.view;

import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.ViewModel;

public class Model extends ViewModel<UmlPage, Action, Context> {
	private String m_src;

	private String m_svg;

	private String m_checksum;

	public Model(Context ctx) {
		super(ctx);
	}

	public String getChecksum() {
		return m_checksum;
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}

	public String getSrc() {
		return m_src;
	}

	public String getSvg() {
		return m_svg;
	}

	public void setChecksum(String checksum) {
		m_checksum = checksum;
	}

	public void setSrc(String src) {
		m_src = src;
	}

	public void setSvg(String svg) {
		m_svg = svg;
	}
}
