package org.unidal.web.security.authorization;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.AesCipherService;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.unidal.cat.Cat;
import org.unidal.helper.Splitters;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.tuple.Pair;
import org.unidal.web.admin.configuration.ConfigService;
import org.unidal.web.admin.configuration.ConfigEvent;
import org.unidal.web.admin.configuration.ConfigEventListener;
import org.unidal.web.admin.configuration.EventType;
import org.unidal.web.admin.configuration.ConfigException;
import org.unidal.web.mvc.ActionContext;

@Named
public class TulipAccessControl implements Initializable {
   @Inject
   private TulipRealm m_realm;

   @Inject
   private ConfigService m_configService;

   private AesCipherService m_cipherService;

   private byte[] m_cipherKey;

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
         String data = username + "\t" + password;
         ByteSource encrypted = m_cipherService.encrypt(data.getBytes("utf-8"), m_cipherKey);

         return encrypted.toHex();
      }
   }

   public boolean forAPI(ActionContext<?> ctx, String permission) throws IOException {
      Subject subject = SecurityUtils.getSubject();
      AccessContext ac = new DefaultAccessContext(ctx);
      String appId = ac.getAppId();
      String clientIp = ac.getClientIp();

      try {
         subject.login(new ApplicationAuthenticationToken(appId, clientIp));
      } catch (AuthenticationException e) {
         Cat.logEvent("Access.AppId", appId, "NoAccess", "");
         Cat.logEvent("Access.ClientIP", clientIp, "NoAccess", "");
         ac.error(HttpServletResponse.SC_FORBIDDEN, "No access allowed for appid(%s) with IP(%s)!", appId, clientIp);
         return false;
      }

      if (!subject.isPermitted(permission)) {
         Cat.logEvent("Access.AppId", appId, "NoPermission", "");
         Cat.logEvent("Access.ClientIP", clientIp, "NoPermission", "");
         ac.error(HttpServletResponse.SC_FORBIDDEN, "No permission(%s) granted to appid(%s)!", permission, appId);
      } else {
         Cat.logEvent("Access.AppId", appId);
         Cat.logEvent("Access.ClientIP", clientIp);
      }

      subject.logout();
      return true;
   }

   public boolean forPage(ActionContext<?> ctx, String module, String page, String path) throws IOException {
      if (!m_configService.getBoolean(ConfigService.CATEGORY_SECURITY, "web.page.enabled", false)) {
         return true; // skip access control
      }

      Subject subject = SecurityUtils.getSubject();
      AccessContext ac = new DefaultAccessContext(ctx);
      String user = null;
      String password = null;

      try {
         Pair<String, String> pair = decryptToken(ac.getUserToken());

         user = pair.getKey();
         password = pair.getValue();
      } catch (Exception e) {
         // ignore it
      }

      if (user == null) {
         ac.gotoLogin();
         return false;
      }

      try {
         subject.login(new UserAuthenticationToken(user, password));
      } catch (Exception e) {
         Cat.logEvent("Access.User", user, "NoAccess", "");
         ac.error(HttpServletResponse.SC_FORBIDDEN, "No access allowed for user(%s)!", user);
         return false;
      }

      List<String> parts = Splitters.by('/').split(path);
      String permission;

      if (parts.size() == 0) {
         permission = String.format("%s:%s:null", module, page);
      } else if (parts.size() == 1) {
         permission = String.format("%s:%s:%s", module, page, parts.get(0));
      } else {
         permission = String.format("%s:%s:%s:%s", module, page, parts.get(0), parts.get(1));
      }

      if (!subject.isPermitted(permission)) {
         Cat.logEvent("Access.User", user, "NoPermission", "");
         ac.error(HttpServletResponse.SC_FORBIDDEN, "No permission(%s) granted to user(%s)!", permission, user);
      } else {
         Cat.logEvent("Access.User", user);
      }

      subject.logout();
      return true;
   }

   private String getCipherKey() throws ConfigException {
      String key = m_configService.findConfig(ConfigService.CATEGORY_SECURITY, "cipher.key", "");

      key = (key + "0123456789abcdef").substring(0, 16);
      return key;
   }

   @Override
   public void initialize() throws InitializationException {
      SecurityUtils.setSecurityManager(new DefaultSecurityManager(m_realm));

      m_configService.register(new ConfigChangeListener());
      m_cipherService = new AesCipherService();

      try {
         m_cipherKey = getCipherKey().getBytes();
      } catch (ConfigException e) {
         throw new InitializationException(e.getMessage(), e);
      }
   }

   private class ConfigChangeListener implements ConfigEventListener {
      @Override
      public void onEvent(ConfigEvent event) throws ConfigException {
         if (event.isEligible(EventType.CONFIG_CHANGED, ConfigService.CATEGORY_SECURITY, "cipher.key")) {
            m_cipherKey = getCipherKey().getBytes();
         }
      }
   }
}
