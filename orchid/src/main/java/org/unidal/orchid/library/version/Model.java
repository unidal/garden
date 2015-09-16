package org.unidal.orchid.library.version;

import java.util.List;

import org.unidal.orchid.library.LibraryPage;
import org.unidal.orchid.library.entity.Library;
import org.unidal.web.mvc.ViewModel;
import org.unidal.web.mvc.view.annotation.EntityMeta;
import org.unidal.web.mvc.view.annotation.ModelMeta;

@ModelMeta("model")
public class Model extends ViewModel<LibraryPage, Action, Context> {
	@EntityMeta(multiple = true)
	private List<Library> m_libraries;

	private String m_xml;

	public Model(Context ctx) {
		super(ctx);
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}

	public List<Library> getLibraries() {
		return m_libraries;
	}

	public String getXml() {
		return m_xml;
	}

	public void setLibraries(List<Library> libraries) {
		m_libraries = libraries;
	}

	public void setXml(String xml) {
		m_xml = xml;
	}
}
