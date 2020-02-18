package org.unidal.orchid.diagram;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.unidal.lookup.ContainerHolder;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.orchid.diagram.DiagramRepository.Properties;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.PermissionModel;
import org.unidal.orchid.diagram.entity.ProductModel;
import org.unidal.orchid.diagram.entity.RepositoryModel;
import org.unidal.orchid.diagram.entity.RootModel;
import org.unidal.orchid.diagram.transform.BaseVisitor;
import org.unidal.orchid.diagram.transform.DefaultSaxParser;

@Named(type = DiagramManager.class)
public class DefaultDiagramManager extends ContainerHolder implements DiagramManager, Initializable {
   private RootModel m_model;

   @Override
   public List<DiagramModel> getDiagrams(DiagramContext ctx, String product) {
      List<DiagramModel> diagrams = new ArrayList<DiagramModel>();
      ProductModel p = m_model.findProduct(product);
      String user = ctx.getUser();

      if (p != null) {
         if (user != null) {
            p.accept(new DiagramsCollector(diagrams, user));
         } else {
            diagrams.addAll(p.getDiagrams());
         }
      }

      return diagrams;
   }

   protected InputStream getDiagramSource() throws IOException {
      String baseDir = System.getProperty("baseDir");

      if (baseDir == null) {
         baseDir = ".";
      }

      return new FileInputStream(new File(baseDir, "diagram.xml"));
   }

   @Override
   public ProductModel getProduct(DiagramContext ctx, String id) {
      ProductModel product = m_model.findProduct(id);
      List<ProductModel> products = new ArrayList<ProductModel>();
      String user = ctx.getUser();

      if (user != null) {
         product.accept(new ProductsCollector(products, user));
      } else {
         products.add(product);
      }

      return products.get(0);
   }

   @Override
   public List<ProductModel> getProducts(DiagramContext ctx) {
      List<ProductModel> products = new ArrayList<ProductModel>();
      String user = ctx.getUser();

      if (user != null) {
         m_model.accept(new ProductsCollector(products, user));
      } else {
         products.addAll(m_model.getProducts());
      }

      return products;
   }

   @Override
   public void initialize() throws InitializationException {
      try {
         InputStream in = getDiagramSource();

         m_model = DefaultSaxParser.parse(in);
      } catch (Exception e) {
         throw new InitializationException("Error when loading diagram.xml!", e);
      }

      m_model.accept(new ModelNormalizer());
   }

   private static class DiagramsCollector extends BaseVisitor {
      private List<DiagramModel> m_result;

      private String m_user;

      private DiagramModel m_diagram;

      public DiagramsCollector(List<DiagramModel> result, String user) {
         m_result = result;
         m_user = user;
      }

      private boolean collectForUser(String user) {
         if (m_user.equals(user)) {
            if (!m_result.contains(m_diagram)) {
               m_result.add(m_diagram);
               return true;
            }
         }

         return false;
      }

      @Override
      public void visitDiagram(DiagramModel diagram) {
         m_diagram = diagram;

         if (!collectForUser(diagram.getAuthor())) {
            super.visitDiagram(diagram);
         }
      }

      @Override
      public void visitPermission(PermissionModel permission) {
         List<String> writes = permission.getWrites();
         List<String> reads = permission.getReads();

         for (String write : writes) {
            collectForUser(write);
         }

         for (String read : reads) {
            collectForUser(read);
         }
      }
   }

   private class ModelNormalizer extends BaseVisitor {
      private ProductModel m_product;

      @Override
      public void visitDiagram(DiagramModel diagram) {
         String checksum = new Md5Hash(diagram.getContent()).toHex();

         diagram.setChecksum(checksum);
         super.visitDiagram(diagram);
      }

      @Override
      public void visitProduct(ProductModel product) {
         List<DiagramModel> diagrams = product.getDiagrams();

         for (int i = diagrams.size() - 1; i >= 0; i--) {
            DiagramModel diagram = diagrams.get(i);

            if (diagram.getId() == null) {
               diagrams.remove(i); // no empty diagram
            }
         }

         if (product.isEnabled()) {
            m_product = product;

            try {
               if (product.getRepository() != null) {
                  visitRepository(product.getRepository());
               }

               for (DiagramModel diagram : product.getDiagrams()) {
                  visitDiagram(diagram);
               }
            } catch (Throwable e) {
               product.setEnabled(false); // disable the bad product
            }
         }
      }

      @Override
      public void visitRepository(RepositoryModel repository) {
         String type = repository.getType();
         DiagramRepository repo = lookup(DiagramRepository.class, type);

         repo.setup(m_product.getId(), new RepositoryProperties(repository));
         repository.setRepo(repo);

         try {
            m_product.getDiagrams().addAll(repo.getDiagrams());
         } catch (Exception e) {
            throw new RuntimeException(
                  String.format("Error when loading diagrams from repository for product(%s)!", m_product.getId()), e);
         }
      }

      @Override
      public void visitRoot(RootModel root) {
         List<ProductModel> products = root.getProducts();

         for (int i = products.size() - 1; i >= 0; i--) {
            ProductModel product = products.get(i);

            if (product.getId() == null) {
               products.remove(i); // no empty product
            }
         }

         super.visitRoot(root);
      }
   }

   private static class ProductsCollector extends BaseVisitor {
      private List<ProductModel> m_result;

      private String m_user;

      private ProductModel m_product;

      public ProductsCollector(List<ProductModel> result, String user) {
         m_result = result;
         m_user = user;
      }

      private boolean collectForUser(String user) {
         if (m_user.equals(user)) {
            if (!m_result.contains(m_product)) {
               m_result.add(m_product);
               return true;
            }
         }

         return false;
      }

      @Override
      public void visitDiagram(DiagramModel diagram) {
         if (!collectForUser(diagram.getAuthor())) {
            super.visitDiagram(diagram);
         }
      }

      @Override
      public void visitPermission(PermissionModel permission) {
         List<String> writes = permission.getWrites();
         List<String> reads = permission.getReads();

         for (String write : writes) {
            collectForUser(write);
         }

         for (String read : reads) {
            collectForUser(read);
         }
      }

      @Override
      public void visitProduct(ProductModel product) {
         m_product = product;

         super.visitProduct(product);
      }
   }

   private static class RepositoryProperties implements Properties {
      private RepositoryModel m_repository;

      public RepositoryProperties(RepositoryModel repository) {
         m_repository = repository;
      }

      @Override
      public boolean getBooleanProperty(String name, boolean defaultValue) {
         String value = getStringProperty(name, null);

         if (value != null) {
            return Boolean.valueOf(value);
         } else {
            return defaultValue;
         }
      }

      @Override
      public long getIntProperty(String name, int defaultValue) {
         String value = getStringProperty(name, null);

         if (value != null) {
            try {
               return Integer.parseInt(value);
            } catch (NumberFormatException e) {
               // ignore it
            }
         }

         return defaultValue;
      }

      @Override
      public long getLongProperty(String name, long defaultValue) {
         String value = getStringProperty(name, null);

         if (value != null) {
            try {
               return Long.parseLong(value);
            } catch (NumberFormatException e) {
               // ignore it
            }
         }

         return defaultValue;
      }

      @Override
      public String getStringProperty(String name, String defaultValue) {
         String value = m_repository.getDynamicAttribute(name);

         if (value != null) {
            return value;
         } else {
            return defaultValue;
         }
      }
   }
}
