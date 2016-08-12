package org.unidal.orchid.service;

import java.util.List;

public interface DocumentService {
	public List<String> getProducts() throws Exception;

	public List<String> getDocumentIds(String product) throws Exception;

	public String getDocument(String product, String id) throws Exception;

	public void deleteDocument(String product, String id) throws Exception;

	public void storeDocument(String product, String id, String content) throws Exception;
}
