package org.unidal.orchid.uml.upload;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;

import org.unidal.lookup.annotation.Inject;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;

public class Handler implements PageHandler<Context> {
	@Inject
	private JspViewer m_jspViewer;

	@Override
	@PayloadMeta(Payload.class)
	@InboundActionMeta(name = "upload")
	public void handleInbound(Context ctx) throws ServletException, IOException {
		if (!ctx.hasErrors()) {
			Payload payload = ctx.getPayload();
			String product = payload.getProduct();
			Map<String, byte[]> map = payload.getContentMap();

			System.out.println(product);
			System.out.println(map);
			
			for (byte[] b: map.values()) {
				System.out.println(new String(b));
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
