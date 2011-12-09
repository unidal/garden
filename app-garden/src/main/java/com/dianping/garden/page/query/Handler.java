package com.dianping.garden.page.query;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import com.dianping.garden.GardenPage;
import com.ebay.webres.helper.Splitters;
import com.site.dal.jdbc.DalException;
import com.site.dal.jdbc.datasource.JdbcDataSourceConfigurationManager;
import com.site.dal.jdbc.raw.RawDao;
import com.site.dal.jdbc.raw.RawDataObject;
import com.site.lookup.ContainerHolder;
import com.site.lookup.annotation.Inject;
import com.site.web.mvc.ErrorObject;
import com.site.web.mvc.PageHandler;
import com.site.web.mvc.annotation.InboundActionMeta;
import com.site.web.mvc.annotation.OutboundActionMeta;
import com.site.web.mvc.annotation.PayloadMeta;

public class Handler extends ContainerHolder implements PageHandler<Context> {
   @Inject
   private JspViewer m_jspViewer;

   @Inject
   private JdbcDataSourceConfigurationManager m_dsManager;

   @Inject
   private RawDao m_rawDao;

   private void executeQuery(Context ctx, Payload payload) {
      String sql = payload.getSql();

      if (sql != null && sql.length() > 0) {
         StringBuilder sb = new StringBuilder(sql.length() + 32);
         String filtered = filterSql(sql);

         if (filtered == null) {
            ctx.addError(new ErrorObject("query.sql.forbidden", new RuntimeException("Forbidden SQL command: " + sql)));
         } else {
            sb.append(processLimitClause(filtered, payload.getMaxRow()));
         }

         if (sb.length() > 0) {
            if (payload.isShowExecutionPlan() && sql.toUpperCase().startsWith("SELECT ")) {
               sb.insert(0, "explain ");
            }

            try {
               List<RawDataObject> rawDataObjects = m_rawDao.executeQuery(payload.getDatasource(), sb.toString());

               ctx.setRawDataObjects(rawDataObjects);
            } catch (DalException e) {
               ctx.addError(new ErrorObject("query.dal.exception", e));
            }
         }
      }
   }

   protected String filterSql(String sql) {
      List<String> statements = Splitters.by(';').noEmptyItem().trim().split(sql);
      int len = statements.size();

      for (int i = 0; i < len; i++) {
         String statement = statements.get(i);
         String upper = statement.toUpperCase();

         // NOT ALLOWED BELOW:
         // use mysql
         // set timestamp=12345678
         // show databases
         if (upper.startsWith("SET ") || upper.startsWith("USE ") || upper.startsWith("SHOW DATABASES")) {
            statements.remove(i);
            i--;
            len--;
         }
      }

      if (statements.isEmpty()) {
         return null;
      } else {
         return statements.get(0);
      }
   }

   @Override
   @PayloadMeta(Payload.class)
   @InboundActionMeta(name = "dbquery")
   public void handleInbound(Context ctx) throws ServletException, IOException {
      Payload payload = ctx.getPayload();

      if (payload.isShowHtml()) {
         executeQuery(ctx, payload);
      }
   }

   @Override
   @OutboundActionMeta(name = "dbquery")
   public void handleOutbound(Context ctx) throws ServletException, IOException {
      Model model = new Model(ctx);
      Payload payload = ctx.getPayload();
      Action action = payload.getAction();

      model.setPage(GardenPage.DB_QUERY);
      model.setAction(action);

      if (action.isMain()) {
         showMain(ctx, model);
      }

      m_jspViewer.view(ctx, model);
   }

   private void prepareHistorySqls(Context ctx, Model model) {
      Payload payload = ctx.getPayload();
      Map<String, String> historyMap = new LinkedHashMap<String, String>();
      int maxSize = 10;

      if (!ctx.hasErrors()) {
         if (payload.getSql() != null && payload.getSql().length() > 0) {
            String value = "[" + quotes(payload.getDatasource()) + "," + //
                  quotes(payload.isShowExecutionPlan() ? "1" : "0") + "," //
                  + quotes(payload.getSql()) + "]";
            String text = payload.getDatasource() + (payload.isShowExecutionPlan() ? " * " : " - ") + payload.getSql();

            historyMap.put(value, shorten(text));
         }
      }

      List<String> historySqls = payload.getHistorySqls();

      if (historySqls != null) {
         int len = historySqls.size();

         for (int i = 0; i < len; i += 2) {
            String value = historySqls.get(i);

            if (!historyMap.containsKey(value) && historyMap.size() < maxSize) {
               String text = i + 1 < len ? historySqls.get(i + 1) : "";

               historyMap.put(value, shorten(text));
            }
         }
      }

      model.setHistoryMap(historyMap);
   }

   protected String processLimitClause(String sql, int maxRow) {
      String str = sql.toUpperCase();
      int pos = str.lastIndexOf(" LIMIT ");
      StringBuilder sb = new StringBuilder(sql.length() + 32);

      if (pos > 0) {
         int start = -1;
         int num = -1;
         String snippet = str.substring(pos);

         try {
            Object[] args = new MessageFormat("{2} LIMIT {0}").parse(snippet);
            String first = (String) args[0];

            num = Integer.parseInt(first.trim());
         } catch (Exception e) {
            // ignore
         }

         if (num < 0) {
            try {
               Object[] args = new MessageFormat("{2} LIMIT {0},{1}").parse(snippet);
               String first = (String) args[0];
               String second = (String) args[1];

               start = Integer.parseInt(first.trim());
               num = Integer.parseInt(second.trim());
            } catch (Exception e) {
               // ignore
            }
         }

         if (start < 0 && num <= 0) {
            sb.append(sql);
            sb.append(" LIMIT ").append(maxRow);
         } else if (start < 0) {
            sb.append(sql.substring(0, pos));
            sb.append(" LIMIT ").append(Math.min(num, maxRow));
         } else {
            sb.append(sql.substring(0, pos));
            sb.append(" LIMIT ").append(start).append(',').append(Math.min(num, maxRow));
         }
      } else if (str.startsWith("SELECT ")) {
         sb.append(sql);
         sb.append(" LIMIT ").append(maxRow);
      } else {
         sb.append(sql);
      }

      return sb.toString();
   }

   private String quotes(Object value) {
      StringBuilder sb = new StringBuilder();
      String str = String.valueOf(value);
      int len = str.length();

      sb.append('\'');

      for (int i = 0; i < len; i++) {
         char ch = str.charAt(i);

         if (ch == '"') {
            sb.append("\\\"");
         } else if (ch == '\'') {
            sb.append("\\\'");
         } else {
            sb.append(ch);
         }
      }

      sb.append('\'');

      return sb.toString();
   }

   private String shorten(String sql) {
      // TODO
      return sql;
   }

   private void showMain(Context ctx, Model model) {
      List<String> datasources = m_dsManager.getDataSourceNames();

      model.setDataSources(datasources);
      model.setRawDataObjects(ctx.getRawDataObjects());
      model.setMaxRows(Arrays.asList(20, 50, 100));

      prepareHistorySqls(ctx, model);
   }
}
