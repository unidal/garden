package org.unidal.garden.rose.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.lookup.configuration.AbstractResourceConfigurator;
import org.unidal.lookup.configuration.Component;
import org.unidal.web.mvc.model.ModuleRegistry;

class WebComponentConfigurator extends AbstractResourceConfigurator {
   @Override
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();


      all.add(A(ModuleRegistry.class).config(E("default-module").value(org.unidal.garden.rose.query.QueryModule.class.getName())));
  
      all.add(A(org.unidal.garden.rose.query.QueryModule.class));

      all.add(A(org.unidal.garden.rose.query.home.Handler.class));
      all.add(A(org.unidal.garden.rose.query.home.JspViewer.class));

      return all;
   }
}
