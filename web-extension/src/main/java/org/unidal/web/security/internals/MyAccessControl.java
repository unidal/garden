package org.unidal.web.security.internals;

import static org.unidal.web.config.ConfigService.CATEGORY_SECURITY;

import java.io.IOException;

import org.unidal.cat.Cat;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.web.config.ConfigService;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.security.AuthService;
import org.unidal.web.security.DefaultAuthContext;

@Named
public class MyAccessControl {
   @Inject
   private AuthService m_authService;

   @Inject
   private ConfigService m_configService;

   public boolean forAPI(ActionContext<?> ctx, String permission) throws IOException {
      DefaultAuthContext ac = new DefaultAuthContext(ctx, m_configService.getCipherKey());

      if (!m_authService.validate(ac, permission)) {
         Cat.logEvent("Access.Token", "Invalid");

         ctx.sendJsonRaw("401", null, "No Permission!");
         return false;
      } else {
         Cat.logEvent("Access.Token", "Valid");

         return true;
      }
   }

   public boolean forPage(ActionContext<?> ctx, String module, String page, String path) throws IOException {
      if (!isWebPageEnabled()) {
         return true; // skip access control
      }

      DefaultAuthContext ac = new DefaultAuthContext(ctx, m_configService.getCipherKey());

      if (!m_authService.validate(ac)) {
         String url = ac.buildLoginUrl();

         Cat.logEvent("Access.Session", "Invalid");
         ctx.redirect(url);
         ctx.stopProcess();

         return false;
      } else {
         Cat.logEvent("Access.Session", "Valid");

         return true;
      }
   }

   protected boolean isWebPageEnabled() {
      return m_configService.getBoolean(CATEGORY_SECURITY, "web.page.enabled", false);
   }
}
