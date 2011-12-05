package com.dianping.garden.wdbc;

import java.lang.reflect.Field;

public abstract class AbstractWdbc {
   private String getFieldName(Field field) {
      String name = field.getName();

      if (name.startsWith("m_")) {
         return name.substring(2);
      } else {
         return name;
      }
   }

   @Override
   public String toString() {
      StringBuilder sb = new StringBuilder(1024);
      Field[] fields = getClass().getDeclaredFields();
      boolean first = true;

      sb.append(getClass().getSimpleName()).append('[');

      try {
         for (Field field : fields) {
            String name = getFieldName(field);

            if (!field.isAccessible()) {
               field.setAccessible(true);
            }

            if (first) {
               first = false;
            } else {
               sb.append(", ");
            }

            sb.append(name).append('=').append(field.get(this));
         }
      } catch (Exception e) {
         throw new RuntimeException("Internal error happened.", e);
      }

      sb.append(']');

      return sb.toString();
   }
}
