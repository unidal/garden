package org.unidal.orchid.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.lookup.configuration.AbstractResourceConfigurator;
import org.unidal.lookup.configuration.Component;
import org.unidal.web.mvc.model.ModuleRegistry;

class WebComponentConfigurator extends AbstractResourceConfigurator {
   @Override
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();


      all.add(A(ModuleRegistry.class).config(E("default-module").value(org.unidal.orchid.uml.UmlModule.class.getName())));
  
      all.add(A(org.unidal.orchid.uml.UmlModule.class));

      all.add(A(org.unidal.orchid.uml.edit.Handler.class));
      all.add(A(org.unidal.orchid.uml.edit.JspViewer.class));

      all.add(A(org.unidal.orchid.uml.help.Handler.class));
      all.add(A(org.unidal.orchid.uml.help.JspViewer.class));

      all.add(A(org.unidal.orchid.uml.upload.Handler.class));
      all.add(A(org.unidal.orchid.uml.upload.JspViewer.class));

      return all;
   }
}
