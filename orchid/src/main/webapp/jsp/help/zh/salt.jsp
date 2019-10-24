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
<h1>Salt
</h1>
<p>
<strong>Salt
</strong> 是 PlantUML 下面的子项目用来帮助用户来设计图形接口.
</p>
<p>可以用 
<code>@startsalt
</code> 关键字，或者使用 
<code>@startuml
</code> 紧接着下一行使用
<code>salt
</code> 关键字.
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>基本部件
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>
<p>一个窗口必须以中括号开头和结尾。 接着可以这样定义:
</p>
<ul>
<li>按钮用 
<code>[
</code> 和 
<code>]
</code>。
</li>
<li>单选按钮用 
<code>(
</code> 和 
<code>)
</code>。
</li>
<li>复选框用 
<code>[
</code> 和 
<code>]
</code>。
</li>
<li>用户文字域用 
<code>&quot;
</code>。
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
</div>这个工具是用来讨论简单的示例窗口。
<p>
<a id="3">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>使用表格
</h2>
<p>当在输入关键词 
<code>{
</code>后，会自动建立一个表格
</p>
<p>当输入
<code>|
</code> 说明一个单元格
</p>
<p>例子如下
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
<p>在启用关键词后，你可以使用以下字符来绘制表格中的线及列 :
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
<td>显示所有垂直水平线
</td>
</tr>
<tr>
<td>
<code>!
</code>
</td>
<td>显示所有垂直线
</td>
</tr>
<tr>
<td>
<code>-
</code>
</td>
<td>显示所有水平线
</td>
</tr>
<tr>
<td>
<code>+
</code>
</td>
<td>显示外框线
</td>
</tr>
</table>
<p>
</p>
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
</p>
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
<h2>使用分隔符
</h2>
<p>你可以使用几条横线表示分隔符
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
<h2>树形外挂
</h2>
<p>使用树结构，你必须要 以 
<code>{T
</code> 进行起始，然后使用 
<code>+
</code> 定义层次。
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
<h2>添加选项卡
</h2>
<p>你可以通过 
<code>{/
</code> 标记增加对应的选项卡。 注意：可以使用HTML 代码来增加粗体效果。
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
<p>可以定义垂直选项卡，如下:
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
</p>
<p>
<a id="9">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>使用菜单
</h2>
<p>你可以使用记号
<code>{*
</code>来添加菜单。
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
<p>你也可以打开一个菜单：
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
<h2>高级表格
</h2>
<p>对于表格有两种特殊的标记 :
</p>
<ul>
<li>
<code>*
</code> 单元格同时具备 span 和 left 两个属性
</li>
<li>
<code>.
</code> 是空白单元格
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
<a href="creole">creole parser
</a>, so you can use them out-of-the-box.
</p>
<p>You can use the following syntax: 
<code>&lt;&ICON_NAME&gt;
</code>.
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
<p>The complete list is available on 
<a href="https://useiconic.com/open/">OpenIconic Website
</a>, or you can use the following special diagram:
</p>
<div>
<div class="mycell">

<pre>@startuml
listopeniconic
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/salt/salt-13.uml">
</div>
</div>
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
