package org.unidal.web.admin.configuration;

public class ConfigException extends Exception {
   private static final long serialVersionUID = 1L;

   public ConfigException(String message) {
      super(message);
   }

   public ConfigException(String message, Throwable cause) {
      super(message, cause);
   }
}
