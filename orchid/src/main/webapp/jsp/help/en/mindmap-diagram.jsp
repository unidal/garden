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
<h1>MindMap
</h1>
<p>MindMap diagram are still in beta: the syntax may change without notice.
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
<p>
</p>
<p>This syntax is compatible with OrgMode
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
<h2>Removing box
</h2>
<p>You can remove the box drawing using an underscore.
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
<h2>Arithmetic notation
</h2>
<p>You can use the following notation to choose diagram side.
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
<h2>Markdown syntax
</h2>
<p>This syntax is compatible with Markdown
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
<h2>Changing diagram direction
</h2>
<p>It is possible to use both sides of the diagram.
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
<h2>Complete example
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
