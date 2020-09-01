<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>
<jsp:useBean id="ctx" type="org.unidal.orchid.uml.edit.Context" scope="request"/>
<jsp:useBean id="payload" type="org.unidal.orchid.uml.edit.Payload" scope="request"/>
<jsp:useBean id="model" type="org.unidal.orchid.uml.edit.Model" scope="request"/>

<a:layout>
   <jsp:attribute name="head">
   	 <script src="${model.webapp}/js/uml/edit.js"></script>
   </jsp:attribute>
   <jsp:body>

		<br>
		<form action="${model.webapp}/uml" method="post">
			<input type="hidden" name="es" id="es" value="${model.editStyle}">
			<table>
				<tr>
					<td colspan="4" nowrap>
						<select id="product" name="product" style="width: 150px">
							<option value="">--- Select Product ---</option>
							${w:showOptions(model.products, model.product, "id", "id")}
						</select>
						<select id="diagram" name="diagram" style="width: 480px">
							<option value="">--- Select Diagram or create a new one ---</option>
							${w:showOptions(model.diagrams, model.diagram, "id", "id")}
						</select>
						<c:if test="${not empty model.diagram}">
							&nbsp;<a href="${model.webapp}/uml/view/${model.product}/${w:urlEncode(model.diagram)}" target="_blank">PNG</a>
							&nbsp;<a href="${model.webapp}/uml/view/${model.product}/${w:urlEncode(model.diagram)}?op=watch" target="_blank">Watch</a>
						</c:if>
					</td>
				</tr>
				<c:if test="${not empty model.message}">
					<tr>
						<td colspan="4">
							<c:choose>
								<c:when test="${model.error}"><span class="text-error">${model.message}</span></c:when>
								<c:otherwise><span class="text-success">${model.message}</span></c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:if>
				<tr valign="top">
					<td valign="top">
						<textarea id="content" name="content" style="${model.editStyle}">${w:htmlEncode(model.content)}</textarea>
						<br>
						<c:choose>
							<c:when test="${not empty model.diagram}">
								<button id="save" type="submit" name="save" value="1" class="btn btn-medium btn-primary">Save</button>
							</c:when>
							<c:otherwise>
								<input id="newfile" type="hidden" name="newfile">
								<button id="saveAs" type="submit" name="saveAs" value="1" class="btn btn-medium btn-primary">Save As ...</button>
							</c:otherwise>
						</c:choose>
					</td>
					<td width="10"></td>
					<td valign="top" colspan="2"><img id="img" src="${model.src}"><span id="svg">${model.svg}</span></td>
				</tr>
			</table>
		</form>

	</jsp:body>
</a:layout>
