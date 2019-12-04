package org.unidal.web.security.authorization;

public enum TulipApiPermission {
   ENTITY("api:entity"),

   SCENARIO("api:scenario"),

   GRAPHQL("api:graphql"),

   ;

   private String m_prefix;

   private TulipApiPermission(String prefix) {
      m_prefix = prefix;
   }

   public String on(String target) {
      return m_prefix + ":" + target;
   }
}
