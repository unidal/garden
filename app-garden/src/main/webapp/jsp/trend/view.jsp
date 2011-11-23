<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="org.unidal.expense.biz.trip.*"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<jsp:useBean id="ctx" type="Context" scope="request" />
<jsp:useBean id="payload" type="Payload" scope="request" />
<jsp:useBean id="model" type="Model" scope="request" />

<a:body>

	<table border="0">
		<tr>
			<td colspan="2">${model.trip.title}</td>
		</tr>
		<tr>
			<td>Members</td>
			<td>,,,,</td>
		</tr>
	</table>

</a:body>