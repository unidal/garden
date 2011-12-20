package com.dianping.garden.dashboard.page.trend;

import com.dianping.garden.dashboard.DashboardPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<DashboardPage, Action> {
   private DashboardPage m_page;

   @FieldMeta(value = "op")
   private Action m_action;

   @FieldMeta("page")
   private int m_pageNumber;

   @FieldMeta("pageSize")
   private int m_pageSize;

   @Override
   public Action getAction() {
      return m_action;
   }

   @Override
   public DashboardPage getPage() {
      return m_page;
   }

   public int getPageNumber() {
      return m_pageNumber;
   }

   public int getPageSize() {
      return m_pageSize;
   }

   public void setAction(String action) {
      m_action = Action.getByName(action, Action.TREND);
   }

   @Override
   public void setPage(String page) {
      m_page = DashboardPage.getByName(page, DashboardPage.TREND);
   }

   public void setPageSize(String pageSize) {
      try {
         m_pageSize = Integer.parseInt(pageSize);
      } catch (Exception e) {
         // ignore it
      }
   }

   public void setPageNumber(String pageNumber) {
      try {
         m_pageNumber = Integer.parseInt(pageNumber);
      } catch (Exception e) {
         // ignore it
      }
   }

   @Override
   public void validate(ActionContext<?> ctx) {
      if (m_action == null) {
         m_action = Action.TREND;
      }

      if (m_pageNumber <= 0) {
         m_pageNumber = 1;
      }

      if (m_pageSize <= 0) {
         m_pageSize = 10;
      }
   }
}