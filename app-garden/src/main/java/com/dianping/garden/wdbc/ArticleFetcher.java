package com.dianping.garden.wdbc;

import java.net.URL;
import java.util.Date;
import java.util.List;

import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import org.unidal.lookup.configuration.Component;
import org.unidal.wdbc.WdbcSource;

public interface ArticleFetcher {
   public List<Component> defineComponents();

   public List<Article> getArticles(Trend trend, String url, WdbcSource source) throws Exception;

   public String getId();

   public List<URL> getIssueList(URL baseUrl, Date lastFetchDate) throws Exception;
}
