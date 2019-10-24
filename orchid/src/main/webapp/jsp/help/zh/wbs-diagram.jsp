<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>


<div id="root">
<p>
<a id="1">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h1>Work Breakdown Structure
</h1>
<p>WBS diagram are still in beta: the syntax may change without notice.
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>OrgMode syntax
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>
<p>This syntax is compatible with OrgMode
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startwbs
* Business Process Modelling WBS
** Launch the project
*** Complete Stakeholder Research
*** Initial Implementation Plan
** Design phase
*** Model of AsIs Processes Completed
**** Model of AsIs Processes Completed1
**** Model of AsIs Processes Completed2
*** Measure AsIs performance metrics
*** Identify Quick Wins
** Complete innovate phase
@endwbs
</pre>
</div>
<div class="mycell">
<img src="/uml/help/wbs-diagram/wbs-diagram-00.uml">
</div>
</div>
<p>
</p>
<p>
<a id="3">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Change direction
</h2>
<p>You can change direction using 
<code>&lt;
</code> and 
<code>&gt;
</code>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startwbs
* Business Process Modelling WBS
** Launch the project
*** Complete Stakeholder Research
*** Initial Implementation Plan
** Design phase
*** Model of AsIs Processes Completed
****&lt; Model of AsIs Processes Completed1
****&gt; Model of AsIs Processes Completed2
***&lt; Measure AsIs performance metrics
***&lt; Identify Quick Wins
@endwbs
</pre>
</div>
<div class="mycell">
<img src="/uml/help/wbs-diagram/wbs-diagram-01.uml">
</div>
</div>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
<a id="4">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Arithmetic notation
</h2>
<p>You can use the following notation to choose diagram side.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startwbs
+ New Job
++ Decide on Job Requirements
+++ Identity gaps
+++ Review JDs
++++ Sign-Up for courses
++++ Volunteer
++++ Reading
++- Checklist
+++- Responsibilities
+++- Location
++ CV Upload Done
+++ CV Updated
++++ Spelling & Grammar
++++ Check dates
---- Skills
+++ Recruitment sites chosen
@endwbs
</pre>
</div>
<div class="mycell">
<img src="/uml/help/wbs-diagram/wbs-diagram-02.uml">
</div>
</div>
<p>You can use underscore 
<code>_
</code> to remove box drawing.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startwbs
+ Project
 + Part One
  + Task 1.1
   - LeftTask 1.2
   + Task 1.3
  + Part Two
   + Task 2.1
   + Task 2.2
   -_ Task 2.2.1 To the left boxless
   -_ Task 2.2.2 To the Left boxless
   +_ Task 2.2.3 To the right boxless
@endwbs
</pre>
</div>
<div class="mycell">
<img src="/uml/help/wbs-diagram/wbs-diagram-03.uml">
</div>
</div>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<table width="100%" border="0">
<tr align="center">
<td width="20%">
</td>
<td width="20%">
</td>
<td width="20%">
<a href="https://liberapay.com/plantuml/donate">
<img>
</a>
</td>
<td width="20%">
</td>
<td width="20%">
<a href="https://www.ej-technologies.com/products/jprofiler/overview.html" title="JProfiler">
<img>
</a>
</td>
</tr>
</table>
</div>

</a:layout>
