package org.unidal.orchid.library.version;

import java.io.IOException;

import javax.servlet.ServletException;

import org.unidal.lookup.annotation.Inject;
import org.unidal.orchid.library.LibraryPage;
import org.unidal.orchid.service.LibraryService;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;

import com.dianping.cat.Cat;

public class Handler implements PageHandler<Context> {
	@Inject
	private LibraryService m_libraryService;

	@Inject
	private JspViewer m_jspViewer;

	@Override
	@PayloadMeta(Payload.class)
	@InboundActionMeta(name = "version")
	public void handleInbound(Context ctx) throws ServletException, IOException {
		if (!ctx.hasErrors()) {
			Payload payload = ctx.getPayload();

			if (payload.getAction() == Action.EDIT) {
				if (payload.isUpdate()) {
					try {
						m_libraryService.update(payload.getXml());
					} catch (Exception e) {
						Cat.logError(e);
						ctx.addError("xml.invalid", e);
					}
				}
			}
		}
	}

	@Override
	@OutboundActionMeta(name = "version")
	public void handleOutbound(Context ctx) throws ServletException, IOException {
		Model model = new Model(ctx);
		Payload payload = ctx.getPayload();
		Action action = payload.getAction();

		model.setAction(action);
		model.setPage(LibraryPage.VERSION);

		switch (action) {
		case VIEW:
			model.setLibraries(m_libraryService.list());
			break;
		case EDIT:
			model.setXml(m_libraryService.getXml());
			break;
		}

		if (!ctx.isProcessStopped()) {
			m_jspViewer.view(ctx, model);
		}
	}
}
