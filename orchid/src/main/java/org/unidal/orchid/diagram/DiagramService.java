package org.unidal.orchid.diagram;

import java.util.List;

import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;

public interface DiagramService {
	public DiagramModel getDiagram(DiagramContext ctx, String product, String diagram);

	public List<DiagramModel> getDiagrams(DiagramContext ctx, String product);

	public List<ProductModel> getProducts(DiagramContext ctx);

	public boolean hasDiagram(DiagramContext context, String product, String diagram);

	public void updateDiagram(String product, String diagram, String content);
}
