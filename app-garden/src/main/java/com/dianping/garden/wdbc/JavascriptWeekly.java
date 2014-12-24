package com.dianping.garden.wdbc;

import java.text.MessageFormat;
import java.util.Date;
import java.util.Locale;

import com.dianping.garden.wdbc.JavascriptWeekly.JavascriptWeeklyFilter;
import org.unidal.wdbc.WdbcResult;
import org.unidal.wdbc.http.configuration.WdbcFieldMeta;
import org.unidal.wdbc.http.configuration.WdbcMeta;
import org.unidal.wdbc.query.DefaultWdbcFilter;

@WdbcMeta(name = "JavascriptWeekly", filter = JavascriptWeeklyFilter.class)
public class JavascriptWeekly extends AbstractWdbc {
   @WdbcFieldMeta("html.body.table.tr.td.p.small")
   private Date m_date;

   @WdbcFieldMeta("html.body.table.tr.td.p[*].strong.big.a")
   private String m_title;

   @WdbcFieldMeta("html.body.table.tr.td.p[*].strong.big.a.@href")
   private String m_link;

   @WdbcFieldMeta("html.body.table.tr.td.p[*]")
   private String m_text;

   public Date getDate() {
      return m_date;
   }

   public String getLink() {
      return m_link;
   }

   public String getText() {
      return m_text;
   }

   public String getTitle() {
      return m_title;
   }

   public static class JavascriptWeeklyFilter extends DefaultWdbcFilter {
      private Date m_date;

      private String m_lastText;

      @Override
      public void doFilter(WdbcResult result) {
         m_date = null;
         m_lastText = null;

         super.doFilter(result);

         if (m_date != null && result.getRowSize() > 0) {
            for (int i = 0; i < result.getRowSize(); i++) {
               result.setValue(i, "date", m_date);

            }
         }
      }

      @Override
      protected boolean shouldRemoveRow(WdbcResult result, int row) {
         String title = (String) result.getCell(row, "title");
         String date = (String) result.getCell(row, "date");
         String link = (String) result.getCell(row, "link");

         if (date != null && m_date == null) {
            try {
               MessageFormat format = new MessageFormat("Issue #{1} - {0,date,long}", Locale.US);
               Object[] parts = format.parse(date);

               m_date = (Date) parts[0];
            } catch (Exception e) {
               // ignore it
               e.printStackTrace();
            }
         }

         // row adjustment, from last to first
         String text = m_lastText;

         m_lastText = (String) result.getCell(row, "text");
         result.setValue(row, "text", text);

         if (title == null || title.length() == 0 || link == null || link.length() == 0) {
            return true;
         } else {
            return false;
         }
      }
   }
}
