package com.dianping.garden.biz.wdbc;

import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dianping.garden.biz.article.ArticleFetcher;
import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import com.ebay.webres.helper.Scanners;
import com.ebay.webres.helper.Scanners.UrlMatcher;
import com.site.lookup.annotation.Inject;
import com.site.lookup.configuration.Component;
import com.site.wdbc.WdbcSource;
import com.site.wdbc.http.configuration.AbstractWdbcComponentsConfigurator;

public class JavascriptWeeklyFetcher implements ArticleFetcher {
   @Inject
   private WdbcMapping m_wdbcMapping;

   @Override
   public List<Component> defineComponents() {
      return new AbstractWdbcComponentsConfigurator() {
         @Override
         public List<Component> defineComponents() {
            List<Component> all = new ArrayList<Component>();

            all.add(C(ArticleFetcher.class, getId(), JavascriptWeeklyFetcher.class).req(WdbcMapping.class));
            all.addAll(WDBC(JavascriptWeekly.class));
            return all;
         }
      }.defineComponents();
   }

   @Override
   public List<Article> getArticles(Trend trend, WdbcSource source) throws Exception {
      List<Article> articles = new ArrayList<Article>();

      List<JavascriptWeekly> result = m_wdbcMapping.apply(JavascriptWeekly.class, source);
      Date publishDate = null;

      for (JavascriptWeekly item : result) {
         Article article = new Article();

         article.setSourceType("trend");
         article.setSourceId(trend.getId());
         article.setTitle(item.getTitle());
         article.setOriginLink(item.getLink());
         article.setAbstraction(item.getText());
         article.setTags("javascript");
         article.setPublishDate(publishDate);
         articles.add(article);
      }

      return articles;
   }

   @Override
   public String getId() {
      return "javascript";
   }

   @Override
   public List<URL> getIssueList(String baseUrl, Date lastFetchDate) throws Exception {
      return Scanners.forUrl().scan(new URL(baseUrl), new ApacheDirectoryProvider(), new UrlMatcher() {
         @Override
         public Direction matches(URL base, String path) {
            return Direction.MATCHED;
         }
      });
   }
}
