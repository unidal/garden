package org.unidal.orchid.diagram;

import static org.unidal.web.config.ConfigService.CATEGORY_CONFIG;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.unidal.cat.Cat;
import org.unidal.helper.Splitters;
import org.unidal.lookup.ContainerHolder;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.PermissionModel;
import org.unidal.orchid.diagram.entity.ProductModel;
import org.unidal.orchid.diagram.entity.RepositoryModel;
import org.unidal.orchid.diagram.entity.RootModel;
import org.unidal.orchid.diagram.transform.BaseVisitor;
import org.unidal.orchid.diagram.transform.DefaultSaxParser;
import org.unidal.web.config.ConfigEvent;
import org.unidal.web.config.ConfigEventListener;
import org.unidal.web.config.ConfigException;
import org.unidal.web.config.ConfigService;

@Named(type = DiagramManager.class)
public class DefaultDiagramManager extends ContainerHolder implements DiagramManager, Initializable {
   private RootModel m_model;

   private ConfigChangeListener m_listener = new ConfigChangeListener();

   @Override
   public List<DiagramModel> getDiagrams(DiagramContext ctx, String product) {
      List<DiagramModel> diagrams = new ArrayList<DiagramModel>();
      ProductModel p = m_model.findProduct(product);
      String user = ctx.getUser();

      if (p != null) {
         if (user != null) {
            p.accept(new DiagramsFilter(diagrams, user));
         } else {
            diagrams.addAll(p.getDiagrams());
         }
      }

      return diagrams;
   }

   @Override
   public ProductModel getProduct(DiagramContext ctx, String id) {
      ProductModel product = m_model.findProduct(id);

      if (product != null) {
         List<ProductModel> products = new ArrayList<ProductModel>();
         String user = ctx.getUser();

         if (user != null) {
            product.accept(new ProductsFilter(products, user));
         } else {
            products.add(product);
         }

         if (!products.isEmpty()) {
            return products.get(0);
         }
      }

      return null;
   }

   @Override
   public List<ProductModel> getProducts(DiagramContext ctx) {
      List<ProductModel> products = new ArrayList<ProductModel>();
      String user = ctx.getUser();

      if (user != null) {
         m_model.accept(new ProductsFilter(products, user));
      } else {
         products.addAll(m_model.getProducts());
      }

      return products;
   }

   @Override
   public void initialize() throws InitializationException {
      try {
         m_model = loadModel();
      } catch (Exception e) {
         throw new InitializationException("Error when loading diagram model!", e);
      }
   }

   protected RootModel loadModel() throws Exception {
      RootModel model = new RootModel();

      model.accept(new ProductModelBuilder());
      return model;
   }

   @Override
   public DiagramModel setDiagram(DiagramContext ctx, String product, String id, String content, boolean createOrUpdate) {
      ProductModel p = getProduct(ctx, product);
      DiagramModel d = p.findOrCreateDiagram(id);
      String checksum = new Md5Hash(content).toHex();

      d.setChecksum(checksum);
      d.setContent(content);

      if (createOrUpdate) {
         d.setAuthor(ctx.getUser());
      }

      try {
         p.getRepository().getRepo().updateDiagram(d);

         return d;
      } catch (Exception e) {
         throw new RuntimeException("Unable to save diagram due to " + e, e);
      }
   }

   private class ConfigChangeListener implements ConfigEventListener {
      @Override
      public void onEvent(ConfigEvent event) throws ConfigException {
         if (event.isEligible(CATEGORY_CONFIG, "products.xml")) {
            try {
               m_model = loadModel();
            } catch (Exception e) {
               Cat.logError(e);
            }
         }
      }
   }

   private static class DiagramsFilter extends BaseVisitor {
      private List<DiagramModel> m_result;

      private String m_user;

      private DiagramModel m_diagram;

      public DiagramsFilter(List<DiagramModel> result, String user) {
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

   private class ProductModelBuilder extends BaseVisitor {
      private ProductModel m_product;

      @Override
      public void visitDiagram(DiagramModel diagram) {
         String checksum = new Md5Hash(diagram.getContent()).toHex();

         diagram.setChecksum(checksum);
         super.visitDiagram(diagram);
      }

      @Override
      public void visitProduct(ProductModel product) {
         m_product = product;

         RepositoryModel repository = product.getRepository();
         DiagramRepository repo = lookup(DiagramRepository.class, repository.getType());

         try {
            repo.setup(m_product.getId(), new RepositoryProperties(repository));
            repo.loadDiagrams(product);
            repository.setRepo(repo);
         } catch (Exception e) {
            throw new RuntimeException("Error when loading diagrams from repo " + repo, e);
         }

         super.visitProduct(product);
      }

      @Override
      public void visitRoot(RootModel root) {
         ConfigService configService = lookup(ConfigService.class); // on demand lookup

         configService.register(m_listener);

         try {
            String xml = configService.getString(CATEGORY_CONFIG, "products.xml", "");

            if (xml.length() == 0) {
               return;
            }

            RootModel model = DefaultSaxParser.parse(xml);

            for (ProductModel product : model.getProducts()) {
               String id = product.getId();

               if (id == null || !product.isEnabled()) {
                  continue;
               } else if (product.getRepository() == null) {
                  continue;
               }

               ProductModel p = new ProductModel(id);

               p.mergeAttributes(product);
               p.setRepository(product.getRepository());

               root.addProduct(p);
            }
         } catch (Exception e) {
            throw new RuntimeException("Unable to load products.xml! " + e, e);
         }

         super.visitRoot(root);
      }
   }

   private static class ProductsFilter extends BaseVisitor {
      private List<ProductModel> m_result;

      private String m_user;

      private ProductModel m_product;

      public ProductsFilter(List<ProductModel> result, String user) {
         m_result = result;
         m_user = user;
      }

      private boolean collectForUser(String user) {
         if ("*".equals(user) || m_user.equals(user)) {
            if (!m_result.contains(m_product)) {
               m_result.add(m_product);
            }

            return true;
         } else {
            return false;
         }
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
         List<String> owners = Splitters.by(',').noEmptyItem().trim().split(product.getOwners());

         if (owners.contains("*") || owners.contains(m_user)) {
            if (!m_result.contains(m_product)) {
               m_result.add(product);
            }
         } else {
            m_product = product;

            super.visitProduct(product);
         }
      }
   }
}
