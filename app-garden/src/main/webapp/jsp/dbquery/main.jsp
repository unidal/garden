<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.dianping.garden.biz.query.*"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="w" uri="/web/core"%>
<%@ taglib prefix="res" uri="http://www.ebay.com/webres"%>
<jsp:useBean id="ctx" type="Context" scope="request" />
<jsp:useBean id="payload" type="Payload" scope="request" />
<jsp:useBean id="model" type="Model" scope="request" />

<a:body>

	<res:useCss value='${res.css.local.dbquery_css}' target="head-css" />
	<res:useJs value='${res.js.local.g_mt_js}' target="head-js" />
	<res:useJs value='${res.js.local.dbquery_js}' target="head-js" />

	<div id="input">
		<form method="post">
			<input type="hidden" name="history" value="${w:urlEncode(model.history)}">
			<input type="hidden" name="style" id="style" value="${payload.style}">
			<table>
				<tr>
					<td align="right">DB Host</b></td>
					<td colspan="2"><select size="1" name="ds">
						<c:forEach var="ds" items="${model.datasources}">
							<option${ds eq payload.datasource?' selected':''}>${w:htmlEncode(ds)}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="right">SQL History</b></td>
					<td colspan="2"><select size="1" id="history" onchange="dbQuery.changeSql(this)">
						<c:forEach var="sql" items="${model.historySqls}">
							<option>${w:htmlEncode(sql)}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="checkbox" name="explain" id="explain"${payload.showExecutionPlan?' checked':''} value="true"><label for="explain">Show Execution Plan</label></td>
					<td>Max Rows
						<select size="1" name="maxRow">
							<c:forEach var="maxRow" items="${model.maxRows}">
								<option${maxRow eq payload.maxRow?' selected':''}>${maxRow}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">SQL</td>
					<td colspan="2"><textarea name="sql" id="sql" style="${payload.style}">${w:htmlEncode(payload.sql)}</textarea></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="submit" name="html" value="Execute Query">
					</td>
					<td>
						<input type="submit" name="xml" value="To XML">&nbsp;&nbsp;
						<input type="submit" name="json" value="To JSON">&nbsp;&nbsp;
						<input type="submit" name="cvs" value="To CVS">&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="result">
	<c:if test="${payload.showHtml and not empty model.rawDataObjects}">
		<h2>Rows found: ${w:count(model.rawDataObjects)}</h2>
		<table>
			<c:forEach var="do" items="${model.rawDataObjects}" varStatus="index">
			<c:if test="${index.first}">
			<tr>
				<c:forEach var="field" items="${do.fields}">
				<th>${field.key}</th>
				</c:forEach>
			</tr>
			</c:if>
			<tr>
				<c:forEach var="field" items="${do.fields}">
				<td>${field.value}</td>
				</c:forEach>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>

	<div id="error">
	<c:if test="${not empty ctx.errors}">
		<table>
		<c:forEach var="error" items="${ctx.errors}">
			<tr>
				<th align="left">Error while executing query for SQL: ${payload.sql}</th>
			</tr>
			<tr>
				<td>${error.exception}</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	</div>
</a:body>