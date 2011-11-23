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
public class JavascriptWeeklyTest extends ComponentTestCase {
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

   @SuppressWarnings("deprecation")
   @Test
   public void testWdbcMapping() throws Exception {
      WdbcMapping mapping = lookup(WdbcMapping.class);
      WdbcSource source = new ResourceSource(WdbcSourceType.HTML, "Javascriptweekly.html");

      List<JavascriptWeekly> list = mapping.apply(JavascriptWeekly.class, source);

      assertEquals(22, list.size());

      JavascriptWeekly first = list.get(0);

      assertEquals("12 Nov 2010 06:00:00 GMT", first.getDate().toGMTString());
      assertEquals("jQuery Mobile Alpha 2 Released", first.getTitle());
      assertEquals("http://jquerymobile.com/2010/11/jquery-mobile-alpha-2-released/", first.getLink());
      assertEquals("jQuery Mobile is a touch-optimized framework (iOS and Android are currently best supported) " + //
               "that uses jQuery and jQuery UI for its foundation. Today, John Resig has announced a second " + //
               "alpha release and suggests a final 1.0 release will occur in January 2011.", first.getText());
   }
}
