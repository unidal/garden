<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>


<div id="root">
<p>
</p>
<p>
</p>
<p>
<a id="1">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h1>思维导图
</h1>
<p>思维导图还处于测试阶段：语法随时可能更改。
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>OrgMode 语法
</h2>
<p>
</p>
<p>同时兼容OrgMode语法。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startmindmap
* Debian
** Ubuntu
*** Linux Mint
*** Kubuntu
*** Lubuntu
*** KDE Neon
** LMDE
** SolydXK
** SteamOS
** Raspbian with a very long name
*** &lt;s&gt;Raspmbc&lt;/s&gt; =&gt; OSMC
*** &lt;s&gt;Raspyfi&lt;/s&gt; =&gt; Volumio
@endmindmap
</pre>
</div>
<div class="mycell">
<img src="/uml/help/mindmap-diagram/mindmap-diagram-00.uml">
</div>
</div>
<p>
</p>
<p>
</p>
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
<h2>去除外边框
</h2>
<p>你可以用下划线去除外边框。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startmindmap
* root node
** some first level node
***_ second level node
***_ another second level node
***_ foo
***_ bar
***_ foobar
** another first level node
@endmindmap
</pre>
</div>
<div class="mycell">
<img src="/uml/help/mindmap-diagram/mindmap-diagram-01.uml">
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
<h2>运算符
</h2>
<p>你可以使用下面的运算符来决定图形方向。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startmindmap
+ OS
++ Ubuntu
+++ Linux Mint
+++ Kubuntu
+++ Lubuntu
+++ KDE Neon
++ LMDE
++ SolydXK
++ SteamOS
++ Raspbian
-- Windows 95
-- Windows 98
-- Windows NT
--- Windows 8
--- Windows 10
@endmindmap
</pre>
</div>
<div class="mycell">
<img src="/uml/help/mindmap-diagram/mindmap-diagram-02.uml">
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
<h2>Markdown语法
</h2>
<p>同时兼容Markdown语法。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startmindmap
* root node
	* some first level node
		* second level node
		* another second level node
	* another first level node
@endmindmap
</pre>
</div>
<div class="mycell">
<img src="/uml/help/mindmap-diagram/mindmap-diagram-03.uml">
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
<h2>改变图形方向
</h2>
<p>你可以同时使用图形的左右两侧。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startmindmap
* count
** 100
*** 101
*** 102
** 200

left side

** A
*** AA
*** AB
** B
@endmindmap
</pre>
</div>
<div class="mycell">
<img src="/uml/help/mindmap-diagram/mindmap-diagram-04.uml">
</div>
</div>
<p>
<a id="7">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>完整示例
</h2>
<p>
</p>
<div>
<div class="mycell">

<pre>@startmindmap
caption figure 1
title My super title

* &lt;&flag&gt;Debian
** &lt;&globe&gt;Ubuntu
*** Linux Mint
*** Kubuntu
*** Lubuntu
*** KDE Neon
** &lt;&graph&gt;LMDE
** &lt;&pulse&gt;SolydXK
** &lt;&people&gt;SteamOS
** &lt;&star&gt;Raspbian with a very long name
*** &lt;s&gt;Raspmbc&lt;/s&gt; =&gt; OSMC
*** &lt;s&gt;Raspyfi&lt;/s&gt; =&gt; Volumio

header
My super header
endheader

center footer My super footer

legend right
  Short
  legend
endlegend
@endmindmap
</pre>
</div>
<div class="mycell">
<img src="/uml/help/mindmap-diagram/mindmap-diagram-05.uml">
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
