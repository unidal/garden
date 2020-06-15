package org.unidal.web.security;

import java.io.IOException;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;
import org.unidal.cat.Cat;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.web.security.internals.MyRealm;

@Named(type = AuthService.class)
public class DefaultAuthService implements AuthService, Initializable {
   @Inject
   private MyRealm m_realm;

   @Override
   public void initialize() throws InitializationException {
      SecurityUtils.setSecurityManager(new DefaultSecurityManager(m_realm));
   }

   @Override
   public boolean login(AuthContext ctx) throws IOException {
      Subject subject = SecurityUtils.getSubject();

      if (subject.isAuthenticated()) {
         try {
            subject.logout();
         } catch (Exception e) {
            Cat.logError(e);
         }
      }

      try {
         subject.login(ctx.buildTokenForPage());

         ctx.setupSession();
         return true;
      } catch (Exception e) {
         Cat.logError(e);
      } finally {
         subject.logout();
      }

      return false;
   }

   @Override
   public boolean logout(AuthContext ctx) throws IOException {
      Subject subject = SecurityUtils.getSubject();

      subject.logout();
      ctx.clearSession();
      return false;
   }

   @Override
   public boolean validate(AuthContext ctx) throws IOException {
      AuthenticationToken token = ctx.buildTokenFromSession();

      if (token != null) {
         Subject subject = SecurityUtils.getSubject();

         try {
            subject.login(token);

            ctx.refreshSession();
            return true;
         } catch (Exception e) {
            Cat.logError(e);
         } finally {
            subject.logout();
         }
      }

      return false;
   }

   @Override
   public boolean validate(AuthContext ctx, String permission) throws IOException {
      AuthenticationToken token = ctx.buildTokenFromSession();

      if (token != null) {
         Subject subject = SecurityUtils.getSubject();

         try {
            subject.login(token);

            ctx.refreshSession();
            return true;
         } catch (Exception e) {
            Cat.logError(e);
         } finally {
            subject.logout();
         }
      }

      return false;
   }
}
