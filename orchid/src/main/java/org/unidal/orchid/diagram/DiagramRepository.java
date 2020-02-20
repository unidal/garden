package org.unidal.orchid.diagram;

import org.unidal.orchid.diagram.entity.DiagramModel;
import org.unidal.orchid.diagram.entity.ProductModel;

public interface DiagramRepository {
   public void loadDiagrams(ProductModel product) throws Exception;

   public void setup(String product, Properties properties) throws Exception;

   public void updateDiagram(DiagramModel diagram) throws Exception;

   public static interface Properties {
      public boolean getBooleanProperty(String name, boolean defaultValue);

      public long getIntProperty(String name, int defaultValue);

      public long getLongProperty(String name, long defaultValue);

      public String getStringProperty(String name, String defaultValue);
   }
}
