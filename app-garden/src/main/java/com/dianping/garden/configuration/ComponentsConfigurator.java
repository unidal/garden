package com.dianping.garden.configuration;

import java.util.ArrayList;
import java.util.List;

import com.dianping.garden.biz.GardenModule;
import com.site.lookup.configuration.Component;
import com.site.web.configuration.AbstractWebComponentsConfigurator;

public class ComponentsConfigurator extends AbstractWebComponentsConfigurator {
   @Override
   @SuppressWarnings("unchecked")
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();

      all.addAll(new DatabaseConfigurator().defineComponents());
      all.addAll(new WdbcConfigurator().defineComponents());

      defineModuleRegistry(all, GardenModule.class, GardenModule.class);

      return all;
   }

   public static void main(String[] args) {
      generatePlexusComponentsXmlFile(new ComponentsConfigurator());
   }
}
