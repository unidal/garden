package org.unidal.orchid.diagram;

import org.junit.Assert;
import org.junit.Test;
import org.unidal.lookup.ComponentTestCase;

public class DiagramManagerTest extends ComponentTestCase {
	@Test
	public void test() {
		DiagramManager manager = lookup(DiagramManager.class);

		Assert.assertEquals(1, manager.getProducts().size());
	}
}
