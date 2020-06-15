package org.unidal.web.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.lookup.configuration.AbstractResourceConfigurator;
import org.unidal.lookup.configuration.Component;
import org.unidal.web.config.DefaultConfigService;
import org.unidal.web.security.DefaultAuthService;
import org.unidal.web.security.internals.MyAccessControl;
import org.unidal.web.security.internals.MyAuthentication;
import org.unidal.web.security.internals.MyAuthorization;
import org.unidal.web.security.internals.MyPageValidator;
import org.unidal.web.security.internals.MyPermissionProvider;
import org.unidal.web.security.internals.MyRealm;

public class ComponentsConfigurator extends AbstractResourceConfigurator {
   @Override
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();

      all.add(A(DefaultConfigService.class));

      all.add(A(DefaultAuthService.class));

      all.add(A(MyAccessControl.class));
      all.add(A(MyPageValidator.class));

      all.add(A(MyRealm.class));
      all.add(A(MyAuthentication.class));
      all.add(A(MyAuthorization.class));
      all.add(A(MyPermissionProvider.class));

      all.addAll(new ConfigDatabaseConfigurator().defineComponents());
      all.addAll(new WebComponentConfigurator().defineComponents());

      return all;
   }

   public static void main(String[] args) {
      generatePlexusComponentsXmlFile(new ComponentsConfigurator());
   }
}
