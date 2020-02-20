package org.unidal.orchid.diagram;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.unidal.lookup.ComponentTestCase;
import org.unidal.lookup.annotation.Named;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;
import org.unidal.orchid.diagram.entity.RootModel;
import org.unidal.orchid.diagram.transform.DefaultSaxParser;

public class DiagramManagerTest extends ComponentTestCase {
   @Before
   public void before() throws Exception {
      define(MockDiagramManager.class);
   }

   private void checkDiagrams(List<DiagramModel> diagrams, String... ids) {
      List<String> expected = Arrays.asList(ids);
      List<String> actual = new ArrayList<String>();

      for (DiagramModel diagram : diagrams) {
         actual.add(diagram.getId());
      }

      Assert.assertEquals(expected, actual);
   }

   private void checkProducts(List<ProductModel> products, String... ids) {
      List<String> expected = Arrays.asList(ids);
      List<String> actual = new ArrayList<String>();

      for (ProductModel product : products) {
         actual.add(product.getId());
      }

      Assert.assertEquals(expected, actual);
   }

   @Test
   public void testAlice() {
      DiagramManager manager = lookup(DiagramManager.class);
      DiagramContext ctx = new DiagramContext() {
         @Override
         public String getUser() {
            return "alice";
         }
      };

      checkProducts(manager.getProducts(ctx), "alpha", "beta");
      checkDiagrams(manager.getDiagrams(ctx, "alpha"), "a", "b");
      checkDiagrams(manager.getDiagrams(ctx, "beta"), "x", "y");
   }
   
   @Test
   public void testChris() {
      DiagramManager manager = lookup(DiagramManager.class);
      DiagramContext ctx = new DiagramContext() {
         @Override
         public String getUser() {
            return "chris";
         }
      };
      
      checkProducts(manager.getProducts(ctx), "alpha", "beta");
      checkDiagrams(manager.getDiagrams(ctx, "alpha"), "a", "c");
      checkDiagrams(manager.getDiagrams(ctx, "beta"), "x", "z");
   }

   @Test
   public void testWithoutAccessControl() {
      DiagramManager manager = lookup(DiagramManager.class);
      DiagramContext ctx = new DiagramContext() {
         @Override
         public String getUser() {
            return null;
         }
      };

      checkProducts(manager.getProducts(ctx), "alpha", "beta");
      checkDiagrams(manager.getDiagrams(ctx, "alpha"), "a", "b", "c");
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
