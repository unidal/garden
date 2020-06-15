package org.unidal.web.security;

import java.io.IOException;

import org.apache.shiro.authc.AuthenticationToken;

public interface AuthContext {
   public String COOKIE_TOKEN = "uat";

   public String buildReturnUrl();

   public AuthenticationToken buildTokenForAPI();

   public AuthenticationToken buildTokenForPage();

   public AuthenticationToken buildTokenFromSession();

   public void clearSession() throws IOException;

   public void refreshSession() throws IOException;

   public void setupSession() throws IOException;
}
