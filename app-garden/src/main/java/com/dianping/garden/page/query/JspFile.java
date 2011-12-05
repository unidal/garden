package com.dianping.garden.page.query;

public enum JspFile {
   MAIN("/jsp/dbquery/main.jsp"),

   ;

   private String m_path;

   private JspFile(String path) {
      m_path = path;
   }

   public String getPath() {
      return m_path;
   }
}
