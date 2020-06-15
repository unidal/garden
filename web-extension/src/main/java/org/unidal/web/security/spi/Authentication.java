package org.unidal.web.security.spi;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;

public interface Authentication<T extends AuthenticationToken, I extends AuthenticationInfo> {
   public I build(T token);

   public Class<T> getTokenType();

   public boolean matches(T token, I info);
}
