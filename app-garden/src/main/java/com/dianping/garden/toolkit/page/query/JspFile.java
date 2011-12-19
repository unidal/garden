package com.dianping.garden.toolkit.page.query;

public enum JspFile {
   MAIN("/jsp/toolkit/query/main.jsp"),

   ;

   private String m_path;

   private JspFile(String path) {
      m_path = path;
   }

   public String getPath() {
      return m_path;
   }
}
