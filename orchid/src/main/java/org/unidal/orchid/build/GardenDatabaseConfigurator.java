package org.unidal.orchid.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.dal.jdbc.configuration.AbstractJdbcResourceConfigurator;
import org.unidal.lookup.configuration.Component;

final class GardenDatabaseConfigurator extends AbstractJdbcResourceConfigurator {
   @Override
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();

      defineSimpleTableProviderComponents(all, "garden", org.unidal.orchid.dal._INDEX.getEntityClasses());
      defineDaoComponents(all, org.unidal.orchid.dal._INDEX.getDaoClasses());

      return all;
   }
}
