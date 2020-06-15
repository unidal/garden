package org.unidal.web.security.internals;

import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.unidal.lookup.annotation.Named;
import org.unidal.web.security.internals.MyAuthenticationToken.TokenType;
import org.unidal.web.security.spi.Authentication;

@Named(type = Authentication.class)
public class MyAuthentication implements Authentication<MyAuthenticationToken, SimpleAuthenticationInfo> {
   @Override
   public SimpleAuthenticationInfo build(MyAuthenticationToken token) {
      return new SimpleAuthenticationInfo(token.getPrincipal(), token.getCredentials(), MyRealm.class.getSimpleName());
   }

   @Override
   public Class<MyAuthenticationToken> getTokenType() {
      return MyAuthenticationToken.class;
   }

   @Override
   public boolean matches(MyAuthenticationToken token, SimpleAuthenticationInfo info) {
      TokenType type = token.getType();

      switch (type) {
      case PAGE:
         if (token.getPrincipal().equals("qmwu2000")) {
            return true;
         }

         break;
      case API:
         if (token.getPrincipal().equals("10001")) {
            return true;
         }

      }

      return false;
   }
}
