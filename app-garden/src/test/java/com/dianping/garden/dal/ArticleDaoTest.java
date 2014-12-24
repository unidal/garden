package com.dianping.garden.dal;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import org.unidal.lookup.ComponentTestCase;

@RunWith(JUnit4.class)
public class ArticleDaoTest extends ComponentTestCase {
	@Test
	@Ignore
	public void test() throws Exception {
		ArticleDao dao = lookup(ArticleDao.class);
		Article article = dao.findByPK(1, ArticleEntity.READSET_FULL);

		System.out.println(article);
	}
}
