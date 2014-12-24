package org.unidal.garden.rose.query.home;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.unidal.dal.jdbc.raw.RawDataObject;
import org.unidal.garden.rose.query.QueryPage;
import org.unidal.web.mvc.ViewModel;

public class Model extends ViewModel<QueryPage, Action, Context> {
	private Action m_action;

	private List<String> m_datasources;

   private Map<String, String> m_historyMap;

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
		return Action.VIEW;
	}

   public String getHistory() {
      StringBuilder sb = new StringBuilder(4096);
      boolean first = true;

      for (Entry<String, String> e : m_historyMap.entrySet()) {
         String key = e.getKey();

         if (key.length() > 0) {
            if (first) {
               first = false;
            } else {
               sb.append("@@@");
            }

            sb.append(key).append("@@@").append(e.getValue());
         }
      }

      return sb.toString();
   }

   public Set<Entry<String, String>> getHistoryEntries() {
      return m_historyMap.entrySet();
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

   public void setHistoryMap(Map<String, String> historyMap) {
      m_historyMap = historyMap;
   }

   public void setMaxRows(List<Integer> maxRows) {
      m_maxRows = maxRows;
   }

   public void setRawDataObjects(List<RawDataObject> rawDataObjects) {
      m_rawDataObjects = rawDataObjects;
   }

}
