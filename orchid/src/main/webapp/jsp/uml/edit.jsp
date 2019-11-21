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
				<td colspan="4" nowrap>
					<select id="product" name="product" style="width: 150px">
						<option value="">--- Select Product ---</option>
						${w:showOptions(model.products, model.product, "id", "id")}
					</select>
					<select id="diagram" name="diagram" style="width: 480px">
						<option value="">--- Select Diagram or create a new one ---</option>
						${w:showOptions(model.diagrams, model.diagram, "id", "id")}
					</select>
					<c:if test="${not empty model.diagram}">&nbsp;<a href="${model.webapp}/uml/view/${model.product}/${model.diagram}" target="_blank">PNG Image</a></c:if>
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

	<script lang="javascript">
	var interval = 500; // 500 ms
	var dirty = false;
	var changed = false;
	
	function refresh() {
		if (changed) {
			var product = $('#product').val();
			var diagram = $('#diagram').val();
			var content = $("#content").val();

		   $.ajax({
			  url: '${model.webapp}/uml/edit',
			  type: 'POST',
			  data: 'update=1&product='+encodeURIComponent(product)+'&diagram='+encodeURIComponent(diagram)+'&content='+encodeURIComponent(content),
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
		$('#content').bind('input propertychange', function() {
			changed = true;
			dirty = true;
		});
		
		$('#content').bind('mouseup mousemove', function() {
            $('#es').val('height: '+this.style.height+'; width: '+this.style.width);
		});
		
		$('#product').change(function() {
			var product = $(this).children('option:selected').val();
			
			window.location.href="?product=" + product;
		});
		
		$('#diagram').change(function() {
			var product = $('#product').val();
			var diagram = $(this).children('option:selected').val();
			
			window.location.href="?product=" + product + "&diagram=" + encodeURIComponent(diagram);
		});
		
		$('#saveAs').bind('click', function() {
			var diagram = window.prompt("Please enter new uml file name. i.e. 'module/scenario1.uml'","module/scenario1.uml");
			
			if (diagram) {
				$('#newfile').val(diagram);
				$('#newfile').form.submit();
			}
		});
		
	    $(function(){setTimeout(refresh, interval);});
	});
	</script>
</a:layout>
