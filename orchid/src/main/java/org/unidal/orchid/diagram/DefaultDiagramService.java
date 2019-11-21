package org.unidal.orchid.diagram;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;
import org.unidal.orchid.diagram.entity.RootModel;

@Named(type = DiagramService.class)
public class DefaultDiagramService implements DiagramService {
	@Inject
	private DiagramManager m_manager;

	@Override
	public DiagramModel getDiagram(DiagramContext ctx, String product, String diagram) {
		RootModel model = m_manager.getModel();
		ProductModel p = model.findProduct(product);

		if (p != null) {
			DiagramModel d = p.findDiagram(diagram);

			return d;
		}

		return null;
	}

	@Override
	public List<DiagramModel> getDiagrams(DiagramContext ctx, String product) {
		RootModel model = m_manager.getModel();
		ProductModel p = model.findProduct(product);
		List<DiagramModel> diagrams = new ArrayList<DiagramModel>();

		if (p != null) {
			diagrams.addAll(p.getDiagrams());
		}

		return diagrams;
	}

	@Override
	public List<ProductModel> getProducts(DiagramContext ctx) {
		RootModel model = m_manager.getModel();

		return model.getProducts();
	}

	@Override
	public boolean hasDiagram(DiagramContext ctx, String product, String diagram) {
		RootModel model = m_manager.getModel();
		ProductModel p = model.findProduct(product);

		if (p != null) {
			DiagramModel d = p.findDiagram(diagram);

			return d != null;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateDiagram(DiagramContext ctx, String product, String diagram, String content) {
		RootModel model = m_manager.getModel();
		ProductModel p = model.findProduct(product);

		if (p != null) {
			DiagramModel d = p.findDiagram(diagram);
			String checksum = new Md5Hash(content).toHex();

			d.setChecksum(checksum);
			d.setContent(content);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String watchDiagram(DiagramContext context, String product, String diagram, String checksum, long timeoutInMillis) {
		RootModel model = m_manager.getModel();
		ProductModel p = model.findProduct(product);

		if (p != null) {
			DiagramModel d = p.findDiagram(diagram);

			if (checksum.equals(d.getChecksum())) {
				return d.getChecksum();
			}
		}

		return null;
	}
}
