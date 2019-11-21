package org.unidal.orchid.diagram;

import java.util.List;

import org.junit.Test;
import org.unidal.lookup.ComponentTestCase;
import org.unidal.orchid.diagram.entity.ProductModel;

public class DiagramServiceTest extends ComponentTestCase {
	@Test
	public void test() {
		DiagramService service = lookup(DiagramService.class);
		List<ProductModel> products = service.getProducts(new DefaultDiagramContext());

		System.out.println(products);
	}
}
