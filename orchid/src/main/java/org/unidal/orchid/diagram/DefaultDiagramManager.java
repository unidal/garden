package org.unidal.orchid.diagram;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.unidal.lookup.ContainerHolder;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.orchid.diagram.DiagramRepository.Properties;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;
import org.unidal.orchid.diagram.entity.RepositoryModel;
import org.unidal.orchid.diagram.entity.RootModel;
import org.unidal.orchid.diagram.transform.BaseVisitor;
import org.unidal.orchid.diagram.transform.DefaultSaxParser;

@Named(type = DiagramManager.class)
public class DefaultDiagramManager extends ContainerHolder implements DiagramManager, Initializable {
	private static boolean DEBUG = true;

	private RootModel m_model;

	@Override
	public ProductModel getProduct(String id) {
		return m_model.findProduct(id);
	}

	@Override
	public List<ProductModel> getProducts() {
		return m_model.getProducts();
	}

	@Override
	public void initialize() throws InitializationException {
		if (DEBUG) {
			try {
				InputStream in = getClass().getResourceAsStream("diagram.xml");

				m_model = DefaultSaxParser.parse(in);
			} catch (Exception e) {
				throw new InitializationException("Error when loading diagram.xml!", e);
			}
		} else {
			try {
				InputStream in = new FileInputStream("diagram.xml");

				m_model = DefaultSaxParser.parse(in);
			} catch (Exception e) {
				throw new InitializationException("Error when loading diagram.xml!", e);
			}
		}

		m_model.accept(new ModelNormalizer());
	}

	private class ModelNormalizer extends BaseVisitor {
		private ProductModel m_product;

		@Override
		public void visitDiagram(DiagramModel diagram) {
			String checksum = new Md5Hash(diagram.getContent()).toHex();

			diagram.setChecksum(checksum);
			super.visitDiagram(diagram);
		}

		@Override
		public void visitProduct(ProductModel product) {
			List<DiagramModel> diagrams = product.getDiagrams();

			for (int i = diagrams.size() - 1; i >= 0; i--) {
				DiagramModel diagram = diagrams.get(i);

				if (diagram.getId() == null) {
					diagrams.remove(i); // no empty diagram
				}
			}

			if (product.isEnabled()) {
				m_product = product;

				try {
					if (product.getRepository() != null) {
						visitRepository(product.getRepository());
					}

					for (DiagramModel diagram : product.getDiagrams()) {
						visitDiagram(diagram);
					}
				} catch (Throwable e) {
					product.setEnabled(false); // disable the bad product
				}
			}
		}

		@Override
		public void visitRepository(RepositoryModel repository) {
			String type = repository.getType();
			DiagramRepository repo = lookup(DiagramRepository.class, type);

			repo.setup(m_product.getId(), new RepositoryProperties(repository));
			repository.setRepo(repo);

			try {
				m_product.getDiagrams().addAll(repo.getDiagrams());
			} catch (Exception e) {
				throw new RuntimeException(String.format("Error when loading diagrams from repository for product(%s)!",
						m_product.getId()), e);
			}
		}

		@Override
		public void visitRoot(RootModel root) {
			List<ProductModel> products = root.getProducts();

			for (int i = products.size() - 1; i >= 0; i--) {
				ProductModel product = products.get(i);

				if (product.getId() == null) {
					products.remove(i); // no empty product
				}
			}

			super.visitRoot(root);
		}
	}

	private static class RepositoryProperties implements Properties {
		private RepositoryModel m_repository;

		public RepositoryProperties(RepositoryModel repository) {
			m_repository = repository;
		}

		@Override
		public boolean getBooleanProperty(String name, boolean defaultValue) {
			String value = getStringProperty(name, null);

			if (value != null) {
				return Boolean.valueOf(value);
			} else {
				return defaultValue;
			}
		}

		@Override
		public long getIntProperty(String name, int defaultValue) {
			String value = getStringProperty(name, null);

			if (value != null) {
				try {
					return Integer.parseInt(value);
				} catch (NumberFormatException e) {
					// ignore it
				}
			}

			return defaultValue;
		}

		@Override
		public long getLongProperty(String name, long defaultValue) {
			String value = getStringProperty(name, null);

			if (value != null) {
				try {
					return Long.parseLong(value);
				} catch (NumberFormatException e) {
					// ignore it
				}
			}

			return defaultValue;
		}

		@Override
		public String getStringProperty(String name, String defaultValue) {
			String value = m_repository.getDynamicAttribute(name);

			if (value != null) {
				return value;
			} else {
				return defaultValue;
			}
		}
	}
}
