package com.dianping.garden.wdbc;

import java.net.URL;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import com.ebay.webres.helper.Files;
import com.site.lookup.annotation.Inject;
import com.site.lookup.configuration.Component;
import com.site.wdbc.StringSource;
import com.site.wdbc.WdbcSource;
import com.site.wdbc.WdbcSourceType;
import com.site.wdbc.http.configuration.AbstractWdbcComponentsConfigurator;

public class ProgrammerFetcher implements ArticleFetcher {
   @Inject
   private WdbcMapping m_wdbcMapping;

   private MessageFormat m_buildFormat = new MessageFormat("http://www.programmer.com.cn/date/{0,date,yyyy/MM}/");

   private MessageFormat m_parseFormat = new MessageFormat("http://www.programmer.com.cn/date/{0,number}/{1,number}/");

   private boolean m_fetchNextPages = true;

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
   public List<Article> getArticles(Trend trend, String url, WdbcSource source) throws Exception {
      List<Article> articles = new ArrayList<Article>();

      List<Programmer> result = m_wdbcMapping.apply(Programmer.class, source);
      Calendar cal = Calendar.getInstance();

      try {
         Object[] parts = m_parseFormat.parse(url);
         long year = (Long) parts[0];
         long month = (Long) parts[1];

         cal.setTimeZone(TimeZone.getTimeZone("GMT"));
         cal.set((int) year, (int) month - 1, 1, 0, 0, 0);
      } catch (Exception e) {
         e.printStackTrace();
      }

      while (true) { // for multiple pages
         for (Programmer item : result) {
            Article article = new Article();

            cal.set(Calendar.DATE, item.getDay());
            article.setSourceType("trend");
            article.setSourceId(trend.getId());
            article.setTitle(item.getTitle());
            article.setOriginLink(item.getLink());
            article.setAbstraction(item.getText());
            article.setTags("programmer");
            article.setPublishDate(cal.getTime());
            articles.add(article);
         }

         if (!m_fetchNextPages || result.size() < 10) {
            break;
         }

         String nextPageLink = result.get(9).getNextPageLink();

         result.clear();

         if (nextPageLink != null) {
            System.out.println();
            System.out.print("Downloading " + nextPageLink + " ...");

            String content = Files.forIO().readFrom(new URL(nextPageLink).openStream(), "utf-8");
            StringSource nextSource = new StringSource(WdbcSourceType.HTML, content);
            result = m_wdbcMapping.apply(Programmer.class, nextSource);
         }
      }

      return articles;
   }

   @Override
   public String getId() {
      return "programmer";
   }

   @Override
   public List<URL> getIssueList(URL baseUrl, Date lastFetchDate) throws Exception {
      List<URL> list = new ArrayList<URL>();
      Calendar start = Calendar.getInstance();
      Calendar end = Calendar.getInstance();

      if (lastFetchDate == null) {
         start.set(2009, 6, 1); // starting from July 2009
      } else {
         start.setTime(lastFetchDate);
      }

      while (start.before(end)) {
         String link = m_buildFormat.format(new Object[] { start.getTime() });

         list.add(new URL(link));
         start.add(Calendar.MONTH, 1);
      }

      return list;
   }

   public void setFetchNextPages(boolean fetchNextPages) {
      m_fetchNextPages = fetchNextPages;
   }
}
