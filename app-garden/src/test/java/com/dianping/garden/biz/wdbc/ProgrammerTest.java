package com.dianping.garden.biz.wdbc;

import java.net.URL;
import java.util.Calendar;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.dianping.garden.biz.article.ArticleFetcher;
import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import com.site.lookup.ComponentTestCase;
import com.site.wdbc.ResourceSource;
import com.site.wdbc.WdbcEngine;
import com.site.wdbc.WdbcQuery;
import com.site.wdbc.WdbcResult;
import com.site.wdbc.WdbcSource;
import com.site.wdbc.WdbcSourceType;

@RunWith(JUnit4.class)
public class ProgrammerTest extends ComponentTestCase {
   private ArticleFetcher m_fetcher;

   @Before
   public void before() throws Exception {
      m_fetcher = lookup(ArticleFetcher.class, "programmer");

      // we don't want any external HTTP calls happening within a test case
      ((ProgrammerFetcher) m_fetcher).setFetchNextPages(false);
   }

   @Test
   @SuppressWarnings("deprecation")
   public void testFetchArticles() throws Exception {
      Trend trend = new Trend();

      trend.setId(123);

      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "programmer.html");
      List<Article> articles = m_fetcher.getArticles(trend, "http://www.programmer.com.cn/date/2011/10/", source);

      assertEquals(10, articles.size());

      Article first = articles.get(0);

      assertEquals("31 Oct 2011 00:00:00 GMT", first.getPublishDate().toGMTString());
      assertEquals("产品管理的前世今生—今天", first.getTitle());
      assertEquals("http://www.programmer.com.cn/8437/", first.getOriginLink());
      assertEquals("文/张智渊在《产品管理的前世今生——昨天》一文中，介绍了PMS产生的市场原因、理论依据以及所属的学科范畴。" + //
            "在本篇中，将重点介绍目前国内PMS的发展现状，主要是从企业和从业者两个角度进行说明。建议所有产品管理者、" + //
            "采用或者即将采用PMS的企业阅读。国内PMS的特点PMS是随着工业化生产由“生产”为中心转变为“消费者”为中" + //
            "心而产生的，对企业来说，根本目的就是在资源有限的情况下生产出“适销对路”的产品，并保持长久的盈利和发展。" + //
            "而要实现这个目的，经过市场的选择，PMS就成为目前最适合于企业发展的组织结构。从宝洁1927年提出PMS以来" + //
            "，经过了80年的发展，PMS随着市场情况的不断变化而逐步丰满和完善，并且为全球各行各业所认可和接受。", first.getAbstraction());
   }

   @Test
   public void testFetchIssueList() throws Exception {
      List<URL> list = m_fetcher.getIssueList(null, null);

      assertEquals("http://www.programmer.com.cn/date/2009/07/", list.get(0).toExternalForm());

      Calendar cal = Calendar.getInstance();

      cal.set(2009, 7, 1);
      list = m_fetcher.getIssueList(null, cal.getTime());

      assertEquals("http://www.programmer.com.cn/date/2009/08/", list.get(0).toExternalForm());
      assertEquals("http://www.programmer.com.cn/date/2009/09/", list.get(1).toExternalForm());

      cal.set(2010, 10, 1);
      list = m_fetcher.getIssueList(null, cal.getTime());

      assertEquals("http://www.programmer.com.cn/date/2010/11/", list.get(0).toExternalForm());
      assertEquals("http://www.programmer.com.cn/date/2010/12/", list.get(1).toExternalForm());
   }

   @Test
   public void testFindQuery() throws Exception {
      WdbcQuery query = lookup(WdbcQuery.class, "Programmer-mock");
      assertNotNull(query);

      WdbcEngine engine = lookup(WdbcEngine.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "programmer.html", "utf-8");
      WdbcResult result = engine.execute(query, source);

      // System.out.println(result);
      assertNotNull(result);
      assertEquals(7, result.getRowSize());
   }

   @Test
   public void testSelectQuery() throws Exception {
      WdbcQuery query = lookup(WdbcQuery.class, "Programmer");
      assertNotNull(query);

      WdbcEngine engine = lookup(WdbcEngine.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "programmer.html");
      WdbcResult result = engine.execute(query, source);

      // System.out.println(result);
      assertNotNull(result);
      assertEquals(10, result.getRowSize());

      assertEquals("http://www.programmer.com.cn/date/2011/10/page/2/", result.getCell(9, "nextPageLink").toString());
   }
}
