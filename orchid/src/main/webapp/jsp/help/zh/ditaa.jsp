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
<h3>= 概述 =
</h3>
<p>原来，图表的描述需要以"@startuml"开头，以"@enduml"结束，
<strong>PlantUML
</strong>在支持UML同时支持其他图表，既然如此，"@startuml"就没有存在的必要了。
</p>
<p>所以，通用规则允许图表描述以"@startXXX"开头，以"@endXXX"结束，"XXX"根据图表的类型而改变。
</p>
<p>注意，"XXX"可以是任何字符串（包括空格）。
</p>
<p>
</p>
<p>
</p>
<blockquote>这意味着我们鼓励插件开发者，以"@start"代替"@startuml"作为标识。
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
<p>
</p>
<p>
<a href="http://ditaa.sourceforge.net">Ditaa
</a> 是一个支持通过文本描述生成通用图表的开源项目。这个理念和
<strong>PlantUML
</strong>非常相近，所以，支持除UML之外其他图表的文档化将会很有很有意义。
</p>
<p>所以最新版本的
<strong>PlantUML
</strong>支持下面的语法：
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
<p>你可以在 
<a href="http://ditaa.sourceforge.net">这里
</a> 找到它的完整的文档。
</p>
<p>如果你的插件还不支持"@startditaa"，可以使用 
<em>临时
</em> 解决方案：在你的文档描述首行使用"@startuml"，通过"ditta"关键字来支持 
<a href="http://ditaa.sourceforge.net">Ditaa
</a> 。
</p>
<p>你同样可以在"@startditaa"或者"@ditta"关键字后面使用一些设置：
</p>
<p>
</p>
<p>
</p>
<ul>
<li>
<code>-E
</code> 或者 
<code>--no-separation
</code> 移除分隔符
</li>
<li>
<code>-S
</code> 或者 
<code>--no-shadows
</code> 移除阴影
</li>
<li>
<code>scale=XXX
</code> to 缩放图表
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
<p>只支持PNG格式。
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
<p>自从 
<strong>PlantUML
</strong> 使用 
<a href="http://www.graphviz.org/Gallery.php">Graphviz/DOT
</a>语法，直接使用DOT语言成为可能。
</p>
<p>这意味着你可以使用 Graphviz/DOT 所有支持
<strong>PlantUML
</strong>的工具。
</p>
<p>注意，起始行必须是：
</p>
<p>

</p>
<pre>digraph XXXX {
</pre>
<p>注意，你同样可以使用"@startuml"/"@enduml"代替"@startdot"/"@enddot"：
</p>
<p>这里有一个实例：
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
