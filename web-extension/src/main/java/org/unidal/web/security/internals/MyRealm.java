package org.unidal.web.security.internals;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.PermissionResolver;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.web.security.spi.Authentication;
import org.unidal.web.security.spi.Authorization;

@Named
public class MyRealm extends AuthorizingRealm implements Initializable {
   @Inject
   private Authentication<AuthenticationToken, AuthenticationInfo> m_authentication;

   @Inject
   private Authorization m_authorization;

   @Override
   protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
      return m_authentication.build(token);
   }

   @Override
   protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
      if (principals == null) {
         throw new AuthorizationException("No principals specified.");
      }

      String principal = (String) getAvailablePrincipal(principals);

      return m_authorization.build(principal);
   }

   @Override
   public boolean supports(AuthenticationToken token) {
      return m_authentication.getTokenType().isAssignableFrom(token.getClass());
   }

   @Override
   public String toString() {
      return getClass().getSimpleName();
   }

   @Override
   public void initialize() throws InitializationException {
      super.setCredentialsMatcher(new CredentialsMatcher() {
         @Override
         public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
            return m_authentication.matches(token, info);
         }
      });

      setPermissionResolver(new PermissionResolver() {
         @Override
         public Permission resolvePermission(String permissionString) {
            return null;
         }
      });
   }
}
