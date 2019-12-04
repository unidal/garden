package org.unidal.web.admin.configuration;

import java.util.List;

public interface ConfigService {
   public String CATEGORY_SCENARIO = "scenario";

   public String CATEGORY_GRAPHQL = "graphql";

   public String CATEGORY_CONFIG = "config";

   public String CATEGORY_SECURITY = "security";

   public List<String> findAllConfig(String category) throws ConfigException;

   public String findConfig(String category, String name, String defaultValue) throws ConfigException;

   public boolean getBoolean(String category, String name, boolean defaultValue);

   public String getString(String category, String name, String defaultValue);

   public void register(ConfigEventListener listener);

   public void updateConfig(String category, String name, String description, String config) throws ConfigException;
}
