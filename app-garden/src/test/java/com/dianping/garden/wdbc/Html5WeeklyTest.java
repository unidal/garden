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
public class Html5WeeklyTest extends ComponentTestCase {
   private ArticleFetcher m_fetcher;

   @Before
   public void before() throws Exception {
      m_fetcher = lookup(ArticleFetcher.class, "html5");
   }

   @Test
   @SuppressWarnings("deprecation")
   public void testFetchArticles() throws Exception {
      Trend trend = new Trend();

      trend.setId(123);

      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "html5weekly.html");
      List<Article> articles = m_fetcher.getArticles(trend, "http://html5weekly.com/archive/1.html", source);

      assertEquals(30, articles.size());

      Article first = articles.get(0);

      assertEquals("24 Aug 2011 06:00:00 GMT", first.getPublishDate().toGMTString());
      assertEquals("Firefox 6 Is Here: What's New For Developers?", first.getTitle());
      assertEquals("http://hacks.mozilla.org/2011/08/firefox6/?utm_source=html5weekly&utm_medium=email", first.getOriginLink());
      assertEquals("Louis Remi does a round up of what's new in Firefox 6 for Web developers. " + //
            "Highlights include more HTML 5 compatibility and CSS and DOM functionality.", first.getAbstraction());
   }

   @Test
   public void testFetchIssueList() throws Exception {
      URL url = getClass().getResource("html5weekly_index.html");
      List<URL> list = m_fetcher.getIssueList(url, null);

      assertEquals(true, list.get(0).toExternalForm().endsWith("/1.html"));
      assertEquals(true, list.get(2).toExternalForm().endsWith("/3.html"));
   }

   @Test
   public void testFindQuery() throws Exception {
      WdbcQuery query = lookup(WdbcQuery.class, "Html5Weekly-mock");
      assertNotNull(query);

      WdbcEngine engine = lookup(WdbcEngine.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "html5weekly.html");
      WdbcResult result = engine.execute(query, source);

      // System.out.println(result);
      assertNotNull(result);
      assertEquals(2, result.getRowSize());
   }

   @Test
   public void testSelectQuery() throws Exception {
      WdbcQuery query = lookup(WdbcQuery.class, "Html5Weekly");
      assertNotNull(query);

      WdbcEngine engine = lookup(WdbcEngine.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "html5weekly.html");
      WdbcResult result = engine.execute(query, source);

      // System.out.println(result);
      assertNotNull(result);
      assertEquals(30, result.getRowSize());
   }
}
