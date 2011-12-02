package com.dianping.garden.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.site.dal.jdbc.raw.RawDao;
import com.site.dal.jdbc.raw.RawDataObject;
import com.site.lookup.ComponentTestCase;

@RunWith(JUnit4.class)
public class RawSqlTest extends ComponentTestCase {
   @Test
   public void test() throws Exception {
      RawDao dao = lookup(RawDao.class);
      List<RawDataObject> list = dao.executeQuery("select id from user");

      System.out.println(list);
   }
}
