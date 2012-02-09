package com.dianping.garden.dashboard.page.trend;

import java.io.IOException;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.ArticleDao;
import com.dianping.garden.dal.ArticleEntity;
import com.dianping.garden.dal.Trend;
import com.dianping.garden.dal.TrendDao;
import com.dianping.garden.dal.TrendDetail;
import com.dianping.garden.dal.TrendDetailDao;
import com.dianping.garden.dal.TrendDetailEntity;
import com.dianping.garden.dal.TrendEntity;
import com.dianping.garden.dashboard.DashboardPage;
import com.dianping.garden.wdbc.ArticleFetcher;
import org.unidal.webres.helper.Files;
import com.site.dal.jdbc.DalException;
import com.site.lookup.ContainerHolder;
import com.site.lookup.annotation.Inject;
import com.site.wdbc.StringSource;
import com.site.wdbc.WdbcSourceType;
import com.site.web.mvc.ErrorObject;
import com.site.web.mvc.PageHandler;
import com.site.web.mvc.annotation.InboundActionMeta;
import com.site.web.mvc.annotation.OutboundActionMeta;
import com.site.web.mvc.annotation.PayloadMeta;

public class Handler extends ContainerHolder implements PageHandler<Context> {
	@Inject
	private JspViewer m_jspViewer;

	@Inject
	private TrendDao m_trendDao;

	@Inject
	private TrendDetailDao m_trendDetailDao;

	@Inject
	private ArticleDao m_articleDao;

	private boolean m_debug = true;

	private void doRefresh(Context ctx, List<Trend> trends) {
		long now = System.currentTimeMillis();

		for (Trend trend : trends) {
			Date lastRefreshDate = trend.getLastRefreshDate();
			int updateInterval = trend.getUpdateInterval();
			String baseUrl = trend.getBaseUrl();

			if (lastRefreshDate == null || lastRefreshDate.getTime() + updateInterval * 1000L < now) {
				ArticleFetcher fetcher = null;

				try {
					fetcher = lookup(ArticleFetcher.class, trend.getType());

					List<URL> urls = fetcher.getIssueList(new URL(baseUrl), lastRefreshDate);

					for (URL url : urls) {
						String originUrl = url.toExternalForm();

						try {
							m_trendDetailDao.findByOriginUrl(originUrl, TrendDetailEntity.READSET_FULL);
						} catch (DalException e) {
							System.out.print("Downloading " + url + " ...");

							String content = Files.forIO().readFrom(url.openStream(), "utf-8");
							StringSource source = new StringSource(WdbcSourceType.HTML, content);
							List<Article> articles = fetcher.getArticles(trend, originUrl, source);
							int num = articles.size();

							System.out.println(" DONE. Length=" + content.length() + ", articles=" + num);

							m_articleDao.insert(articles.toArray(new Article[0]));

							TrendDetail detail = new TrendDetail();

							detail.setTrendId(trend.getId());
							detail.setOriginUrl(originUrl);
							detail.setOriginContent(content);
							detail.setArticleNumber(num);
							m_trendDetailDao.insert(detail);
						}
					}

					trend.setKeyId(trend.getId());
					trend.setLastRefreshDate(new Date());
					m_trendDao.updateByPK(trend, TrendEntity.UPDATESET_LAST_REFRESH_DATE);
				} catch (Exception e) {
					ctx.addError(new ErrorObject("trend.refresh", e));
				} finally {
					if (fetcher != null) {
						release(fetcher);
					}
				}
			}
		}
	}

	@Override
	@PayloadMeta(Payload.class)
	@InboundActionMeta(name = "trend")
	public void handleInbound(Context ctx) throws ServletException, IOException {
		Payload payload = ctx.getPayload();
		Action action = payload.getAction();

		if (m_debug) {
			HttpServletRequest req = ctx.getHttpServletRequest();

			ctx.log("%s %s?page=%s", req.getRemoteAddr(), req.getRequestURI(), payload.getPageNumber());
		}

		if (!ctx.hasErrors()) {
			if (action.isRefresh()) {
				try {
					List<Trend> trends = m_trendDao.findAllActive(TrendEntity.READSET_FULL);

					doRefresh(ctx, trends);
				} catch (DalException e) {
					ctx.addError(new ErrorObject("dal.trend.findAllActive", e));
				}
			}
		}
	}

	@Override
	@OutboundActionMeta(name = "trend")
	public void handleOutbound(Context ctx) throws ServletException, IOException {
		Model model = new Model(ctx);
		Payload payload = ctx.getPayload();
		Action action = payload.getAction();

		model.setPage(DashboardPage.TREND);
		model.setAction(action);

		if (action.isList()) {
			showList(ctx, model);
		} else if (action.isRefresh()) {
			model.setAction(Action.TREND);
			ctx.redirect(model, null);
			return;
		}

		if (m_debug && ctx.hasErrors()) {
			Exception exception = ctx.getErrors().get(0).getException();

			if (exception != null) {
				exception.printStackTrace();
			}
		}

		m_jspViewer.view(ctx, model);
	}

	private void showList(Context ctx, Model model) {
		try {
			Payload payload = ctx.getPayload();
			List<Trend> trends = m_trendDao.findAllActive(TrendEntity.READSET_FULL);

			model.setTrends(trends);

			if (payload.getTrendId() > 0) {
				int total = m_articleDao.findAllByTrend(payload.getTrendId(), ArticleEntity.READSET_COUNT).get(0)
				      .getCount();
				int pageSize = payload.getPageSize();
				List<Article> articles = m_articleDao.findPageByTrend(payload.getTrendId(), (payload.getPageNumber() - 1)
				      * pageSize, pageSize, ArticleEntity.READSET_FULL);

				model.setMaxPage((total + pageSize - 1) / pageSize);
				model.setArticles(articles);
			} else { // all trend
				int total = m_articleDao.findAll(ArticleEntity.READSET_COUNT).get(0).getCount();
				int pageSize = payload.getPageSize();
				List<Article> articles = m_articleDao.findPage((payload.getPageNumber() - 1) * pageSize, pageSize,
				      ArticleEntity.READSET_FULL);

				model.setMaxPage((total + pageSize - 1) / pageSize);
				model.setArticles(articles);
			}
		} catch (DalException e) {
			ctx.addError(new ErrorObject("dal.article.findPageBeforeId", e));
		}
	}
}
