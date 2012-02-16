package org.unidal.demo.dal;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.site.lookup.ComponentTestCase;

@RunWith(JUnit4.class)
public class DemoTest extends ComponentTestCase {
	@Test
	public void test() throws Exception {
		ArticleDao dao = lookup(ArticleDao.class);
		Article a = dao.findByPK(1, ArticleEntity.READSET_FULL);

		Assert.assertEquals(1, a.getId());
		
		System.out.println(a);
	}
}
