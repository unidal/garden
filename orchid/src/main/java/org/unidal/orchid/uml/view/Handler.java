package org.unidal.orchid.uml.view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.unidal.cat.Cat;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.diagram.DiagramService;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.service.DiagramGenerator;
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
	private DiagramService m_diagramService;

	@Inject
	private JspViewer m_jspViewer;

	@Override
	@PayloadMeta(Payload.class)
	@InboundActionMeta(name = "view")
	public void handleInbound(Context ctx) throws ServletException, IOException {
		// display only, no action here
	}

	@Override
	@OutboundActionMeta(name = "view")
	public void handleOutbound(Context ctx) throws ServletException, IOException {
		Model model = new Model(ctx);
		Payload payload = ctx.getPayload();
		Action action = payload.getAction();

		model.setAction(action);
		model.setPage(UmlPage.VIEW);

		switch (action) {
		case VIEW:
			showImage(ctx, model);
			break;
		case WATCH:
			handleWatch(ctx, model);
			break;
		case STATUS:
			handleStatus(ctx, model);
			break;
		}

		if (!ctx.isProcessStopped()) {
			m_jspViewer.view(ctx, model);
		}
	}

	private void handleStatus(Context ctx, Model model) throws IOException {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String diagram = payload.getDiagram();
		String checksum = payload.getChecksum();

		if (diagram != null && diagram.length() > 0) {
			try {
				long timeoutInMillis = 30000; // 30 seconds
				String current = m_diagramService.watchDiagram(ctx.getContext(), product, diagram, checksum,
						timeoutInMillis);

				if (current != null) {
					DiagramModel d = m_diagramService.getDiagram(ctx.getContext(), product, diagram);

					if (d != null) {
						synchronized (d) {
							byte[] data = m_diagramGenerator.generate(d.getContent(), "svg");

							if (data != null) {
								String value = new String(data, "utf-8");

								if (value.startsWith("data:")) {
									ctx.sendJson("checksum", current, "src", value);
								} else {
									ctx.sendJson("checksum", current, "svg", value);
								}

								return;
							}
						}
					}
				}
			} catch (InterruptedException e) {
				// ignore it
			}

			ctx.sendError(HttpServletResponse.SC_NOT_MODIFIED, "Not Modified!");
		}
	}

	private void handleWatch(Context ctx, Model model) throws IOException {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String diagram = payload.getDiagram();
		DiagramModel d = m_diagramService.getDiagram(ctx.getContext(), product, diagram);

		if (d != null) {
			synchronized (d) {
				byte[] data = m_diagramGenerator.generate(d.getContent(), "svg");

				if (data != null) {
					String value = new String(data, "utf-8");

					if (value.startsWith("data:")) {
						model.setSrc(value);
					} else {
						model.setSvg(value);
					}
				}
			}

			model.setChecksum(d.getChecksum());
		}
	}

	private void showImage(Context ctx, Model model) throws IOException {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String diagram = payload.getDiagram();
		String type = payload.getType();
		HttpServletResponse res = ctx.getHttpServletResponse();

		if (diagram != null && diagram.length() > 0) {
			try {
				DiagramModel d = m_diagramService.getDiagram(ctx.getContext(), product, diagram);
				String content = d.getContent();

				m_diagramGenerator.generate(ctx.getHttpServletResponse(), content, type);
				ctx.stopProcess();
			} catch (IOException e) {
				throw e;
			} catch (Throwable e) {
				Cat.logError(e);
			}
		} else {
			res.sendError(404, "UML Not Found(" + product + ":" + diagram + ")!");
		}
	}
}
