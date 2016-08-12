package org.unidal.orchid.service;

import java.util.ArrayList;
import java.util.List;

import org.unidal.dal.jdbc.DalNotFoundException;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.dal.Document;
import org.unidal.orchid.dal.DocumentDao;
import org.unidal.orchid.dal.DocumentEntity;

@Named(type = DocumentService.class, value = MysqlDocumentService.ID)
public class MysqlDocumentService implements DocumentService {
	public static final String ID = "mysql";

	@Inject
	private DocumentDao m_dao;

	@Override
	public void deleteDocument(String product, String id) throws Exception {
		try {
			Document doc = m_dao.findByProductAndUri(product, id, DocumentEntity.READSET_ID_URI);

			m_dao.deleteByPK(doc);
		} catch (DalNotFoundException e) {
			// ignore it
		}
	}

	@Override
	public String getDocument(String product, String id) throws Exception {
		Document doc = m_dao.findByProductAndUri(product, id, DocumentEntity.READSET_FULL);
		byte[] content = doc.getContent();

		return new String(content, "utf-8");
	}

	@Override
	public boolean hasDocument(String product, String id) throws Exception {
		try {
			m_dao.findByProductAndUri(product, id, DocumentEntity.READSET_ID_URI);

			return true;
		} catch (DalNotFoundException e) {
			return false;
		}
	}

	@Override
	public List<String> getDocumentIds(String product) throws Exception {
		List<Document> docs = m_dao.findAllByProduct(product, DocumentEntity.READSET_ID_URI);
		List<String> ids = new ArrayList<String>(docs.size());

		for (Document doc : docs) {
			ids.add(doc.getUri());
		}

		return ids;
	}

	@Override
	public List<String> getProducts() throws Exception {
		List<Document> docs = m_dao.findAllDistinct(DocumentEntity.READSET_PRODUCT);
		List<String> products = new ArrayList<String>(docs.size());

		for (Document doc : docs) {
			products.add(doc.getProduct());
		}

		return products;
	}

	@Override
	public void storeDocument(String product, String id, String content) throws Exception {
		Document doc = m_dao.createLocal();

		doc.setProduct(product);
		doc.setUri(id);
		doc.setContent(content.getBytes("utf-8"));

		m_dao.insert(doc);
	}
}
