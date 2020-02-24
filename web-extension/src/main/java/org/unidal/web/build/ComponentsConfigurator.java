package org.unidal.web.build;

import java.util.ArrayList;
import java.util.List;

import org.unidal.lookup.configuration.AbstractResourceConfigurator;
import org.unidal.lookup.configuration.Component;
import org.unidal.web.config.DefaultConfigService;
import org.unidal.web.security.auth.MyAccessControl;
import org.unidal.web.security.auth.MyApplication;
import org.unidal.web.security.auth.MyAuthorization;
import org.unidal.web.security.auth.MyPageValidator;
import org.unidal.web.security.auth.MyRealm;
import org.unidal.web.security.auth.MyUser;

public class ComponentsConfigurator extends AbstractResourceConfigurator {
   @Override
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();

      all.add(A(MyAccessControl.class));
      all.add(A(MyRealm.class));
      all.add(A(MyAuthorization.class));
      all.add(A(MyApplication.class));
      all.add(A(MyUser.class));

      all.add(A(MyPageValidator.class));

      all.add(A(DefaultConfigService.class));

      all.addAll(new ConfigDatabaseConfigurator().defineComponents());
      all.addAll(new WebComponentConfigurator().defineComponents());

      return all;
   }

   public static void main(String[] args) {
      generatePlexusComponentsXmlFile(new ComponentsConfigurator());
   }
}
