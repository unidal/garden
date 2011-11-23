package com.dianping.garden.biz.wdbc;

import com.dianping.garden.biz.wdbc.Programmer.ProgrammerFilter;
import com.site.wdbc.WdbcResult;
import com.site.wdbc.http.configuration.WdbcFieldMeta;
import com.site.wdbc.http.configuration.WdbcMeta;
import com.site.wdbc.query.DefaultWdbcFilter;

@WdbcMeta(name = "Programmer", filter = ProgrammerFilter.class)
public class Programmer extends AbstractWdbc {
   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[*].div[2].h2.a")
   private String m_title;

   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[*].div[2].h2.a.@href")
   private String m_link;

   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[*].div[3].*text")
   private String m_text;

   public String getLink() {
      return m_link;
   }

   public String getText() {
      return m_text;
   }

   public String getTitle() {
      return m_title;
   }

   public static class ProgrammerFilter extends DefaultWdbcFilter {
      @Override
      protected boolean shouldRemoveRow(WdbcResult result, int row) {
         String text = (String) result.getCell(row, "text");

         if (text != null && text.endsWith(" 阅读全文 »")) {
            result.setValue(row, "text", text.substring(0, text.length() - " 阅读全文 »".length()));
         }

         return false;
      }
   }
}
