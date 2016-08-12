package org.unidal.orchid.uml.upload;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;

import org.unidal.lookup.annotation.Inject;
import org.unidal.orchid.service.DocumentService;
import org.unidal.orchid.service.MysqlDocumentService;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;

import com.dianping.cat.Cat;

public class Handler implements PageHandler<Context> {
	@Inject
	private JspViewer m_jspViewer;

	@Inject(MysqlDocumentService.ID)
	private DocumentService m_documentService;

	@Override
	@PayloadMeta(Payload.class)
	@InboundActionMeta(name = "upload")
	public void handleInbound(Context ctx) throws ServletException, IOException {
		if (!ctx.hasErrors()) {
			Payload payload = ctx.getPayload();
			String product = payload.getProduct();
			Map<String, byte[]> map = payload.getContentMap();

			try {
				for (Map.Entry<String, byte[]> e : map.entrySet()) {
					String id = e.getKey();
					String content = new String(e.getValue(), "utf-8");

					m_documentService.storeDocument(product, id, content);
				}
			} catch (Exception e) {
				Cat.logError(e);
				ctx.addError("upload.error", e);
			}
		}
	}

	@Override
	@OutboundActionMeta(name = "upload")
	public void handleOutbound(Context ctx) throws ServletException, IOException {
		Model model = new Model(ctx);

		model.setAction(Action.VIEW);
		model.setPage(UmlPage.UPLOAD);

		if (!ctx.isProcessStopped()) {
			m_jspViewer.view(ctx, model);
		}
	}
}
