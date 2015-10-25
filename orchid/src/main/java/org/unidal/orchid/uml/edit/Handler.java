package org.unidal.orchid.uml.edit;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.unidal.helper.Joiners;
import org.unidal.lookup.annotation.Inject;
import org.unidal.orchid.service.StorageService;
import org.unidal.orchid.service.UmlService;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.jsp.function.CodecFunction;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;

import com.dianping.cat.Cat;

public class Handler implements PageHandler<Context> {
	@Inject
	private UmlService m_uml;

	@Inject
	private StorageService m_storage;

	@Inject
	private JspViewer m_jspViewer;

	private void createUml(Context ctx) throws IOException {
		Payload payload = ctx.getPayload();
		String uml = payload.getUml();
		String umlFile = payload.getNewFile();

		if (!umlFile.endsWith(".uml")) {
			ctx.setError(true);
			ctx.setMessage(String.format("Target UML file(%s) must be ending with '.uml'.", umlFile));
		} else if (m_storage.createUmlFile(umlFile)) {
			StringBuilder message = new StringBuilder(256);
			boolean success = m_uml.updateUml(umlFile, uml, message);

			ctx.setError(!success);
			ctx.setUmlFile(umlFile);
			ctx.setMessage(message.toString());
		} else {
			ctx.setError(true);
			ctx.setMessage(String.format("UML File(%s) is already existed! Please use another one.", umlFile));
		}
	}

	@Override
	@PayloadMeta(Payload.class)
	@InboundActionMeta(name = "edit")
	public void handleInbound(Context ctx) throws ServletException, IOException {
		Payload payload = ctx.getPayload();
		String update = payload.getUpdate();
		String saveAs = payload.getSaveAs();

		try {
			if (saveAs != null) {
				createUml(ctx);
			}

			if (update != null) {
				updateUml(ctx);
			}
		} catch (Exception e) {
			Cat.logError(e);

			ctx.getHttpServletResponse().sendError(HttpServletResponse.SC_NOT_FOUND, e.getMessage());
			ctx.stopProcess();
		}
	}

	@Override
	@OutboundActionMeta(name = "edit")
	public void handleOutbound(Context ctx) throws ServletException, IOException {
		Model model = new Model(ctx);
		Payload payload = ctx.getPayload();
		List<String> sections = payload.getPathSections();
		String pathInfo = Joiners.by('/').prefixDelimiter().join(sections);
		String type = payload.getType();

		if (pathInfo.endsWith(".uml")) {
			String path = CodecFunction.urlDecode(pathInfo);

			showImage(ctx, model, path);
		} else if (type != null && type.length() > 0) {
			showImage(ctx, model, null);
		} else {
			showPage(ctx, model);
		}

		model.setAction(Action.VIEW);
		model.setPage(UmlPage.EDIT);

		if (!ctx.isProcessStopped()) {
			m_jspViewer.view(ctx, model);
		}
	}

	private void showImage(Context ctx, Model model, String path) throws IOException {
		Payload payload = ctx.getPayload();
		String type = payload.getType();
		String uml = payload.getUml();
		HttpServletResponse res = ctx.getHttpServletResponse();

		if (path != null && path.length() > 0) {
			uml = m_storage.getUmlContent(path.substring(1));
		}

		if (uml != null) {
			res.setContentType(m_uml.getContextType(uml, type));
			type = m_uml.getImageType(type);

			byte[] image = m_uml.generateImage(uml, type);

			if (image != null) {
				res.setContentLength(image.length);
				res.getOutputStream().write(image);
			} else {
				res.sendError(400, "UML Incompleted!");
			}
		} else {
			res.sendError(404, "File Not Found(" + path + ")!");
		}

		ctx.stopProcess();
	}

	private void showPage(Context ctx, Model model) throws ServletException, IOException {
		Payload payload = ctx.getPayload();
		String uml = payload.getUml();
		String editStyle = payload.getEditStyle();
		String umlFile = payload.getFile();

		if (model.getUmlFile() == null) {
			model.setUmlFile(umlFile);
		}

		model.setUmlFiles(m_storage.getUmlFiles());

		if (editStyle == null) {
			model.setEditStyle("height: 500px; width: 320px");
		} else {
			model.setEditStyle(editStyle);
		}

		if (uml != null && uml.length() > 0) {
			model.setUml(uml);
		} else if (umlFile != null && umlFile.length() > 0) {
			uml = m_storage.getUmlContent(umlFile);
			model.setUml(uml);
		}

		if (uml != null) {
			byte[] image = m_uml.generateImage(uml, "svg");

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

	private void updateUml(Context ctx) throws IOException {
		Payload payload = ctx.getPayload();
		String uml = payload.getUml();
		String umlFile = payload.getFile();
		StringBuilder message = new StringBuilder();
		boolean success = m_uml.updateUml(umlFile, uml, message);

		ctx.setError(!success);
		ctx.setMessage(message.toString());
	}
}
