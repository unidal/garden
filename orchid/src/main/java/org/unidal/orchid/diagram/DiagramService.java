package org.unidal.orchid.diagram;

import java.util.List;

import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;

public interface DiagramService {
	public DiagramModel getDiagram(DiagramContext ctx, String product, String id);

	public List<DiagramModel> getDiagrams(DiagramContext ctx, String product);

	public List<ProductModel> getProducts(DiagramContext ctx);
}
