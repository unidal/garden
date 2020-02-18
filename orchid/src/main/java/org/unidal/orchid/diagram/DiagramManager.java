package org.unidal.orchid.diagram;

import java.util.List;

import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;

public interface DiagramManager {
	public List<DiagramModel> getDiagrams(DiagramContext ctx, String product);

	public ProductModel getProduct(DiagramContext ctx, String id);

   public List<ProductModel> getProducts(DiagramContext ctx);
}
