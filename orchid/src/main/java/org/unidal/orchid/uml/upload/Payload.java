package org.unidal.orchid.uml.upload;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.servlet.ServletInputStream;

import org.unidal.helper.Files;
import org.unidal.helper.Files.AutoClose;
import org.unidal.orchid.uml.UmlPage;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.ActionPayload;
import org.unidal.web.mvc.payload.annotation.FieldMeta;
import org.unidal.web.mvc.payload.annotation.PathMeta;

public class Payload implements ActionPayload<UmlPage, Action> {
	private UmlPage m_page;

	@FieldMeta("op")
	private Action m_action;

	@PathMeta("pathes")
	private String[] m_pathes;

	private Map<String, byte[]> m_contentMap = new HashMap<String, byte[]>();

	@Override
	public Action getAction() {
		return m_action;
	}

	public Map<String, byte[]> getContentMap() {
		return m_contentMap;
	}

	@Override
	public UmlPage getPage() {
		return m_page;
	}

	public String getProduct() {
		return m_pathes != null && m_pathes.length > 0 ? m_pathes[0] : null;
	}

	private void prepareContentMap(ActionContext<?> ctx) throws IOException {
		ServletInputStream sis = ctx.getHttpServletRequest().getInputStream();
		ZipInputStream zis = new ZipInputStream(sis);

		while (true) {
			ZipEntry entry = zis.getNextEntry();

			if (entry == null) {
				break;
			}

			if (!entry.isDirectory()) {
				String uri = entry.getName();
				ByteArrayOutputStream baos = new ByteArrayOutputStream(2048);

				Files.forIO().copy(zis, baos, AutoClose.OUTPUT);
				m_contentMap.put(uri, baos.toByteArray());
			}
		}
	}

	public void setAction(String action) {
		m_action = Action.getByName(action, Action.VIEW);
	}

	@Override
	public void setPage(String page) {
		m_page = UmlPage.getByName(page, UmlPage.UPLOAD);
	}

	@Override
	public void validate(ActionContext<?> ctx) {
		if (m_action == null) {
			m_action = Action.VIEW;
		}

		try {
			prepareContentMap(ctx);
		} catch (IOException e) {
			ctx.addError("payload.invalid", e);
		}
	}
}
