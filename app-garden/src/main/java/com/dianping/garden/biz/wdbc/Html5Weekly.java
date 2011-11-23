package com.dianping.garden.biz.wdbc;

import java.text.MessageFormat;
import java.util.Date;
import java.util.Locale;

import com.dianping.garden.biz.wdbc.Html5Weekly.Html5WeeklyFilter;
import com.site.wdbc.WdbcResult;
import com.site.wdbc.http.configuration.WdbcFieldMeta;
import com.site.wdbc.http.configuration.WdbcMeta;
import com.site.wdbc.query.DefaultWdbcFilter;

@WdbcMeta(name = "Html5Weekly", filter = Html5WeeklyFilter.class)
public class Html5Weekly extends AbstractWdbc {
   @WdbcFieldMeta("html.body.table.tr.td.table.tr[2].td.p")
   private Date m_date;

   @WdbcFieldMeta("html.body.table.tr.td.table.tr[2].td.div[*].div.a")
   private String m_title;

   @WdbcFieldMeta("html.body.table.tr.td.table.tr[2].td.div[*].div.a.@href")
   private String m_link;

   @WdbcFieldMeta("html.body.table.tr.td.table.tr[2].td.div[*].div[2]")
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

   public static class Html5WeeklyFilter extends DefaultWdbcFilter {
      @Override
      protected boolean shouldRemoveRow(WdbcResult result, int row) {
         if (row == 0) {
            String date = (String) result.getCell(row, "date");

            if (date != null) {
               try {
                  MessageFormat format = new MessageFormat("Issue #{1} - {0,date,long}", Locale.US);
                  Object[] parts = format.parse(date);

                  result.setValue(row, "date", parts[0]);
               } catch (Exception e) {
                  // ignore it
                  e.printStackTrace();
               }
            }
         }

         String link = (String) result.getCell(row, "link");

         if (link == null || link.equals("http://cooperpress.com/")) {
            return true;
         } else {
            return false;
         }
      }
   }
}
