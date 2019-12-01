package org.unidal.orchid.uml.edit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.unidal.cat.Cat;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.diagram.DiagramGenerator;
import org.unidal.orchid.diagram.DiagramService;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;

@Named
public class Handler implements PageHandler<Context> {
	@Inject
	private DiagramGenerator m_diagramGenerator;

	@Inject
	private DiagramService m_diagramSerice;

	@Inject
	private JspViewer m_jspViewer;

	private void createDiagram(Context ctx) throws Exception {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String diagram = payload.getDiagram();
		String content = payload.getContent();

		if (!diagram.endsWith(".uml")) {
			ctx.setError(true);
			ctx.setMessage(String.format("Diagram(%s) must be ending with '.uml'.", diagram));
		} else if (!m_diagramSerice.hasDiagram(ctx.getContext(), product, diagram)) {
			StringBuilder message = new StringBuilder(256);
			boolean success = m_diagramSerice.saveDiagram(ctx.getContext(), product, diagram, content);

			ctx.setError(!success);
			ctx.setDiagram(diagram);
			ctx.setMessage(message.toString());
		} else {
			ctx.setError(true);
			ctx.setMessage(String.format("Diagram(%s) is already existed! Please use another one.", diagram));
		}
	}

	@Override
	@PayloadMeta(Payload.class)
	@InboundActionMeta(name = "edit")
	public void handleInbound(Context ctx) throws ServletException, IOException {
		Payload payload = ctx.getPayload();

		try {
			if (payload.isSaveAs()) {
				createDiagram(ctx);
			} else if (payload.isSave()) {
				saveDiagram(ctx);
			} else if (payload.isUpdate()) {
				Model model = new Model(ctx);

				updateDiagram(ctx, model);
			}
		} catch (Exception e) {
			Cat.logError(e);

			ctx.getHttpServletResponse().sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
			ctx.stopProcess();
		}
	}

	@Override
	@OutboundActionMeta(name = "edit")
	public void handleOutbound(Context ctx) throws ServletException, IOException {
		Model model = new Model(ctx);

		model.setAction(Action.VIEW);
		model.setPage(UmlPage.EDIT);

		showPage(ctx, model);

		if (!ctx.isProcessStopped()) {
			m_jspViewer.view(ctx, model);
		}
	}

	private void saveDiagram(Context ctx) throws IOException {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String diagram = payload.getDiagram();
		String content = payload.getContent();

		boolean success = m_diagramSerice.saveDiagram(ctx.getContext(), product, diagram, content);

		if (success) {
			ctx.setMessage("Diagram has been saved successfully!");
		} else {
			ctx.setError(false);
			ctx.setMessage("Unable to save diagram due to no product found!");
		}
	}

	private void showPage(Context ctx, Model model) throws IOException {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct(); 
		String diagram = payload.getDiagram();
		String content = payload.getContent();
		String editStyle = payload.getEditStyle();

		model.setProducts(m_diagramSerice.getProducts(ctx.getContext()));
		model.setProduct(product);
		model.setDiagrams(m_diagramSerice.getDiagrams(ctx.getContext(), product));
		model.setDiagram(diagram);

		if (editStyle == null) {
			model.setEditStyle("height: 500px; width: 320px");
		} else {
			model.setEditStyle(editStyle);
		}

		if (content != null && content.length() > 0) {
			model.setContent(content);
		} else if (diagram != null && diagram.length() > 0) {
			DiagramModel d = m_diagramSerice.getDiagram(ctx.getContext(), product, diagram);

			if (d != null) {
				content = d.getContent();
				model.setContent(content);
			}
		}

		if (content != null) {
			byte[] image = m_diagramGenerator.generate(content, "svg");

			if (image != null) {
				String data = new String(image, "utf-8");

				if (data.startsWith("data:")) {
					model.setSrc(data);
				} else {
					model.setSvg(data);
				}
			}
		}
	}

	private void updateDiagram(Context ctx, Model model) throws Exception {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String diagram = payload.getDiagram();
		String content = payload.getContent();

		m_diagramSerice.updateDiagram(ctx.getContext(), product, diagram, content);
		ctx.stopProcess();
	}
}
