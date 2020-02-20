package org.unidal.orchid.diagram;

import org.unidal.orchid.diagram.DiagramRepository.Properties;
import org.unidal.orchid.diagram.entity.RepositoryModel;

public class RepositoryProperties implements Properties {
   private RepositoryModel m_repository;

   public RepositoryProperties(RepositoryModel repository) {
      m_repository = repository;
   }

   @Override
   public boolean getBooleanProperty(String name, boolean defaultValue) {
      String value = getStringProperty(name, null);

      if (value != null) {
         return Boolean.valueOf(value);
      } else {
         return defaultValue;
      }
   }

   @Override
   public long getIntProperty(String name, int defaultValue) {
      String value = getStringProperty(name, null);

      if (value != null) {
         try {
            return Integer.parseInt(value);
         } catch (NumberFormatException e) {
            // ignore it
         }
      }

      return defaultValue;
   }

   @Override
   public long getLongProperty(String name, long defaultValue) {
      String value = getStringProperty(name, null);

      if (value != null) {
         try {
            return Long.parseLong(value);
         } catch (NumberFormatException e) {
            // ignore it
         }
      }

      return defaultValue;
   }

   @Override
   public String getStringProperty(String name, String defaultValue) {
      String value = m_repository.getDynamicAttribute(name);

      if (value != null) {
         return value;
      } else {
         return defaultValue;
      }
   }
}