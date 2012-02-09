package com.dianping.garden.wdbc;

import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import org.unidal.webres.helper.Scanners;
import org.unidal.webres.helper.Scanners.UrlMatcher;
import com.site.lookup.annotation.Inject;
import com.site.lookup.configuration.Component;
import com.site.wdbc.WdbcSource;
import com.site.wdbc.http.configuration.AbstractWdbcComponentsConfigurator;

public class Html5WeeklyFetcher implements ArticleFetcher {
   @Inject
   private WdbcMapping m_wdbcMapping;

   @Override
   public List<Component> defineComponents() {
      return new AbstractWdbcComponentsConfigurator() {
         @Override
         public List<Component> defineComponents() {
            List<Component> all = new ArrayList<Component>();

            all.add(C(ArticleFetcher.class, getId(), Html5WeeklyFetcher.class).req(WdbcMapping.class));
            all.addAll(WDBC(Html5Weekly.class));
            return all;
         }
      }.defineComponents();
   }

   @Override
   public List<Article> getArticles(Trend trend, String url, WdbcSource source) throws Exception {
      List<Article> articles = new ArrayList<Article>();

      List<Html5Weekly> result = m_wdbcMapping.apply(Html5Weekly.class, source);

      for (Html5Weekly item : result) {
         Article article = new Article();

         article.setSourceType("trend");
         article.setSourceId(trend.getId());
         article.setTitle(item.getTitle());
         article.setOriginLink(item.getLink());
         article.setAbstraction(item.getText());
         article.setTags("html5");
         article.setPublishDate(item.getDate());
         articles.add(article);
      }

      return articles;
   }

   @Override
   public String getId() {
      return "html5";
   }

   @Override
   public List<URL> getIssueList(URL baseUrl, Date lastFetchDate) throws Exception {
      return Scanners.forUrl().scan(baseUrl, new ApacheDirectoryProvider(), new UrlMatcher() {
         @Override
         public Direction matches(URL base, String path) {
            return Direction.MATCHED;
         }
      });
   }
}
