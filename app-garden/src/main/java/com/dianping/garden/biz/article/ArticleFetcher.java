package com.dianping.garden.biz.article;

import java.net.URL;
import java.util.Date;
import java.util.List;

import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import com.site.lookup.configuration.Component;
import com.site.wdbc.WdbcSource;

public interface ArticleFetcher {
   public List<Component> defineComponents();

   public List<Article> getArticles(Trend trend, WdbcSource source) throws Exception;

   public String getId();

   public List<URL> getIssueList(String baseUrl, Date lastFetchDate) throws Exception;
}
