package com.dianping.garden.configuration;

import java.util.ArrayList;
import java.util.List;

import com.dianping.garden.dal._INDEX;
import com.site.dal.jdbc.configuration.AbstractJdbcResourceConfigurator;
import com.site.lookup.configuration.Component;

final class DatabaseConfigurator extends AbstractJdbcResourceConfigurator {
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();

      all.add(defineJdbcDataSourceConfigurationManagerComponent("datasources.xml"));
      all.add(defineJdbcDataSourceComponent("garden", "${jdbc.driver}", "${jdbc.url}", "${jdbc.user}", "${jdbc.password}",
            "<![CDATA[${jdbc.connectionProperties}]]>"));
      all.add(defineJdbcDataSourceComponent("8.44", "${jdbc.driver}", "${jdbc.url}", "${jdbc.user}", "${jdbc.password}",
            "<![CDATA[${jdbc.connectionProperties}]]>"));

      defineSimpleTableProviderComponents(all, "garden", _INDEX.getEntityClasses());
      defineDaoComponents(all, _INDEX.getDaoClasses());

      return all;
   }
}