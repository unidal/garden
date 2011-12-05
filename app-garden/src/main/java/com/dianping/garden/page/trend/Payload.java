package com.dianping.garden.page.trend;

import com.dianping.garden.GardenPage;
import com.site.web.mvc.ActionContext;
import com.site.web.mvc.ActionPayload;
import com.site.web.mvc.payload.annotation.FieldMeta;

public class Payload implements ActionPayload<GardenPage, Action> {
   private GardenPage m_page;

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
   public GardenPage getPage() {
      return m_page;
   }

   public int getPageNumber() {
      return m_pageNumber;
   }

   public int getPageSize() {
      return m_pageSize;
   }

   public void setAction(String action) {
      m_action = Action.getByName(action, Action.LIST);
   }

   @Override
   public void setPage(String page) {
      m_page = GardenPage.getByName(page, GardenPage.TRENDS);
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
         m_action = Action.LIST;
      }

      if (m_pageNumber <= 0) {
         m_pageNumber = 1;
      }

      if (m_pageSize <= 0) {
         m_pageSize = 10;
      }
   }
}