<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>


<div id="root">
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
<h1>活动图(新语法)
</h1>
<p>
<a href="activity-diagram-legacy">当前活动图(activity diagram)
</a>的语法有诸多限制和缺点，比如代码难以维护。
</p>
<p>所以从V7947开始提出一种全新的、更好的语法格式和软件实现供用户使用(beta版)。
</p>
<p>就像序列图一样，新的软件实现的另一个优点是它不再依赖于Graphviz。
</p>
<p>新的语法将会替换旧的语法。然而考虑到兼容性，旧的语法仍被能够使用以确保
<em>向前兼容
</em>。
</p>
<p>但是我们鼓励用户使用新的语法格式。
</p>
<p>
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>简单活动图
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>活动标签(activity label)以冒号开始，以分号结束。
<p>文本格式支持
<a href="creole">creole wiki
</a>语法。
</p>
<p>活动默认安装它们定义的顺序就行连接。
</p>
<div>
<div class="mycell">

<pre>@startuml
:Hello world;
:This is on defined on
several **lines**;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-00.uml">
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
<h2>开始/结束
</h2>
<p>你可以使用关键字
<code>start
</code>和
<code>stop
</code>表示图示的开始和结束。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
start
:Hello world;
:This is on defined on
several **lines**;
stop
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-01.uml">
</div>
</div>
<p>也可以使用 
<code>end
</code> 关键字。
</p>
<div>
<div class="mycell">

<pre>@startuml
start
:Hello world;
:This is on defined on
several **lines**;
end
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-02.uml">
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
<h2>条件语句
</h2>
<p>在图示中可以使用关键字
<code>if
</code>，
<code>then
</code>和
<code>else
</code>设置分支测试。标注文字则放在括号中。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start

if (Graphviz installed?) then (yes)
  :process all\ndiagrams;
else (no)
  :process only
  __sequence__ and __activity__ diagrams;
endif

stop

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-03.uml">
</div>
</div>
<p>也可以使用关键字
<code>elseif
</code>设置多个分支测试。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
start
if (condition A) then (yes)
  :Text 1;
elseif (condition B) then (yes)
  :Text 2;
  stop
elseif (condition C) then (yes)
  :Text 3;
elseif (condition D) then (yes)
  :Text 4;
else (nothing)
  :Text else;
endif
stop
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-04.uml">
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
<h2>重复循环
</h2>
<p>你可以使用关键字
<code>repeat
</code>和
<code>repeatwhile
</code>进行重复循环。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start

repeat
  :read data;
  :generate diagrams;
repeat while (more data?)

stop

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-05.uml">
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
<h2>while循环
</h2>
<p>可以使用关键字
<code>while
</code>和
<code>end while
</code>进行while循环。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start

while (data available?)
  :read data;
  :generate diagrams;
endwhile

stop

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-06.uml">
</div>
</div>
<p>还可以在关键字
<code>endwhile
</code>后添加标注，还有一种方式是使用关键字
<code>is
</code>。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
while (check filesize ?) is (not empty)
  :read file;
endwhile (empty)
:close file;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-07.uml">
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
<h2>并行处理
</h2>
<p>你可以使用关键字
<code>fork
</code>，
<code>fork again
</code>和
<code>end fork
</code>表示并行处理。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start

if (multiprocessor?) then (yes)
  fork
	:Treatment 1;
  fork again
	:Treatment 2;
  end fork
else (monoproc)
  :Treatment 1;
  :Treatment 2;
endif

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-08.uml">
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
<h3>= 注释 =
</h3>
<p>文本格式支持
<a href="creole">creole wiki
</a>语法。
</p>
<p>A note can be floating, using 
<code>floating
</code> keyword.
</p>
<div>
<div class="mycell">

<pre>@startuml

start
:foo1;
floating note left: This is a note
:foo2;
note right
  This note is on several
  //lines// and can
  contain &lt;b&gt;HTML&lt;/b&gt;
  ====
  * Calling the method &quot;&quot;foo()&quot;&quot; is prohibited
end note
stop

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-09.uml">
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
<h3>= 颜色 =
</h3>
<p>你可以为活动(activity)指定一种
<a href="color">颜色
</a>。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start
:starting progress;
#HotPink:reading configuration files
These files should edited at this point!;
#AAAAAA:ending of the process;

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-10.uml">
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
<h3>= 箭头 =
</h3>
<p>使用
<code>-&gt;
</code>标记，你可以给箭头添加文字或者修改箭头
<a href="color">颜色
</a>。
</p>
<p>同时，你也可以选择点状 (dotted)，条状(dashed)，加粗或者是隐式箭头
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:foo1;
-&gt; You can put text on arrows;
if (test) then
  -[#blue]-&gt;
  :foo2;
  -[#green,dashed]-&gt; The text can
  also be on several lines
  and **very** long...;
  :foo3;
else
  -[#black,dotted]-&gt;
  :foo4;
endif
-[#gray,bold]-&gt;
:foo5;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-11.uml">
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
<h2>连接器(Connector)
</h2>
<p>你可以使用括号定义连接器。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
start
:Some activity;
(A)
detach
(A)
:Other activity;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-12.uml">
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
<h2>组合(grouping)
</h2>
<p>通过定义分区(partition)，你可以把多个活动组合(group)在一起。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
start
partition Initialization {
	:read config file;
	:init internal variable;
}
partition Running {
	:wait for user interaction;
	:print information;
}

stop
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-13.uml">
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
<h2>泳道(Swimlanes)
</h2>
<p>你可以使用管道符
<code>|
</code>来定义泳道。
</p>
<p>还可以改变泳道的
<a href="color">颜色
</a>。
</p>
<div>
<div class="mycell">

<pre>@startuml
|Swimlane1|
start
:foo1;
|#AntiqueWhite|Swimlane2|
:foo2;
:foo3;
|Swimlane1|
:foo4;
|Swimlane2|
:foo5;
stop
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-14.uml">
</div>
</div>
<p>
<a id="14">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>分离(detach)
</h2>
<p>可以使用关键字
<code>detach
</code>移除箭头。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
 :start;
 fork
   :foo1;
   :foo2;
 fork again
   :foo3;
   detach
 endfork
 if (foo4) then
   :foo5;
   detach
 endif
 :foo6;
 detach
 :foo7;
 stop
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-15.uml">
</div>
</div>
<p>
<a id="15">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>特殊领域语言(SDL)
</h2>
<p>通过修改活动标签最后的分号分隔符(
<code>;
</code>)，可以为活动设置不同的形状。
</p>
<ul>
<li>
<code>|
</code>
</li>
<li>
<code>&lt;
</code>
</li>
<li>
<code>&gt;
</code>
</li>
<li>
<code>/
</code>
</li>
<li>
<code>]
</code>
</li>
<li>
<code>}
</code>
</li>
</ul>
<div>
<div class="mycell">

<pre>@startuml
:Ready;
:next(o)|
:Receiving;
split
 :nak(i)&lt;
 :ack(o)&gt;
split again
 :ack(i)&lt;
 :next(o)
 on several line|
 :i := i + 1]
 :ack(o)&gt;
split again
 :err(i)&lt;
 :nak(o)&gt;
split again
 :foo/
split again
 :i &gt; 5}
stop
end split
:finish;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-16.uml">
</div>
</div>
<p>
<a id="16">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>一个完整的例子
</h2>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start
:ClickServlet.handleRequest();
:new page;
if (Page.onSecurityCheck) then (true)
  :Page.onInit();
  if (isForward?) then (no)
	:Process controls;
	if (continue processing?) then (no)
	  stop
	endif
	
	if (isPost?) then (yes)
	  :Page.onPost();
	else (no)
	  :Page.onGet();
	endif
	:Page.onRender();
  endif
else (false)
endif

if (do redirect?) then (yes)
  :redirect process;
else
  if (do forward?) then (yes)
	:Forward request;
  else (no)
	:Render page template;
  endif
endif

stop

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-17.uml">
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
