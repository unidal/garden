package com.dianping.garden.dal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.site.lookup.ComponentTestCase;

@RunWith(JUnit4.class)
public class ArticleDaoTest  extends ComponentTestCase{
	@Test
	public void test() throws Exception {
		ArticleDao dao = lookup(ArticleDao.class);
		Article article = dao.findByPK(1, ArticleEntity.READSET_FULL);

		System.out.println(article);
	}
}
