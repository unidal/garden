package org.unidal.orchid.uml.edit;

import java.util.List;

import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.ViewModel;

public class Model extends ViewModel<UmlPage, Action, Context> {
	private String m_uml;

	private String m_svg;

	private String m_src;

	private List<String> m_umlFiles;

	private String m_umlFile;

	private boolean m_error;

	private String m_message;

	private String m_editStyle;

	private List<String> m_products;

	private String m_product;

	public Model(Context ctx) {
		super(ctx);

		m_error = ctx.isError();
		m_message = ctx.getMessage();
		m_umlFile = ctx.getUmlFile();
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}

	public String getEditStyle() {
		return m_editStyle;
	}

	public String getMessage() {
		return m_message;
	}

	public String getProduct() {
		return m_product;
	}

	public List<String> getProducts() {
		return m_products;
	}

	public String getSrc() {
		return m_src;
	}

	public String getSvg() {
		return m_svg;
	}

	public String getUml() {
		return m_uml;
	}

	public String getUmlFile() {
		return m_umlFile;
	}

	public List<String> getUmlFiles() {
		return m_umlFiles;
	}

	public boolean isError() {
		return m_error;
	}

	public void setEditStyle(String editStyle) {
		m_editStyle = editStyle;
	}

	public void setError(boolean error) {
		m_error = error;
	}

	public void setMessage(String message) {
		m_message = message;
	}

	public void setProduct(String product) {
		m_product = product;
	}

	public void setProducts(List<String> products) {
		m_products = products;
	}

	public void setSrc(String src) {
		m_src = src;
	}

	public void setSvg(String svg) {
		m_svg = svg;
	}

	public void setUml(String uml) {
		m_uml = uml;
	}

	public void setUmlFile(String umlFile) {
		m_umlFile = umlFile;
	}

	public void setUmlFiles(List<String> umlFiles) {
		m_umlFiles = umlFiles;
	}
}
