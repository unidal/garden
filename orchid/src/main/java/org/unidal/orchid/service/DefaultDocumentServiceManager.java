package org.unidal.orchid.service;

import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;

@Named(type = DocumentServiceManager.class)
public class DefaultDocumentServiceManager implements DocumentServiceManager {
	@Inject(LocalDocumentService.ID)
	private DocumentService m_local;

	@Inject(MysqlDocumentService.ID)
	private DocumentService m_mysql;

	@Override
	public DocumentService getDocumentService() {
		String mode = System.getProperty("mode");

		if ("online".equals(mode)) {
			return m_mysql;
		} else {
			return m_local;
		}
	}
}
