<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld" %>
<jsp:useBean id="ctx" type="org.unidal.orchid.uml.view.Context" scope="request"/>
<jsp:useBean id="payload" type="org.unidal.orchid.uml.view.Payload" scope="request"/>
<jsp:useBean id="model" type="org.unidal.orchid.uml.view.Model" scope="request"/>

<a:layout>
   <jsp:attribute name="navbar">false</jsp:attribute>
   <jsp:attribute name="head">
   	 <script src="${model.webapp}/js/uml/view.js"></script>
   </jsp:attribute>
   <jsp:body>
   	 
   	 <div id="diagram" data-uri="${model.pageUri}/${payload.product}/${payload.diagram}" data-checksum="${model.checksum}">
	   	<img id="img" src="${model.src}">
	   	<span id="svg">${model.svg}</span>
   	 </div>

   </jsp:body>
</a:layout>