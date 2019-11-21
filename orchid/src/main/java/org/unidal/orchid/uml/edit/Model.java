package org.unidal.orchid.uml.edit;

import java.util.List;

import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.ViewModel;

public class Model extends ViewModel<UmlPage, Action, Context> {
	private List<ProductModel> m_products;

	private String m_product;

	private List<DiagramModel> m_diagrams;

	private String m_diagram;

	private String m_content;

	private String m_editStyle;

	private String m_svg;

	private String m_src;

	private boolean m_error;

	private String m_message;

	public Model(Context ctx) {
		super(ctx);

		m_error = ctx.isError();
		m_message = ctx.getMessage();
		m_diagram = ctx.getDiagram();
	}

	public String getContent() {
		return m_content;
	}

	@Override
	public Action getDefaultAction() {
		return Action.VIEW;
	}

	public String getDiagram() {
		return m_diagram;
	}

	public List<DiagramModel> getDiagrams() {
		return m_diagrams;
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

	public List<ProductModel> getProducts() {
		return m_products;
	}

	public String getSrc() {
		return m_src;
	}

	public String getSvg() {
		return m_svg;
	}

	public boolean isError() {
		return m_error;
	}

	public void setContent(String content) {
		m_content = content;
	}

	public void setDiagram(String diagram) {
		m_diagram = diagram;
	}

	public void setDiagrams(List<DiagramModel> diagrams) {
		m_diagrams = diagrams;
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

	public void setProducts(List<ProductModel> products) {
		m_products = products;
	}

	public void setSrc(String img) {
		m_src = img;
	}

	public void setSvg(String svg) {
		m_svg = svg;
	}
}
