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
<h1>Gantt Diagram
</h1>
<p>
<u>This is only a proposal and subject to change
</u>.
</p>
<p>You are very welcome 
<a href="http://forum.plantuml.net">to create a new discussion
</a> on this future syntax. Your feedbacks, ideas and suggestions help us to find the right solution.
</p>
<p>The Gantt is described in 
<em>natural
</em> language, using very simple sentences (subject-verb-complement).
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Declaring tasks
</h2>
<p>
</p>
<p>Tasks defined using square bracket. Their durations are defined using the 
<code>last
</code> verb:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Prototype design] lasts 15 days
[Test prototype] lasts 10 days
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-00.uml">
</div>
</div>
<p>
<a id="3">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Adding constraints
</h2>It is possible to add constraints between task.
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Prototype design] lasts 15 days
[Test prototype] lasts 10 days
[Test prototype] starts at [Prototype design]'s end
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-01.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Prototype design] lasts 10 days
[Code prototype] lasts 10 days
[Write tests] lasts 5 days
[Code prototype] starts at [Prototype design]'s end
[Write tests] starts at [Code prototype]'s start
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-02.uml">
</div>
</div>
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
<h2>Short names
</h2>It is possible to define short name for tasks with the 
<code>as
</code> keyword.
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Prototype design] as [D] lasts 15 days
[Test prototype] as [T] lasts 10 days
[T] starts at [D]'s end
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-03.uml">
</div>
</div>
<p>
</p>
<p>
<a id="5">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Customize colors
</h2>It also possible to customize 
<a href="https://www.w3schools.com/colors/colors_names.asp">colors
</a>.
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Prototype design] lasts 13 days
[Test prototype] lasts 4 days
[Test prototype] starts at [Prototype design]'s end
[Prototype design] is colored in Fuchsia/FireBrick 
[Test prototype] is colored in GreenYellow/Green 
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-04.uml">
</div>
</div>
<p>
</p>
<p>
<a id="6">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Milestone
</h2>You can define Milestones using the 
<code>happens
</code> verb.
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Test prototype] lasts 10 days
[Prototype completed] happens at [Test prototype]'s end
[Setup assembly line] lasts 12 days
[Setup assembly line] starts at [Test prototype]'s end
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-05.uml">
</div>
</div>
<p>
</p>
<p>
<a id="7">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Calendar
</h2>You can specify a starting date for the whole project. By default, the first task starts at this date.
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
Project starts the 20th of september 2017
[Prototype design] as [TASK1] lasts 13 days
[TASK1] is colored in Lavender/LightBlue
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-06.uml">
</div>
</div>
<p>
<a id="8">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Close day
</h2>It is possible to close some day.
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
project starts the 2018/04/09
saturday are closed
sunday are closed
2018/05/01 is closed
2018/04/17 to 2018/04/19 is closed
[Prototype design] lasts 14 days
[Test prototype] lasts 4 days
[Test prototype] starts at [Prototype design]'s end
[Prototype design] is colored in Fuchsia/FireBrick 
[Test prototype] is colored in GreenYellow/Green 
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-07.uml">
</div>
</div>
<p>
<a id="9">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Simplified task succession
</h2>It's possible to use the 
<code>then
</code> keyword to denote consecutive tasks.
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Prototype design] lasts 14 days
then [Test prototype] lasts 4 days
then [Deploy prototype] lasts 6 days
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-08.uml">
</div>
</div>
<p>You can also use arrow 
<code>-&gt;
</code>
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startgantt
[Prototype design] lasts 14 days
[Build prototype] lasts 4 days
[Prepare test] lasts 6 days
[Prototype design] -&gt; [Build prototype]
[Prototype design] -&gt; [Prepare test]
@endgantt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/gantt-diagram/gantt-diagram-09.uml">
</div>
</div>
<p>
</p>
<p>
<a id="10">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Separator
</h2>
<p>You can use 
<code>--
</code> to separate sets of tasks.
</p>
<p>

</p>
<pre>@startgantt
[Task1] lasts 10 days
then [Task2] lasts 4 days
-- Phase Two --
then [Task3] lasts 5 days
then [Task4] lasts 6 days
@endgantt
</pre>
<p>
<img src="/uml/help/gantt-diagram/gantt-diagram-10.uml">
</p>
<p>
<a id="11">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Working with resources
</h2>You can affect tasks on resources using the 
<code>on
</code> keyword and brackets for resource name.
<p>

</p>
<pre>@startgantt
[Task1] on {Alice} lasts 10 days
[Task2] on {Bob:50%} lasts 2 days 
then [Task3] on {Alice:25%} lasts 1 days
@endgantt
</pre>
<p>
<img src="/uml/help/gantt-diagram/gantt-diagram-11.uml">
<a id="12">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Complex example
</h2>It also possible to use the 
<code>and
</code> conjunction.
<p>You can also add delays in constraints.
</p>
<p>

</p>
<pre>@startgantt
[Prototype design] lasts 13 days and is colored in Lavender/LightBlue
[Test prototype] lasts 9 days and is colored in Coral/Green and starts 3 days after [Prototype design]'s end
[Write tests] lasts 5 days and ends at [Prototype design]'s end
[Hire tests writers] lasts 6 days and ends at [Write tests]'s start
[Init and write tests report] is colored in Coral/Green
[Init and write tests report] starts 1 day before [Test prototype]'s start and ends at [Test prototype]'s end
@endgantt
</pre>
<p>
<img src="/uml/help/gantt-diagram/gantt-diagram-12.uml">
</p>
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
