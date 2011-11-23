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
   }

   @Test
   public void testFetchArticles() throws Exception {
      Trend trend = new Trend();

      trend.setId(123);

      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "programmer.html");
      List<Article> articles = m_fetcher.getArticles(trend, source);

      assertEquals(9, articles.size());

      Article first = articles.get(0);

      // assertEquals("12 Nov 2010 06:00:00 GMT",
      // first.getPublishDate().toGMTString());
      assertEquals("【书摘】Windows Phone Mango开发实践", first.getTitle());
      assertEquals("http://www.programmer.com.cn/8897/", first.getOriginLink());
      assertEquals("本书深入浅出地讲解了微软的Windows Phone Mango开发技术，每章均以实例的形式讲解，注重动手实践能力的培养。" + //
               "全书共分为3篇：基础篇、Silverlight交互篇和XNA游戏篇。基础篇重点讲解了Silverlight和XNA的基本技术、多点触控、" + //
               "传感器和服务等。Silverlight交互篇包含Windows Phone Mango的新技术、新功能，涵盖Silverlight开发的应用程序栏、" + //
               "数据存储、必应地图、数据绑定、计划操作、全景和枢轴控件、启动器和选择器、应用程序生命周期，以及MVVM模式的应用等开发技术。XNA" + //
               "游戏篇以Mango游戏开发新功能为重点，讲解集成Silverlight和XNA框架的3D应用，介绍了XNA二维游戏开发和3D模型展示的应用，" + //
               "以动手实践为核心贯穿整篇。", first.getAbstraction());
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
      assertEquals(9, result.getRowSize());
   }
}
