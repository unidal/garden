package com.dianping.garden.dashboard;

import com.site.web.mvc.Page;
import com.site.web.mvc.annotation.ModuleMeta;

public enum DashboardPage implements Page {

   HOME("home", "home", "Home", "Home Page of Garden", true),

   TREND("trend", "trend", "Trend", "Technical Trends", true);

   private String m_name;

   private String m_path;

   private String m_title;

   private String m_description;

   private boolean m_standalone;

   private DashboardPage(String name, String path, String title, String description, boolean standalone) {
      m_name = name;
      m_path = path;
      m_title = title;
      m_description = description;
      m_standalone = standalone;
   }

   public static DashboardPage getByName(String name, DashboardPage defaultPage) {
      for (DashboardPage action : DashboardPage.values()) {
         if (action.getName().equals(name)) {
            return action;
         }
      }

      return defaultPage;
   }

   public String getDescription() {
      return m_description;
   }

   public String getModuleName() {
      ModuleMeta meta = DashboardModule.class.getAnnotation(ModuleMeta.class);

      if (meta != null) {
         return meta.name();
      } else {
         return null;
      }
   }

   @Override
   public String getName() {
      return m_name;
   }

   @Override
   public String getPath() {
      return m_path;
   }

   public String getTitle() {
      return m_title;
   }

   public boolean isStandalone() {
      return m_standalone;
   }

   public DashboardPage[] getValues() {
      return DashboardPage.values();
   }
}
