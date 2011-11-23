<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="res" uri="http://www.ebay.com/webres"%>

<res:bean id="res"/>
<html>
	<head>
		<title>Garden - ${model.page.description}</title>
		<res:cssSlot id="head-css"/>
		<res:useCss value='${res.css.local.default_css}' target="head-css"/>
	</head>
	<body>
		<h1>
			${model.page.description}
		</h1>
		<ul class="tabs">
			<c:forEach var="page" items="${model.page.values}">
				<c:if test="${page.realPage}">
					<li ${model.page == page ? 'class="selected"' : ''}><a href="${model.moduleUri}/${page.name}">${page.description}</a></li>
				</c:if>
			</c:forEach>
		</ul>

		<jsp:doBody />
	</body>
</html>
