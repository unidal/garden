package com.dianping.garden.wdbc;

import java.net.URL;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import com.dianping.garden.wdbc.ArticleFetcher;
import com.site.lookup.ComponentTestCase;
import com.site.wdbc.ResourceSource;
import com.site.wdbc.WdbcEngine;
import com.site.wdbc.WdbcQuery;
import com.site.wdbc.WdbcResult;
import com.site.wdbc.WdbcSource;
import com.site.wdbc.WdbcSourceType;

@RunWith(JUnit4.class)
public class JavascriptWeeklyTest extends ComponentTestCase {
   private ArticleFetcher m_fetcher;

   @Before
   public void before() throws Exception {
      m_fetcher = lookup(ArticleFetcher.class, "javascript");
   }

   @Test
   @SuppressWarnings("deprecation")
   public void testFetchArticles() throws Exception {
      Trend trend = new Trend();

      trend.setId(123);

      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "javascriptweekly.html");
      List<Article> articles = m_fetcher.getArticles(trend, "http://javascriptweekly.com/archive/1.html", source);

      assertEquals(22, articles.size());

      Article first = articles.get(0);

      assertEquals("12 Nov 2010 06:00:00 GMT", first.getPublishDate().toGMTString());
      assertEquals("jQuery Mobile Alpha 2 Released", first.getTitle());
      assertEquals("http://jquerymobile.com/2010/11/jquery-mobile-alpha-2-released/", first.getOriginLink());
      assertEquals("jQuery Mobile is a touch-optimized framework (iOS and Android are currently best supported) " + //
            "that uses jQuery and jQuery UI for its foundation. Today, John Resig has announced a second " + //
            "alpha release and suggests a final 1.0 release will occur in January 2011.", first.getAbstraction());
   }

   @Test
   public void testFetchIssueList() throws Exception {
      URL url = getClass().getResource("javascriptweekly_index.html");
      List<URL> list = m_fetcher.getIssueList(url, null);

      assertEquals(true, list.get(0).toExternalForm().endsWith("/1.html"));
      assertEquals(true, list.get(2).toExternalForm().endsWith("/3.html"));
   }

   @Test
   public void testFindQuery() throws Exception {
      WdbcQuery query = lookup(WdbcQuery.class, "JavascriptWeekly-mock");
      assertNotNull(query);

      WdbcEngine engine = lookup(WdbcEngine.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "Javascriptweekly.html");
      WdbcResult result = engine.execute(query, source);

      // System.out.println(result);
      assertNotNull(result);
      assertEquals(3, result.getRowSize());
   }

   @Test
   public void testSelectQuery() throws Exception {
      WdbcQuery query = lookup(WdbcQuery.class, "JavascriptWeekly");
      assertNotNull(query);

      WdbcEngine engine = lookup(WdbcEngine.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "Javascriptweekly.html");
      WdbcResult result = engine.execute(query, source);

      // System.out.println(result);
      assertNotNull(result);
      assertEquals(22, result.getRowSize());
   }
}
