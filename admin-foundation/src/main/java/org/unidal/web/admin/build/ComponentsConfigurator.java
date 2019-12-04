package org.unidal.web.admin.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.lookup.configuration.AbstractResourceConfigurator;
import org.unidal.lookup.configuration.Component;
import org.unidal.web.security.authorization.TulipAccessControl;
import org.unidal.web.security.authorization.TulipApplication;
import org.unidal.web.security.authorization.TulipAuthorization;
import org.unidal.web.security.authorization.TulipPageValidator;
import org.unidal.web.security.authorization.TulipRealm;
import org.unidal.web.security.authorization.TulipUser;

public class ComponentsConfigurator extends AbstractResourceConfigurator {
   @Override
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();

      all.add(A(TulipAccessControl.class));
      all.add(A(TulipRealm.class));
      all.add(A(TulipAuthorization.class));
      all.add(A(TulipApplication.class));
      all.add(A(TulipUser.class));

      all.add(A(TulipPageValidator.class));

      all.addAll(new WebComponentConfigurator().defineComponents());

      return all;
   }

   public static void main(String[] args) {
      generatePlexusComponentsXmlFile(new ComponentsConfigurator());
   }
}
