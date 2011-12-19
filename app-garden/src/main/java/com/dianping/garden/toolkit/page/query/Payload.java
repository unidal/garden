package com.dianping.garden.toolkit.page.query;

import java.util.ArrayList;
import java.util.List;

import com.dianping.garden.toolkit.ToolkitPage;
import com.site.web.jsp.function.Decoder;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<ToolkitPage, Action> {
   private ToolkitPage m_page;

   @FieldMeta(value = "op")
   private Action m_action;

   @FieldMeta("html")
   private boolean m_showHtml;

   @FieldMeta("ds")
   private String m_datasource;

   @FieldMeta("sql")
   private String m_sql;

   @FieldMeta("style")
   private String m_style;

   @FieldMeta("explain")
   private boolean m_showExecutionPlan;

   @FieldMeta("history")
   private List<String> m_historySqls;

   @FieldMeta("maxRow")
   private int m_maxRow;

   @Override
   public Action getAction() {
      return m_action;
   }

   public String getDatasource() {
      return m_datasource;
   }

   public List<String> getHistorySqls() {
      return m_historySqls;
   }

   public int getMaxRow() {
      return m_maxRow;
   }

   @Override
   public ToolkitPage getPage() {
      return m_page;
   }

   public String getSql() {
      return m_sql;
   }

   public String getStyle() {
      return m_style;
   }

   public boolean isShowExecutionPlan() {
      return m_showExecutionPlan;
   }

   public boolean isShowHtml() {
      return m_showHtml;
   }

   public void setAction(String action) {
      m_action = Action.getByName(action, Action.MAIN);
   }

   public void setDatasource(String datasource) {
      m_datasource = datasource;
   }

   public void setHistorySqls(String historySqls) {
      List<String> sqls = new ArrayList<String>(20);
      String history = Decoder.urlDecode(historySqls);
      int len = history.length();
      int off = 0;

      while (len > 0) {
         int pos = history.indexOf("@@@", off);

         if (pos < 0) {
            sqls.add(history.substring(off));
            break;
         } else {
            sqls.add(history.substring(off, pos));
            off = pos + "@@@".length();
         }
      }

      m_historySqls = sqls;
   }

   public void setMaxRow(String maxRow) {
      try {
         m_maxRow = Integer.parseInt(maxRow);
      } catch (NumberFormatException e) {
         // ignore it
      }
   }

   @Override
   public void setPage(String page) {
      m_page = ToolkitPage.getByName(page, ToolkitPage.QUERY);
   }

   public void setShowExecutionPlan(boolean showExecutionPlan) {
      m_showExecutionPlan = showExecutionPlan;
   }

   public void setShowHtml(boolean showHtml) {
      m_showHtml = showHtml;
   }

   public void setSql(String sql) {
      m_sql = sql.trim();
   }

   @Override
   public void validate(ActionContext<?> ctx) {
      if (m_action == null) {
         m_action = Action.MAIN;
      }

      if (m_style == null || m_style.length() == 0) {
         m_style = "width:640px;height:60px;";
      }

      if (m_maxRow < 1 || m_maxRow > 1000) {
         m_maxRow = 20;
      }
   }
}