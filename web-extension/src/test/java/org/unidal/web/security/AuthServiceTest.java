package org.unidal.web.security;

import java.io.IOException;

import org.apache.shiro.authc.AuthenticationToken;
import org.junit.Test;
import org.unidal.lookup.ComponentTestCase;

public class AuthServiceTest extends ComponentTestCase {
   @Test
   public void test() throws IOException {
      AuthService auth = lookup(AuthService.class);
      AuthContext ctx = new MockAuthContext();

      auth.login(ctx);
      auth.validate(ctx);
      auth.login(ctx);
   }

   private static class MockAuthContext implements AuthContext {
      @Override
      public String buildReturnUrl() {
         return null;
      }

      @Override
      public AuthenticationToken buildTokenForAPI() {
         return null;
      }

      @Override
      public AuthenticationToken buildTokenForPage() {
         return null;
      }

      @Override
      public AuthenticationToken buildTokenFromSession() {
         return null;
      }

      @Override
      public void clearSession() {
      }

      @Override
      public void refreshSession() {
      }

      @Override
      public void setupSession() {
      }
   }
}
