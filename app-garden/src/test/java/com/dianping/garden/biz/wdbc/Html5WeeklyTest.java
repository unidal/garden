package com.dianping.garden.biz.wdbc;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.site.lookup.ComponentTestCase;
import com.site.wdbc.ResourceSource;
import com.site.wdbc.WdbcEngine;
import com.site.wdbc.WdbcQuery;
import com.site.wdbc.WdbcResult;
import com.site.wdbc.WdbcSource;
import com.site.wdbc.WdbcSourceType;

@RunWith(JUnit4.class)
public class Html5WeeklyTest extends ComponentTestCase {
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

   @SuppressWarnings("deprecation")
   @Test
   public void testWdbcMapping() throws Exception {
      WdbcMapping mapping = lookup(WdbcMapping.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "html5weekly.html");

      List<Html5Weekly> list = mapping.apply(Html5Weekly.class, source);

      assertEquals(30, list.size());

      Html5Weekly first = list.get(0);

      assertEquals("24 Aug 2011 06:00:00 GMT", first.getDate().toGMTString());
      assertEquals("Firefox 6 Is Here: What's New For Developers?", first.getTitle());
      assertEquals("http://hacks.mozilla.org/2011/08/firefox6/?utm_source=html5weekly&utm_medium=email",
               first.getLink());
      assertEquals("Louis Remi does a round up of what's new in Firefox 6 for Web developers. " + //
               "Highlights include more HTML 5 compatibility and CSS and DOM functionality.", first.getText());
   }
}
