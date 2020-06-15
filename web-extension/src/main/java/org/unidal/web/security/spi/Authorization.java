package org.unidal.web.security.spi;

import org.apache.shiro.authz.AuthorizationInfo;

public interface Authorization {
   public AuthorizationInfo build(String principal);
}
