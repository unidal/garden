package org.unidal.web.security.internals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.unidal.helper.Splitters;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.web.config.ConfigService;
import org.unidal.web.security.spi.Authorization;

@Named(type = Authorization.class)
public class MyAuthorization implements Authorization {
   @Inject
   private MyPermissionProvider m_permission;

   @Inject
   private ConfigService m_configService;

   private Map<String, MyWildcardPermission> m_cache = new HashMap<String, MyWildcardPermission>();

   @Override
   public AuthorizationInfo build(String principal) {
      SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
      Set<Permission> objects = new HashSet<Permission>();

      Set<String> permissions = m_permission.findPermissionsForApp(principal);

      if (permissions.isEmpty()) {
         permissions = m_permission.findPermissionsForUser(principal);
      }

      for (String permission : permissions) {
         objects.add(findOrCreatePermission(permission));
      }

      info.setObjectPermissions(objects);
      return info;
   }

   private MyWildcardPermission findOrCreatePermission(String permission) {
      MyWildcardPermission perm = m_cache.get(permission);

      if (perm == null) {
         perm = new MyWildcardPermission(permission);
         m_cache.put(permission, perm);
      }

      return perm;
   }

   private class MyWildcardPermission implements Permission {
      private List<List<String>> m_parts = new ArrayList<List<String>>();

      public MyWildcardPermission(String permission) {
         List<String> sections = Splitters.by(':').trim().noEmptyItem().split(permission.toLowerCase());

         for (String section : sections) {
            List<String> elements = Splitters.by(',').noEmptyItem().split(section);

            m_parts.add(elements);
         }
      }

      @Override
      public boolean implies(Permission p) {
         // By default only supports comparisons with other MyWildcardPermission
         if (!(p instanceof MyWildcardPermission)) {
            return false;
         }

         MyWildcardPermission wp = findOrCreatePermission(p.toString());
         List<List<String>> otherParts = wp.m_parts;
         int i = 0;

         for (List<String> otherPart : otherParts) {
            // If this permission has less parts than the other permission, everything after the number of parts contained
            // in this permission is automatically implied, so return true
            if (m_parts.size() - 1 < i) {
               return true;
            } else {
               List<String> part = m_parts.get(i);

               for (String element : part) {
                  if (element.equals("*")) {
                     continue;
                  }

                  for (String otherElement : otherPart) {
                     if (element.startsWith("*") && otherElement.endsWith(element.substring(1))) {
                        continue;
                     } else if (element.endsWith("*") && otherElement.startsWith(element.substring(0, element.length() - 1))) {
                        continue;
                     } else if (element.equals(otherElement)) {
                        continue;
                     } else {
                        return false;
                     }
                  }
               }

               i++;
            }
         }

         // If this permission has more parts than the other parts, only imply it if all of the other parts are wildcards
         for (; i < m_parts.size(); i++) {
            List<String> part = m_parts.get(i);

            if (!part.contains("*")) {
               return false;
            }
         }

         return true;
      }

      @Override
      public String toString() {
         return String.format("%s%s", getClass().getSimpleName(), m_parts);
      }
   }
}
