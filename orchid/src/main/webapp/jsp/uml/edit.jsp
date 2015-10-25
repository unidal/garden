<%@ page contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>
<jsp:useBean id="ctx" type="org.unidal.orchid.uml.edit.Context" scope="request"/>
<jsp:useBean id="payload" type="org.unidal.orchid.uml.edit.Payload" scope="request"/>
<jsp:useBean id="model" type="org.unidal.orchid.uml.edit.Model" scope="request"/>

<a:layout>
	<br>

	<form action="${model.webapp}/uml" method="post">
		<input type="hidden" name="es" id="es" value="${model.editStyle}">
		<table>
			<tr>
				<td colspan="3" nowrap>
					<select id="file" name="file" style="width: 480px">
						<option value="">--- Select UML or create a new one ---</option>
						${w:showOptions(model.umlFiles, model.umlFile, null, null)}
					</select>
					<c:if test="${not empty model.umlFile}"><a href="${model.webapp}/uml/file/${model.umlFile}" target="_blank">Get Link</a></c:if>
				</td>
				<td></td>
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
					<textarea id="uml" name="uml" style="${model.editStyle}">${w:htmlEncode(model.uml)}</textarea>
					<br>
					<c:choose>
						<c:when test="${not empty model.umlFile}">
							<button type="submit" name="update" value="1" class="btn btn-medium btn-primary">Save</button>
						</c:when>
						<c:otherwise>
							<input id="newfile" type="hidden" name="newfile">
							<button id="saveAs" type="submit" name="saveAs" value="1" class="btn btn-medium btn-primary">Save As ...</button>
						</c:otherwise>
					</c:choose>
				</td>
				<td width="10"></td>
				<td valign="top" colspan="2"><img id="img"><span id="svg">${model.svg}</span></td>
			</tr>
		</table>
	</form>

	<script lang="javascript">
	var interval = 500; // 500 ms
	var dirty = false;
	var changed = false;
	
	function refresh() {
		var uml = $("#uml").val();
		
		if (changed) {
		   $.ajax({
			  url: '${model.webapp}/uml',
			  type: 'POST',
			  data: 'type=text&uml=' + encodeURIComponent(uml),
			  async: false,
			  success: function(data) {
				// called when successful
				if (data.startsWith('<')) {
				   $('#svg').html(data);
			       $('#img').attr('src', '');
			    } else {
				   $('#svg').html('');
			       $('#img').attr('src', data);
			    }
			  },
			  error: function(e) {
				// called when there is an error
				// console.log(e.message);
			  }
			});
		    changed = false;
		}
		
		setTimeout(refresh, interval);
	}
	
	$(document).ready(function () {
		$('#uml').bind('input propertychange', function() {
			changed = true;
			dirty = true;
		});
		
		$('#uml').bind('mouseup mousemove', function() {
            $('#es').val('height: '+this.style.height+'; width: '+this.style.width);
		});
		
		$('#file').change(function() {
			var file = $(this).children('option:selected').val();
			
			window.location.href="?file=" + encodeURIComponent(file);
		});
		
		$('#saveAs').bind('click', function() {
			var path = window.prompt("Please enter new uml file name. i.e. 'myproject/scenario1.uml'","test/case01.uml");
			
			if (path) {
				$('#newfile').val(path);
				$('#newfile').form.submit();
			}
		});
		
	    $(function(){setTimeout(refresh, interval);});
	});
	</script>
</a:layout>
