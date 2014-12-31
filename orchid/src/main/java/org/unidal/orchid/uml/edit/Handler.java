package org.unidal.orchid.uml.edit;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.unidal.helper.Files;
import org.unidal.helper.Joiners;
import org.unidal.helper.Scanners;
import org.unidal.helper.Scanners.FileMatcher;
import org.unidal.lookup.annotation.Inject;
import org.unidal.orchid.UmlManager;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.jsp.function.CodecFunction;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;

import com.dianping.cat.Cat;

public class Handler implements PageHandler<Context> {
	@Inject
	private UmlManager m_manager;

	@Inject
	private JspViewer m_jspViewer;

	private List<String> m_docs = Arrays.asList("doc");

	private void createUml(Context ctx) throws IOException {
		Payload payload = ctx.getPayload();
		String uml = payload.getUml();
		String umlFile = payload.getNewFile();

		if (!umlFile.endsWith(".uml")) {
			ctx.setError(true);
			ctx.setMessage(String.format("Target UML file(%s) must be ending with '.uml'!", umlFile));
		} else if (m_manager.tryCreateFile(umlFile)) {
			StringBuilder message = new StringBuilder();
			boolean success = m_manager.updateUml(umlFile, uml, message);

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

	private List<File> scanUmlFiles() {
		final List<File> files = new ArrayList<File>();

		FileMatcher matcher = new FileMatcher() {
			@Override
			public Direction matches(File base, String path) {
				if (path.endsWith(".uml")) {
					files.add(new File(base, path));
				}

				return Direction.DOWN;
			}
		};

		for (String doc : m_docs) {
			Scanners.forDir().scan(new File(doc), matcher);
		}

		return files;
	}

	private void showImage(Context ctx, Model model, String path) throws IOException {
		Payload payload = ctx.getPayload();
		String type = payload.getType();
		String uml = payload.getUml();
		HttpServletResponse res = ctx.getHttpServletResponse();

		if (path != null && path.length() > 0) {
			File file = new File(path.substring(1));

			if (file.exists()) {
				uml = Files.forIO().readFrom(file, "utf-8");
			}
		}

		if (uml != null) {
			res.setContentType(m_manager.getContextType(type));
			type = m_manager.getImageType(type);

			byte[] image = m_manager.generateImage(uml, type);

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

		model.setUmlFiles(scanUmlFiles());

		if (editStyle == null) {
			model.setEditStyle("height: 500px; width: 320px");
		} else {
			model.setEditStyle(editStyle);
		}

		if (uml != null && uml.length() > 0) {
			model.setUml(uml);
		} else if (umlFile != null && umlFile.length() > 0) {
			uml = Files.forIO().readFrom(new File(umlFile), "utf-8");

			model.setUml(uml);
		}

		if (uml != null) {
			byte[] image = m_manager.generateImage(uml, "svg");

			if (image != null) {
				model.setSvg(new String(image, "utf-8"));
			}
		}
	}

	private void updateUml(Context ctx) throws IOException {
		Payload payload = ctx.getPayload();
		String uml = payload.getUml();
		String umlFile = payload.getFile();
		StringBuilder message = new StringBuilder();
		boolean success = m_manager.updateUml(umlFile, uml, message);

		ctx.setError(!success);
		ctx.setMessage(message.toString());
	}
}
