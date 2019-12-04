package org.unidal.web.admin.configuration;

public enum EventType {
   META_CREATED("meta-created"),

   META_UPDATED("meta-updated"),

   ENTITY_CREATED("entity-created"),

   ENTITY_UPDATED("entity-updated"),

   ENTITY_TAGGED("entity-tagged"),
   
   CONFIG_CHANGED("config-changed");

   private String m_id;

   private EventType(String id) {
      m_id = id;
   }

   public static EventType getById(String id, EventType defaultValue) {
      for (EventType value : values()) {
         if (value.getId().equals(id)) {
            return value;
         }
      }

      return defaultValue;
   }

   public String getId() {
      return m_id;
   }
}