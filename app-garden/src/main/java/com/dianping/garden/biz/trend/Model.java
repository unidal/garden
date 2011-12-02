package com.dianping.garden.biz.trend;

import java.util.List;

import com.dianping.garden.biz.GardenPage;
import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import com.site.web.mvc.ViewModel;

public class Model extends ViewModel<GardenPage, Action, Context> {
   private Action m_action;

   private List<Trend> m_trends;

   private List<Article> m_articles;

   private int m_maxPage;

   public Model(Context ctx) {
      super(ctx);
   }

   public Action getAction() {
      return m_action;
   }

   public List<Article> getArticles() {
      return m_articles;
   }

   @Override
   public Action getDefaultAction() {
      return Action.LIST;
   }

   public int getMaxPage() {
      return m_maxPage;
   }

   public List<Trend> getTrends() {
      return m_trends;
   }

   public void setAction(Action action) {
      m_action = action;
   }

   public void setArticles(List<Article> articles) {
      this.m_articles = articles;
   }

   public void setMaxPage(int maxPage) {
      m_maxPage = maxPage;
   }

   public void setTrends(List<Trend> trends) {
      m_trends = trends;
   }
}
