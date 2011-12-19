<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.dianping.garden.dashboard.page.trend.*"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="w" uri="/web/core"%>
<%@ taglib prefix="res" uri="http://www.ebay.com/webres"%>
<jsp:useBean id="ctx" type="Context" scope="request" />
<jsp:useBean id="payload" type="Payload" scope="request" />
<jsp:useBean id="model" type="Model" scope="request" />

<a:body>

<res:useCss value='${res.css.local.trend_css}' target="head-css"/>

<div class="trend">
<h1>
<c:if test="${payload.pageNumber gt 1}">
   <a href="${a:uri(model, null)}?page=${payload.pageNumber-1}"><<< Prev Page</a>&nbsp;&nbsp;&nbsp;&nbsp;
</c:if>
<c:if test="${payload.pageNumber lt model.maxPage}">
   <a href="${a:uri(model, null)}?page=${payload.pageNumber+1}">Next Page >>></a>
</c:if>
</h1>
</div>

<c:forEach var="article" items="${model.articles}">
<div class="trend">
	<h1><a title="Permalink to ${article.title}" href="${article.originLink}" rel="bookmark">${article.title}</a></h1>
	<p class="meta">Published at ${w:format(article.publishDate,'yyyy-MM-dd')}, Tags: ${article.tags}<!--  | <a title="Comment on ${article.title}" href="?op=comment">Leave a comment</a> --></p>
	<p>${article.abstraction}</p>
</div>
<c:set var="lastId" value="${article.id}"/>
</c:forEach>

<div class="trend">
<h1>
<c:if test="${payload.pageNumber gt 1}">
   <a href="${a:uri(model, null)}?page=${payload.pageNumber-1}"><<< Prev Page</a>&nbsp;&nbsp;&nbsp;&nbsp;
</c:if>
<c:if test="${payload.pageNumber lt model.maxPage}">
   <a href="${a:uri(model, null)}?page=${payload.pageNumber+1}">Next Page >>></a>
</c:if>
</h1>
</div>

</a:body>