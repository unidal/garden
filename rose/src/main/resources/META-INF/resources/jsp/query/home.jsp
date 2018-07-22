<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true" %>
<%@ page import="org.unidal.garden.rose.query.*"%>
<%@ taglib prefix="a" uri="/WEB-INF/rose.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>
<jsp:useBean id="ctx" type="org.unidal.garden.rose.query.home.Context" scope="request"/>
<jsp:useBean id="payload" type="org.unidal.garden.rose.query.home.Payload" scope="request"/>
<jsp:useBean id="model" type="org.unidal.garden.rose.query.home.Model" scope="request"/>

<a:layout>
	<jsp:attribute name="head">
		<link href="${model.webapp}/css/dbquery.css" type="text/css" rel="stylesheet">
		<script src="${model.webapp}/js/g_mt.js" type="text/javascript"></script>
		<script src="${model.webapp}/js/dbquery.js" type="text/javascript"></script>
	</jsp:attribute>
	<jsp:body>
	
	<div id="input">
		<form method="post">
			<input type="hidden" name="history" value="${w:htmlEncode(model.history)}">
			<input type="hidden" name="style" id="style" value="${payload.style}">
			<table>
				<tr>
					<td align="right">DB Host</b></td>
					<td colspan="2"><select size="1" name="ds" id="ds">
						<c:forEach var="ds" items="${model.datasources}">
							<option${ds eq payload.datasource?' selected':''}>${w:htmlEncode(ds)}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="right">SQL History</b></td>
					<td colspan="2"><select size="1" id="history" onchange="dbQuery.changeSql(this)">
						<c:forEach var="e" items="${model.historyEntries}">
							<option value="${w:htmlEncode(e.key)}">${w:htmlEncode(e.value)}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td width="250"><label for="explain"><input type="checkbox" name="explain" id="explain"${payload.showExecutionPlan?' checked':''} value="true"> Show Execution Plan</label></td>
					<td align="left">Max Rows
						<select size="1" name="maxRow" id="maxRow">
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
						<!-- 
						<input type="submit" name="xml" value="To XML">&nbsp;&nbsp;
						<input type="submit" name="json" value="To JSON">&nbsp;&nbsp;
						<input type="submit" name="cvs" value="To CVS">&nbsp;&nbsp;
						 -->
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="result">
	<c:if test="${payload.showHtml and empty ctx.errors}">
		<h2>${w:size(model.rawDataObjects)} rows found in ${ctx.queryElapsed} ms.</h2>
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
				<td><xmp style="margin:0px">${field.value}</xmp></td>
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

	</jsp:body>
</a:layout>