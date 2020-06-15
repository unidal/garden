package org.unidal.web.security;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.AesCipherService;
import org.apache.shiro.util.ByteSource;
import org.unidal.cat.Cat;
import org.unidal.helper.Splitters;
import org.unidal.tuple.Pair;
import org.unidal.web.jsp.function.CodecFunction;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.security.internals.MyAuthenticationToken;
import org.unidal.web.security.internals.MyAuthenticationToken.TokenType;
import org.unidal.web.user.UserContext;
import org.unidal.web.user.UserPage;
import org.unidal.web.user.login.Payload;

public class DefaultAuthContext implements AuthContext {
   private ContextHelper m_session;

   private UrlBuilder m_builder;

   public DefaultAuthContext(ActionContext<?> ctx, String cypherKey) {
      m_session = new ContextHelper(ctx, cypherKey);
      m_builder = new UrlBuilder(ctx);
   }

   public String buildLoginUrl() {
      String returnUrl = m_builder.getReturnUrl();
      String loginUrl = m_builder.getLoginUrl();
      StringBuilder sb = new StringBuilder(256);

      sb.append(loginUrl);
      sb.append("?rtnUrl=");
      sb.append(CodecFunction.urlEncode(returnUrl));

      return sb.toString();
   }

   @Override
   public String buildReturnUrl() {
      String returnUrl = m_builder.getReturnUrl();

      return returnUrl;
   }

   @Override
   public AuthenticationToken buildTokenForAPI() {
      Pair<String, String> pair = m_session.getApiIdentifier();

      if (pair != null) {
         return new MyAuthenticationToken(TokenType.API, pair.getKey(), pair.getValue());
      } else {
         return null;
      }
   }

   @Override
   public AuthenticationToken buildTokenForPage() {
      Pair<String, String> pair = m_session.getPageCredential();

      if (pair != null) {
         return new MyAuthenticationToken(TokenType.PAGE, pair.getKey(), pair.getValue());
      } else {
         return null;
      }
   }

   @Override
   public AuthenticationToken buildTokenFromSession() {
      Pair<String, String> pair = m_session.getSessionCredential();

      if (pair != null) {
         return new MyAuthenticationToken(TokenType.PAGE, pair.getKey(), pair.getValue());
      } else {
         return null;
      }
   }

   @Override
   public void clearSession() throws IOException {
      m_session.dropCookie(null);
   }

   @Override
   public void refreshSession() throws IOException {
      Pair<String, String> pair = m_session.getSessionCredential();

      if (pair != null) {
         String value = m_session.encryptToken(pair.getKey(), pair.getValue());

         m_session.dropCookie(value);
      }
   }

   @Override
   public void setupSession() throws IOException {
      Pair<String, String> pair = m_session.getPageCredential();

      if (pair != null) {
         String value = m_session.encryptToken(pair.getKey(), pair.getValue());

         m_session.dropCookie(value);
      }
   }

   private static class ContextHelper {
      private static String COOKIE_TOKEN = "uat";

      private ActionContext<?> m_ctx;

      private AesCipherService m_cipherService;

      private byte[] m_cipherKey;

      public ContextHelper(ActionContext<?> ctx, String key) {
         m_ctx = ctx;
         m_cipherService = new AesCipherService();
         m_cipherKey = (key + "0123456789abcdef").substring(0, 16).getBytes();
      }

      /**
       * Decrypt <code>username</code> and <code>password</code> from <code>token</code>.
       * 
       * @param token
       *           encrypted token
       * @return username and password pair
       * @throws IOException
       */
      public Pair<String, String> decryptToken(String token) throws IOException {
         Pair<String, String> pair = new Pair<String, String>();

         if (token != null) {
            ByteSource decrypted = m_cipherService.decrypt(Hex.decode(token), m_cipherKey);
            List<String> items = Splitters.by('\t').split(new String(decrypted.getBytes(), "utf-8"));

            pair.setKey(items.get(0));
            pair.setValue(items.get(1));
         }

         return pair;
      }

      public void dropCookie(String value) {
         Cookie cookie = new Cookie(AuthContext.COOKIE_TOKEN, value);

         cookie.setPath("/");
         cookie.setHttpOnly(true);

         if (value == null) { // expire right now
            cookie.setMaxAge(0);
         } else {
            cookie.setMaxAge(24 * 60 * 60); // expire in 1 day
         }

         m_ctx.getHttpServletResponse().addCookie(cookie);
      }

      /**
       * Encrypt <code>username</code> and <code>password</code> into <code>token</code.
       * 
       * @param username
       * @param password
       * @return an encrypted token
       * @throws UnsupportedEncodingException
       */
      public String encryptToken(String username, String password) throws IOException {
         if (username == null) {
            return null;
         } else {
            String data = username + "\t" + password + "\t" + System.currentTimeMillis();
            ByteSource encrypted = m_cipherService.encrypt(data.getBytes("utf-8"), m_cipherKey);

            return encrypted.toHex();
         }
      }

      public Pair<String, String> getApiIdentifier() {
         HttpServletRequest req = m_ctx.getHttpServletRequest();
         String clientIp = m_ctx.getClientIP();
         String appId = null;

         if (appId == null) { // from header
            appId = req.getHeader("x-app-id");
         }

         if (appId == null) { // from query string
            appId = req.getParameter("__APP_ID");
         }

         if (appId == null || appId.length() == 0) { // default
            appId = "Unknown";
         }

         return new Pair<String, String>(appId, clientIp);
      }

      public Pair<String, String> getPageCredential() {
         if (m_ctx instanceof UserContext) {
            Payload payload = (Payload) m_ctx.getPayload();
            String username = payload.getUsername();
            String password = payload.getPassword();

            return new Pair<String, String>(username, password);
         }

         return null;
      }

      public Pair<String, String> getSessionCredential() {
         Cookie cookie = m_ctx.getCookie(COOKIE_TOKEN);

         if (cookie != null) {
            try {
               String value = cookie.getValue();
               Pair<String, String> pair = decryptToken(value);

               return new Pair<String, String>(pair.getKey(), pair.getValue());
            } catch (Exception e) {
               // ignore it
               Cat.logError(e);
            }
         }

         return null;
      }
   }

   private static class UrlBuilder {
      private ActionContext<?> m_ctx;

      public UrlBuilder(ActionContext<?> ctx) {
         m_ctx = ctx;
      }

      public String getHomeUrl() {
         return "/";
      }

      public String getLoginUrl() {
         return m_ctx.getRequestContext().getModuleUri(UserPage.LOGIN.getModuleName(), UserPage.LOGIN.getName());
      }

      public String getReturnUrl() {
         String url;

         if (m_ctx instanceof UserContext) {
            Payload payload = (Payload) m_ctx.getPayload();

            url = payload.getReturnUrl();
         } else {
            url = m_ctx.getRequestContext().getActionUri();
         }

         if (url != null && url.startsWith(getLoginUrl())) {
            url = null;
         }

         if (url == null || url.length() == 0) {
            url = getHomeUrl();
         }

         return url;
      }
   }
}
