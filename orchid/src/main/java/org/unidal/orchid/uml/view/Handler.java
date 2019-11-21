package org.unidal.orchid.uml.view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.unidal.cat.Cat;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.service.DocumentServiceManager;
import org.unidal.orchid.service.UmlService;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;

@Named
public class Handler implements PageHandler<Context> {
	@Inject
	private UmlService m_uml;

	@Inject
	private DocumentServiceManager m_manager;

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

		model.setAction(Action.VIEW);
		model.setPage(UmlPage.VIEW);

		if (payload.isWatch()) {
			handleWatch(ctx, model);
		} else {
			showImage(ctx, model);
		}

		if (!ctx.isProcessStopped()) {
			m_jspViewer.view(ctx, model);
		}
	}

	private void handleWatch(Context ctx, Model model) throws IOException {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String path = payload.getPath();
		String checksum = payload.getChecksum();

		if (path != null && path.length() > 0) {
			long timeoutInMillis = 3000;
			String current = m_manager.getDocumentService().watch(product, path, checksum, timeoutInMillis);

			if (current != null) {
				ctx.sendPlainText(current);
				return;
			} else {
				ctx.sendError(HttpServletResponse.SC_NOT_MODIFIED, "Not Modified!");
			}
		}
	}

	private void showImage(Context ctx, Model model) throws IOException {
		Payload payload = ctx.getPayload();
		String product = payload.getProduct();
		String path = payload.getPath();
		String type = payload.getType();
		HttpServletResponse res = ctx.getHttpServletResponse();

		if (path != null && path.length() > 0) {
			try {
				String uml = m_manager.getDocumentService().getDocument(product, path);

				res.setContentType(m_uml.getContextType(uml, type));
				type = m_uml.getImageType(type);

				byte[] image = m_uml.generateImage(uml, type);

				if (image != null) {
					res.setContentLength(image.length);
					res.getOutputStream().write(image);
				} else {
					res.sendError(400, "UML is incompleted!");
				}
			} catch (IOException e) {
				throw e;
			} catch (Throwable e) {
				Cat.logError(e);
			}
		} else {
			res.sendError(404, "UML Not Found(" + product + ":" + path + ")!");
		}

		ctx.stopProcess();
	}
}
