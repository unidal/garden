package com.dianping.garden.biz.wdbc;

import java.io.IOException;
import java.net.URL;

import junit.framework.Assert;

import org.junit.Test;

import com.dianping.garden.biz.wdbc.ApacheDirectoryProvider;

public class ApacheDirectoryProviderTest {
   @Test
   public void testForHtml5Weekly() throws IOException {
      ApacheDirectoryProvider provider = new ApacheDirectoryProvider();
      URL base = new URL("http://html5weekly.com/archive/");

      Assert.assertEquals(true, provider.isDirectory(base, ""));
      Assert.assertEquals(true, provider.isDirectory(base, "/"));
      Assert.assertEquals(false, provider.isDirectory(base, "1.html"));
      Assert.assertEquals(false, provider.isDirectory(base, "/a/1.html"));

      URL url = getClass().getResource("html5weekly_index.html");
      String expected = "[1.html, 2.html, 3.html, 4.html, 5.html, 6.html, 7.html, 8.html, 9.html, 10.html, 11.html, 12.html]";

      Assert.assertEquals(expected, provider.list(url, "").toString());
   }

   @Test
   public void testForJavascriptWeekly() throws IOException {
      ApacheDirectoryProvider provider = new ApacheDirectoryProvider();
      URL base = new URL("http://javascriptweekly.com/archive/");

      Assert.assertEquals(true, provider.isDirectory(base, ""));
      Assert.assertEquals(true, provider.isDirectory(base, "/"));
      Assert.assertEquals(false, provider.isDirectory(base, "1.html"));
      Assert.assertEquals(false, provider.isDirectory(base, "/a/1.html"));

      URL url = getClass().getResource("javascriptweekly_index.html");
      String expected = "[1.html, 2.html, 3.html, 4.html, 5.html, 6.html, 7.html, 8.html, 9.html, 10.html, 11.html, 12.html, 13.html, 14.html, 15.html, 16.html, 17.html, 18.html, 19.html, 20.html, 21.html, 22.html, 23.html, 24.html, 25.html, 26.html, 27.html, 28.html, 29.html, 30.html, 31.html, 32.html, 33.html, 34.html, 35.html, 36.html, 37.html, 38.html, 39.html, 40.html, 41.html, 42.html, 43.html, 44.html, 45.html, 46.html, 47.html, 48.html, 49.html, 50.html, 51.html, 52.html]";

      Assert.assertEquals(expected, provider.list(url, "").toString());
   }
}
