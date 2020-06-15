package org.unidal.web.security.internals;

import org.apache.shiro.authc.AuthenticationToken;

public class MyAuthenticationToken implements AuthenticationToken {
   private static final long serialVersionUID = 1L;

   private TokenType m_type;

   private String m_principal;

   private String m_credentials;

   public MyAuthenticationToken(TokenType type, String principal, String credentials) {
      m_type = type;
      m_principal = principal;
      m_credentials = credentials;
   }

   @Override
   public Object getCredentials() {
      return m_credentials;
   }

   @Override
   public Object getPrincipal() {
      return m_principal;
   }

   public TokenType getType() {
      return m_type;
   }

   public static enum TokenType {
      PAGE,

      API;
   }
}
