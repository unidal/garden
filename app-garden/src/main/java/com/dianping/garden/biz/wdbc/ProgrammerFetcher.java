package com.dianping.garden.biz.wdbc;

import java.net.URL;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.dianping.garden.biz.article.ArticleFetcher;
import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import com.site.lookup.annotation.Inject;
import com.site.lookup.configuration.Component;
import com.site.wdbc.WdbcSource;
import com.site.wdbc.http.configuration.AbstractWdbcComponentsConfigurator;

public class ProgrammerFetcher implements ArticleFetcher {
   @Inject
   private WdbcMapping m_wdbcMapping;

   @Override
   public List<Component> defineComponents() {
      return new AbstractWdbcComponentsConfigurator() {
         @Override
         public List<Component> defineComponents() {
            List<Component> all = new ArrayList<Component>();

            all.add(C(ArticleFetcher.class, getId(), ProgrammerFetcher.class).req(WdbcMapping.class));
            all.addAll(WDBC(Programmer.class));
            return all;
         }
      }.defineComponents();
   }

   @Override
   public List<Article> getArticles(Trend trend, WdbcSource source) throws Exception {
      List<Article> articles = new ArrayList<Article>();

      List<Programmer> result = m_wdbcMapping.apply(Programmer.class, source);
      Date publishDate = null;

      for (Programmer item : result) {
         Article article = new Article();

         article.setSourceType("trend");
         article.setSourceId(trend.getId());
         article.setTitle(item.getTitle());
         article.setOriginLink(item.getLink());
         article.setAbstraction(item.getText());
         article.setTags("programmer");
         article.setPublishDate(publishDate);
         articles.add(article);
      }

      return articles;
   }

   @Override
   public String getId() {
      return "programmer";
   }

   @Override
   public List<URL> getIssueList(String baseUrl, Date lastFetchDate) throws Exception {
      List<URL> list = new ArrayList<URL>();
      Calendar start = Calendar.getInstance();
      Calendar end = Calendar.getInstance();

      if (lastFetchDate == null) {
         start.set(2009, 6, 1); // starting from July 2009
      } else {
         start.setTime(lastFetchDate);
      }

      MessageFormat format = new MessageFormat("http://www.programmer.com.cn/date/{0,date,yyyy/MM}/");

      while (start.before(end)) {
         String link = format.format(new Object[] { start.getTime() });

         list.add(new URL(link));
         start.add(Calendar.MONTH, 1);
      }

      return list;
   }
}
