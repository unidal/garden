package com.dianping.garden.wdbc;

import com.dianping.garden.wdbc.Programmer.ProgrammerFilter;
import com.site.wdbc.WdbcResult;
import com.site.wdbc.http.configuration.WdbcFieldMeta;
import com.site.wdbc.http.configuration.WdbcMeta;
import com.site.wdbc.query.DefaultWdbcFilter;

@WdbcMeta(name = "Programmer", filter = ProgrammerFilter.class)
public class Programmer extends AbstractWdbc {
   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[*].div")
   private int m_day;

   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[*].div[2].h2.a")
   private String m_title;

   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[*].div[2].h2.a.@href")
   private String m_link;

   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[*].div[3].*text")
   private String m_text;

   @WdbcFieldMeta("html.body.div.div.div[3].div.div.div[11].span.a.@href")
   private String m_nextPageLink;

   public int getDay() {
      return m_day;
   }

   public String getLink() {
      return m_link;
   }

   public String getNextPageLink() {
      return m_nextPageLink;
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
         String date = (String) result.getCell(row, "day");

         if (text != null && text.endsWith(" 阅读全文 »")) {
            result.setValue(row, "text", text.substring(0, text.length() - " 阅读全文 »".length()));
         }

         if (date != null) {
            result.setValue(row, "day", toDay(date.trim()));
         }

         return false;
      }

      private int toDay(String str) {
         int day = 0;
         int len = str.length();

         for (int i = 0; i < len; i++) {
            char ch = str.charAt(i);

            day = day * 10 + (ch - '0');
         }

         return day;
      }
   }
}
