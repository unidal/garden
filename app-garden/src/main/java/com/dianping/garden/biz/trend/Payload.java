package com.dianping.garden.biz.trend;

import com.dianping.garden.biz.TrendPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<TrendPage, Action> {
   private TrendPage m_page;

   @FieldMeta(value = "op")
   private Action m_action;

   @FieldMeta("startId")
   private int m_startId;

   @FieldMeta("pageSize")
   private int m_pageSize;

   @Override
   public Action getAction() {
      return m_action;
   }

   @Override
   public TrendPage getPage() {
      return m_page;
   }

   public int getPageSize() {
      return m_pageSize;
   }

   public int getStartId() {
      return m_startId;
   }

   public void setAction(String action) {
      m_action = Action.getByName(action, Action.LIST);
   }

   @Override
   public void setPage(String page) {
      m_page = TrendPage.getByName(page, TrendPage.TRENDS);
   }

   public void setPageSize(String pageSize) {
      try {
         m_pageSize = Integer.parseInt(pageSize);
      } catch (Exception e) {
         // ignore it
      }
   }

   public void setStartId(String startId) {
      try {
         m_startId = Integer.parseInt(startId);
      } catch (Exception e) {
         // ignore it
      }
   }

   @Override
   public void validate(ActionContext<?> ctx) {
      if (m_action == null) {
         m_action = Action.LIST;
      }

      if (m_startId <= 0) {
         m_startId = Integer.MAX_VALUE;
      }

      if (m_pageSize <= 0) {
         m_pageSize = 10;
      }
   }
}