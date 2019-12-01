package org.unidal.orchid.diagram;

import java.util.List;

import org.unidal.orchid.diagram.entity.ProductModel;

public interface DiagramManager {
	public ProductModel getProduct(String id);

	public List<ProductModel> getProducts();
}
