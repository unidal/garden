package com.dianping.garden.biz.query;

import java.util.List;

import com.dianping.garden.biz.GardenPage;
import com.ebay.webres.helper.Joiners;
import com.site.dal.jdbc.raw.RawDataObject;
import com.site.web.mvc.ViewModel;

public class Model extends ViewModel<GardenPage, Action, Context> {
   private Action m_action;

   private List<String> m_datasources;

   private List<String> m_historySqls;

   private List<RawDataObject> m_rawDataObjects;

   private List<Integer> m_maxRows;

   public Model(Context ctx) {
      super(ctx);
   }

   public Action getAction() {
      return m_action;
   }

   public List<String> getDatasources() {
      return m_datasources;
   }

   @Override
   public Action getDefaultAction() {
      return Action.MAIN;
   }

   public String getHistory() {
      return Joiners.by("@@@").noEmptyItem().join(m_historySqls);
   }

   public List<String> getHistorySqls() {
      return m_historySqls;
   }

   public List<Integer> getMaxRows() {
      return m_maxRows;
   }

   public List<RawDataObject> getRawDataObjects() {
      return m_rawDataObjects;
   }

   public void setAction(Action action) {
      m_action = action;
   }

   public void setDataSources(List<String> datasources) {
      m_datasources = datasources;
   }

   public void setHistorySqls(List<String> historySqls) {
      m_historySqls = historySqls;
   }

   public void setMaxRows(List<Integer> maxRows) {
      m_maxRows = maxRows;
   }

   public void setRawDataObjects(List<RawDataObject> rawDataObjects) {
      m_rawDataObjects = rawDataObjects;
   }
}
