package org.unidal.orchid.service;

import java.util.List;

public interface DocumentService {
	public void deleteDocument(String product, String id) throws Exception;

	public String getDocument(String product, String id) throws Exception;

	public List<String> getDocumentIds(String product) throws Exception;

	public List<String> getProducts() throws Exception;

	public boolean hasDocument(String product, String id) throws Exception;

	public void storeDocument(String product, String id, String content) throws Exception;

	public String watch(String product, String path, String checksum, long timeoutInMillis);
}
