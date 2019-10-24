<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>UML editor based on PlantUML</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="UML online editor">
	<link href="${model.webapp}/css/bootstrap.css" type="text/css" rel="stylesheet">
	<link href="${model.webapp}/css/bootstrap-responsive.css" type="text/css" rel="stylesheet">
	<style media="screen" type="text/css">
		.nav > li.selected > a{
			color: white
		}
		
		.mycell {
			display: inline-block;
			vertical-align: top;
			padding: 10px
		}
	</style>
	<script src="${model.webapp}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">var contextpath = "${model.webapp}";</script>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset="50">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="${payload.pageName eq 'edit' ? 'selected' : ''}"><a href="${model.webapp}/uml">Edit</a></li>
						<li class="${payload.pageName eq 'use-case-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/use-case-diagram">Use Case</a></li>
						<li class="${payload.pageName eq 'sequence-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/sequence-diagram">Sequence</a></li>
						<li class="${payload.pageName eq 'class-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/class-diagram">Class</a></li>
						<li class="${payload.pageName eq 'activity-diagram-beta' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/activity-diagram-beta">Activity</a></li>
						<li class="${payload.pageName eq 'component-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/component-diagram">Component</a></li>
						<li class="${payload.pageName eq 'state-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/state-diagram">State</a></li>
						<li class="${payload.pageName eq 'deployment-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/deployment-diagram">Deployment</a></li>
						<li class="${payload.pageName eq 'ie-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/ie-diagram">E-R</a></li>
						<li class="${payload.pageName eq 'gantt-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/gantt-diagram">Gantt</a></li>
						<li class="${payload.pageName eq 'mindmap-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/mindmap-diagram">Mind Map</a></li>
						<li class="${payload.pageName eq 'wbs-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/wbs-diagram">WBS</a></li>
						<li class="${payload.pageName eq 'timing-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/timing-diagram">Timing</a></li>
						<li class="${payload.pageName eq 'archimate-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/archimate-diagram">Architecture</a></li>
						<li class="${payload.pageName eq 'object-diagram' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/object-diagram">Object</a></li>
						<li class="${payload.pageName eq 'salt' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/salt">Salt</a></li>
						<li class="${payload.pageName eq 'ditaa' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/ditaa">Ditaa</a></li>
<%--
						<li class="${payload.pageName eq 'ascii-math' ? 'selected' : ''}"><a href="${model.webapp}/uml/help/ascii-math">ASCII</a></li>
 						<li class="selected"><a href="${model.webapp}/pdf/PlantUML_Language_Reference_Guide.pdf">Guide in PDF</a></li>
 --%>
 					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid" style="min-height:524px;">
		<div class="row-fluid">
			<div class="span12">
				<br><br>
				<jsp:doBody />
			</div>
		</div>
	</div>
	<!--/.fluid-container-->

	<script src="${model.webapp}/js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
