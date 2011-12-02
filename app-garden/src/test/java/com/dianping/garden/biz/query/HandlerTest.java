package com.dianping.garden.biz.query;

import junit.framework.Assert;

import org.junit.Test;

public class HandlerTest {
   private void checkLimit(String sql, int maxRow, String expected) {
      Handler handler = new Handler();
      String actual = handler.processLimitClause(sql, maxRow);

      Assert.assertEquals(expected, actual);
   }

   @Test
   public void testProcessLimitClause() {
      checkLimit("select * from user", 20, "select * from user LIMIT 20");
      checkLimit("select * from user limit 3", 20, "select * from user LIMIT 3");
      checkLimit("select * from user limit 30", 20, "select * from user LIMIT 20");
      checkLimit("select * from user limit 30", 50, "select * from user LIMIT 30");
      checkLimit("select * from user limit 30,3", 20, "select * from user LIMIT 30,3");
      checkLimit("select * from user limit 30,30", 20, "select * from user LIMIT 30,20");
      checkLimit("select * from user limit 30,30", 50, "select * from user LIMIT 30,30");
      checkLimit("select * from (select * from user limit 3) a", 20, "select * from (select * from user limit 3) a LIMIT 20");
      
      checkLimit("desc user", 50, "desc user");
      checkLimit("explain select * from user", 50, "explain select * from user");
   }
}
