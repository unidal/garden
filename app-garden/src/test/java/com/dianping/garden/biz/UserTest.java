package com.dianping.garden.biz;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.dianping.garden.dal.User;
import com.dianping.garden.dal.UserDao;
import com.dianping.garden.dal.UserEntity;
import com.site.lookup.ComponentTestCase;

@RunWith(JUnit4.class)
public class UserTest extends ComponentTestCase {
   @Test
   public void test() throws Exception {
      UserDao dao = lookup(UserDao.class);
      User user = dao.findByPK(1705, UserEntity.READSET_FULL);
      long start = System.currentTimeMillis();

      for (int i = 0; i < 1000; i++) {
         user = dao.findByPK(1705, UserEntity.READSET_FULL);

         assertEquals(
                  "User[author: dd, creation-date: 2011-11-18 18:33:13.0, id: 1705, key-id: 0, origin-link: dd, source-id: 0, source-type: d, tags: ddd, title: djfkd]",
                  user.toString());
      }

      System.out.println("Time used: " + (System.currentTimeMillis() - start) + " ms.");
   }
}
