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
<h2>Generalisation
</h2>
<p>Initially, diagrams descriptions have to start with 
<code>@startuml
</code> and to finish with 
<code>@enduml
</code>. 
<strong>PlantUML
</strong> allows now to generate other diagrams than UML, and in that cases, 
<code>@startuml
</code> would not make sense anymore.
</p>
<p>So, the general convention is to let diagrams descriptions start with 
<code>@startXXX
</code> and to finish with 
<code>@endXXX
</code>, where 
<code>XXX
</code> has to be changed with the type of diagrams.
</p>
<p>Note that 
<code>XXX
</code> could be any strings of characters (including spaces).
</p>
<p>
</p>
<blockquote>This means that plugin developers are encouraged to change their code to recognize 
<code>@start
</code> instead of 
<code>@startuml
</code>.
</blockquote>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Ditaa
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>
<p>
<a href="http://ditaa.sourceforge.net">Ditaa
</a> is an Open Source project that allows to generate general diagrams from a text descriptions. The idea is close to 
<strong>PlantUML
</strong>, and it may be useful for documentation to generate other diagrams than UML.
</p>
<p>So last version of 
<strong>PlantUML
</strong> allows this :
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startditaa
+--------+   +-------+    +-------+
|        +---+ ditaa +--&gt; |       |
|  Text  |   +-------+    |diagram|
|Document|   |!magic!|    |       |
|     {d}|   |       |    |       |
+---+----+   +-------+    +-------+
	:                         ^
	|       Lots of work      |
	+-------------------------+
@endditaa
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ditaa/ditaa-00.uml">
</div>
</div>
<p>You will find 
<a href="http://ditaa.sourceforge.net">here
</a> the complete documentation about this.
</p>
<p>If your plugin does not support 
<code>@startditaa
</code> yet, a 
<em>temporary
</em> feature has been set up : it is also possible to use 
<a href="http://ditaa.sourceforge.net">Ditaa
</a> with 
<code>@startuml
</code> by using 
<code>ditaa
</code> keyword on the very first line of your description.
</p>
<p>You can also use some option, after the 
<code>@startditaa
</code> or 
<code>@ditaa
</code> keyword:
</p>
<p>
</p>
<ul>
<li>
<code>-E
</code> or 
<code>--no-separation
</code> to remove separator
</li>
<li>
<code>-S
</code> or 
<code>--no-shadows
</code> to remove shadow
</li>
<li>
<code>scale=XXX
</code> to scale up or down the diagram
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
ditaa(--no-shadows, scale=0.8)
/--------\   +-------+
|cAAA    +---+Version|
|  Data  |   |   V3  |
|  Base  |   |cRED{d}|
|     {s}|   +-------+
\---+----/
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ditaa/ditaa-01.uml">
</div>
</div>
<p>Only PNG generation is supported.
</p>
<p>
<a id="3">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>DOT
</h2>
<p>Since 
<strong>PlantUML
</strong> uses 
<a href="http://www.graphviz.org/Gallery.php">Graphviz/DOT
</a>, it is possible to directly use DOT language. This means that you can use Graphviz/DOT with all tools that support 
<strong>PlantUML
</strong>.
</p>
<p>Note that the very first line has to be:
</p>
<p>

</p>
<pre>digraph XXXX {
</pre>
<p>Note that you can also use 
<code>@startuml
</code>/
<code>@enduml
</code> instead of 
<code>@startdot
</code>/
<code>@enddot
</code>. Here is a working example:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startdot
digraph foo {
  node [style=rounded]
  node1 [shape=box]
  node2 [fillcolor=yellow, style=&quot;rounded,filled&quot;, shape=diamond]
  node3 [shape=record, label=&quot;{ a | b | c }&quot;]

  node1 -&gt; node2 -&gt; node3
}
@enddot
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ditaa/ditaa-02.uml">
</div>
</div>

<pre>
</pre>
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
