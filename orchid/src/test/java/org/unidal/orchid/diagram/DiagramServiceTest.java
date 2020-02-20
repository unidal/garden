package org.unidal.orchid.diagram;

import java.io.InputStream;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.unidal.lookup.ComponentTestCase;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.diagram.entity.ProductModel;
import org.unidal.orchid.diagram.entity.RootModel;
import org.unidal.orchid.diagram.transform.DefaultSaxParser;

public class DiagramServiceTest extends ComponentTestCase {
   @Before
   public void before() throws Exception {
      define(MockDiagramManager.class);
   }

   @Test
   public void test() {
      DiagramService service = lookup(DiagramService.class);
      List<ProductModel> products = service.getProducts(new DefaultDiagramContext(null));

      Assert.assertEquals(1, products.size());
   }

   @Named(type = DiagramManager.class)
   public static class MockDiagramManager extends DefaultDiagramManager {
      @Override
      protected RootModel loadModel() throws Exception {
         InputStream in = getClass().getResourceAsStream("sample.xml");

         return DefaultSaxParser.parse(in);
      }
   }
}
