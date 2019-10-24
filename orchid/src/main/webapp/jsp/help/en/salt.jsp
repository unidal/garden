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
<h1>Salt (wireframe)
</h1>
<p>
<strong>Salt
</strong> is a subproject included in PlantUML that may help you to design graphical interface.
</p>
<p>You can use either 
<code>@startsalt
</code> keyword, or 
<code>@startuml
</code> followed by a line with 
<code>salt
</code> keyword.
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Basic widgets
</h2>
<p>
</p>
<p>A window must start and end with brackets. You can then define:
</p>
<p>
</p>
<ul>
<li>Button using 
<code>[
</code> and 
<code>]
</code>.
</li>
<li>Radio button using 
<code>(
</code> and 
<code>)
</code>.
</li>
<li>Checkbox using 
<code>[
</code> and 
<code>]
</code>.
</li>
<li>User text area using 
<code>&quot;
</code>.
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
salt
{
  Just plain text
  [This is my button]
  ()  Unchecked radio
  (X) Checked radio
  []  Unchecked box
  [X] Checked box
  &quot;Enter text here   &quot;
  ^This is a droplist^
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-00.uml">
</div>
</div>
<p>
</p>
<p>
</p>
<p>The goal of this tool is to discuss about simple and sample windows.
</p>
<p>
<a id="3">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Using grid
</h2>
<p>A table is automatically created when you use an opening bracket 
<code>{
</code>. And you have to use 
<code>|
</code> to separate columns.
</p>
<p>For example:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{
  Login    | &quot;MyName   &quot;
  Password | &quot;****     &quot;
  [Cancel] | [  OK   ]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-01.uml">
</div>
</div>
<p>Just after the opening bracket, you can use a character to define if you want to draw lines or columns of the grid :
</p>
<p>
</p>
<table border="1" cellspacing="0" cellpadding="5">
<tr>
<td>
<b>Symbol 
</b>
</td>
<td>
<b>Result 
</b>
</td>
</tr>
<tr>
<td>
<code>#
</code>
</td>
<td>To display all vertical and horizontal lines
</td>
</tr>
<tr>
<td>
<code>!
</code>
</td>
<td>To display all vertical lines
</td>
</tr>
<tr>
<td>
<code>-
</code>
</td>
<td>To display all horizontal lines
</td>
</tr>
<tr>
<td>
<code>+
</code>
</td>
<td>To display external lines
</td>
</tr>
</table>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{+
  Login    | &quot;MyName   &quot;
  Password | &quot;****     &quot;
  [Cancel] | [  OK   ]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-02.uml">
</div>
</div>
<p>
<a id="4">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Group box
</h2>
<p>
<a href="http://forum.plantuml.net/5840/please-allow-to-create-groupboxes-in-salt?show=5840#q5840">more info
</a>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{^&quot;My group box&quot;
  Login    | &quot;MyName   &quot;
  Password | &quot;****     &quot;
  [Cancel] | [  OK   ]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-03.uml">
</div>
</div>
<p>
<a id="5">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Using separator
</h2>
<p>You can use several horizontal lines as separator.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{
  Text1
  ..
  &quot;Some field&quot;
  ==
  Note on usage
  ~~
  Another text
  --
  [Ok]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-04.uml">
</div>
</div>
<p>
<a id="6">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Tree widget
</h2>
<p>To have a Tree, you have to start with 
<code>{T
</code> and to use 
<code>+
</code> to denote hierarchy.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{
{T
 + World
 ++ America
 +++ Canada
 +++ USA
 ++++ New York
 ++++ Boston
 +++ Mexico
 ++ Europe
 +++ Italy
 +++ Germany
 ++++ Berlin
 ++ Africa
}
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-05.uml">
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
<h2>Enclosing brackets
</h2>
<p>You can define subelements by opening a new opening bracket.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{
Name         | &quot;                 &quot;
Modifiers:   | { (X) public | () default | () private | () protected
	            [] abstract | [] final   | [] static }
Superclass:  | { &quot;java.lang.Object &quot; | [Browse...] }
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-06.uml">
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
<h2>Adding tabs
</h2>
<p>You can add tabs using 
<code>{/
</code> notation. Note that you can use HTML code to have bold text.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{+
{/ &lt;b&gt;General | Fullscreen | Behavior | Saving }
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images
}
[Close]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-07.uml">
</div>
</div>
<p>Tab could also be vertically oriented:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{+
{/ &lt;b&gt;General
Fullscreen
Behavior
Saving } |
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images 
	[Close]
}
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-08.uml">
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
<h2>Using menu
</h2>
<p>You can add a menu by using 
<code>{*
</code> notation.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{+
{* File | Edit | Source | Refactor }
{/ General | Fullscreen | Behavior | Saving }
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images 
}
[Close]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-09.uml">
</div>
</div>
<p>It is also possible to open a menu:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{+
{* File | Edit | Source | Refactor 
 Refactor | New | Open File | - | Close | Close All }
{/ General | Fullscreen | Behavior | Saving }
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images 
}
[Close]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-10.uml">
</div>
</div>
<p>
<a id="10">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Advanced table
</h2>
<p>You can use two special notations for table :
</p>
<ul>
<li>
<code>*
</code> to indicate that a cell with span with left
</li>
<li>
<code>.
</code> to denotate an empty cell
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{#
. | Column 2 | Column 3
Row header 1 | value 1 | value 2
Row header 2 | A long cell | *
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-11.uml">
</div>
</div>
<p>
<a id="11">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>OpenIconic
</h2>
<p>
<a href="https://useiconic.com/open/">OpenIconic
</a> is an very nice open source icon set. Those icons have been integrated into the 
<a href="site:creole">creole parser
</a>, so you can use them out-of-the-box. You can use the following syntax: 
<code>&lt;&ICON_NAME&gt;
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{
  Login&lt;&person&gt; | &quot;MyName   &quot;
  Password&lt;&key&gt; | &quot;****     &quot;
  [Cancel &lt;&circle-x&gt;] | [OK &lt;&account-login&gt;]
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-12.uml">
</div>
</div>
<p>The complete list is available on OpenIconic Website, or you can use the following special diagram:
</p>
<p>

</p>
<pre>@startuml
listopeniconic
@enduml
</pre>
<p>
<img src="/uml/help/salt/salt-13.uml">
</p>
<p>
</p>
<p>
<a id="12">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Include Salt
</h2>
<p>see: http://forum.plantuml.net/2427/salt-with-minimum-flowchat-capabilities?show=2427#q2427
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
(*) --&gt; &quot;
{{
salt
{+
&lt;b&gt;an example
choose one option
()one
()two
[ok]
}
}}
&quot; as choose
 
choose -right-&gt; &quot;
{{
salt
{+
&lt;b&gt;please wait
operation in progress
&lt;&clock&gt;
[cancel]
}
}}
&quot; as wait
wait -right-&gt; &quot;
{{
salt
{+
&lt;b&gt;success
congratulations!
[ok]
}
}}
&quot; as success
 
wait -down-&gt; &quot;
{{
salt
{+
&lt;b&gt;error
failed, sorry
[ok]
}
}}
&quot;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-14.uml">
</div>
</div>
<p>It can also be combined with 
<a href="site:preprocessing#macro_definition">define macro
</a>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
!unquoted function SALT($x)
&quot;{{
salt
%invoke_void_func(&quot;_&quot;+$x)
}}&quot; as $x
!endfunction

!function _choose()
{+
&lt;b&gt;an example
choose one option
()one
()two
[ok]
}
!endfunction

!function _wait()
{+
&lt;b&gt;please wait
operation in progress
&lt;&clock&gt;
[cancel]
}
!endfunction

!function _success()
{+
&lt;b&gt;success
congratulations!
[ok]
}
!endfunction
 
!function _error()
{+
&lt;b&gt;error
failed, sorry
[ok]
}
!endfunction

(*) --&gt; SALT(choose)
-right-&gt; SALT(wait)
wait -right-&gt; SALT(success)
wait -down-&gt; SALT(error)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-15.uml">
</div>
</div>
<p>
<a id="13">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Scroll Bars
</h2>
<p>You can use "S" as scroll bar like in following examples:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{S
Message
.
.
.
.
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-16.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{SI
Message
.
.
.
.
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-17.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startsalt
{S-
Message
.
.
.
.
}
@endsalt
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-18.uml">
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
