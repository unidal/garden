package org.unidal.orchid.diagram;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.unidal.cat.Cat;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;

@Named(type = DiagramService.class)
public class DefaultDiagramService implements DiagramService {
	@Inject
	private DiagramManager m_manager;

	@Override
	public DiagramModel getDiagram(DiagramContext ctx, String product, String diagram) {
		ProductModel p = m_manager.getProduct(product);

		if (p != null && p.isEnabled()) {
			DiagramModel d = p.findDiagram(diagram);

			return d;
		}

		return null;
	}

	@Override
	public List<DiagramModel> getDiagrams(DiagramContext ctx, String product) {
		ProductModel p = m_manager.getProduct(product);
		List<DiagramModel> diagrams = new ArrayList<DiagramModel>();

		if (p != null && p.isEnabled()) {
			diagrams.addAll(p.getDiagrams());
		}

		return diagrams;
	}

	@Override
	public List<ProductModel> getProducts(DiagramContext ctx) {
		List<ProductModel> products = new ArrayList<ProductModel>();

		for (ProductModel product : m_manager.getProducts()) {
			if (product.isEnabled()) {
				products.add(product);
			}
		}

		return products;
	}

	@Override
	public boolean hasDiagram(DiagramContext ctx, String product, String diagram) {
		ProductModel p = m_manager.getProduct(product);

		if (p != null) {
			DiagramModel d = p.findDiagram(diagram);

			return d != null;
		} else {
			return false;
		}
	}

	@Override
	public boolean saveDiagram(DiagramContext ctx, String product, String diagram, String content) {
		ProductModel p = m_manager.getProduct(product);

		if (p != null && p.isEnabled()) {
			DiagramModel d = p.findOrCreateDiagram(diagram);
			String checksum = new Md5Hash(content).toHex();

			synchronized (d) {
				d.setChecksum(checksum);
				d.setContent(content);
			}

			try {
				p.getRepository().getRepo().updateDiagram(d);
				return true;
			} catch (Exception e) {
				Cat.logError(e);
			}
		}

		return false;
	}

	@Override
	public boolean updateDiagram(DiagramContext ctx, String product, String diagram, String content) {
		ProductModel p = m_manager.getProduct(product);

		if (p != null && p.isEnabled()) {
			DiagramModel d = p.findOrCreateDiagram(diagram);
			String checksum = new Md5Hash(content).toHex();

			synchronized (d) {
				d.setChecksum(checksum);
				d.setContent(content);
			}

			return true;
		} else {
			return false;
		}
	}

	@Override
	public String watchDiagram(DiagramContext context, String product, String diagram, String checksum,
			long timeoutInMillis) throws InterruptedException {
		ProductModel p = m_manager.getProduct(product);

		if (p != null && p.isEnabled()) {
			long start = System.currentTimeMillis();
			DiagramModel d = p.findDiagram(diagram);

			while (System.currentTimeMillis() - start < timeoutInMillis) { // not timeout
				synchronized (d) {
					if (!d.getChecksum().equals(checksum)) {
						return d.getChecksum();
					}
				}

				TimeUnit.MILLISECONDS.sleep(100);
			}
		}

		return null;
	}
}
