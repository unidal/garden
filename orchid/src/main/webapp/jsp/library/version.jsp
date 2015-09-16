<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ctx" type="org.unidal.orchid.library.version.Context" scope="request"/>
<jsp:useBean id="payload" type="org.unidal.orchid.library.version.Payload" scope="request"/>
<jsp:useBean id="model" type="org.unidal.orchid.library.version.Model" scope="request"/>

<a:layout>
   <br>
   
   <c:choose>
      <c:when test="${model.action.name == 'edit'}">
         <form method="POST">
            <input type="hidden" name="op" value="edit">
            <textarea name="xml" style="height: 480px; width: 1024px">${model.xml}</textarea>
            <br><input type="submit" class="btn btn-primary" name="update" value="Update">
            &nbsp;&nbsp;&nbsp;&nbsp;<a href="?op=view" class="btn btn-default" role="button">Back</a>
         </form>
      </c:when>
      <c:otherwise>
         <a href="?op=edit" class="btn btn-primary btn-lg" role="button">Edit Versions</a><br><br>
         <table class="table table-bordered">
            <tr>
               <th>Library</th>
               <th>Product</th>
               <th>Stable Version</th>
               <th>Current Version</th>
               <th>Minimal Version</th>
            </tr>
            <c:forEach var="library" items="${model.libraries}">
               <tr>
                  <td>${library.name}</td>
                  <td>${library.product}</td>
                  <td>${library.stableVersion}</td>
                  <td>${library.currentVersion}</td>
                  <td>${library.minVersion}</td>
               </tr>
            </c:forEach>
         </table>
      </c:otherwise>
   </c:choose>
</a:layout>