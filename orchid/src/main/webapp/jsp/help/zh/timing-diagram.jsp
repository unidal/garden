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
</p>
<p>
<a id="1">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h1>时序图
</h1>
<p>
<u>这只是个提案，主题和内容可能改变
</u>.
</p>
<p>非常欢迎您参与这个新特性的讨论。您的反馈、创意和建议可以帮助我们找寻适合的解决方案。
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>声明参与者
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>
<p>使用 
<code>concise
</code> or 
<code>robust
</code> 关键字声明参与者, 选择哪个取决于所需的显示样式。
</p>
<p>通过 
<code>@
</code> 标注, 和 
<code>is
</code> 动词定义状态.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Web 浏览器&quot; as WB
concise &quot;Web 用户&quot; as WU

@0
WU is 空闲
WB is 空闲

@100
WU is 等待中
WB is 处理中

@300
WB is 等待中
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-00.uml">
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
<h2>增加消息
</h2>
<p>使用下述的语法增加对消息的描述。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Web 浏览器&quot; as WB
concise &quot;Web 用户&quot; as WU

@0
WU is 空闲
WB is 空闲

@100
WU -&gt; WB : URL
WU is 等待中
WB is 处理中

@300
WB is 等待中
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-01.uml">
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
<h2>相对时间
</h2>
<p>It is possible to use relative time with 
<code>@
</code>.
</p>
<div>
<div class="mycell">

<pre>@startuml
robust &quot;DNS Resolver&quot; as DNS
robust &quot;Web Browser&quot; as WB
concise &quot;Web User&quot; as WU

@0
WU is Idle
WB is Idle
DNS is Idle

@+100
WU -&gt; WB : URL
WU is Waiting
WB is Processing

@+200
WB is Waiting
WB -&gt; DNS@+50 : Resolve URL

@+100
DNS is Processing

@+300
DNS is Idle
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-02.uml">
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
<h2>Participant oriented
</h2>
<p>Rather than declare the diagram in chronological order, you can define it by participant.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Web Browser&quot; as WB
concise &quot;Web User&quot; as WU

@WB
0 is idle
+200 is Proc.
+100 is Waiting

@WU
0 is Waiting
+500 is ok
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-03.uml">
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
<h2>Setting scale
</h2>You can also set a specific scale.
<div>
<div class="mycell">

<pre>@startuml
concise &quot;Web User&quot; as WU
scale 100 as 50 pixels

@WU
0 is Waiting
+500 is ok
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-04.uml">
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
<h2>Initial state
</h2>You can also define an inital state.
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Web Browser&quot; as WB
concise &quot;Web User&quot; as WU

WB is Initializing
WU is Absent

@WB
0 is idle
+200 is Processing
+100 is Waiting

@WU
0 is Waiting
+500 is ok
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-05.uml">
</div>
</div>
<p>
</p>
<p>
<a id="8">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Intricated state
</h2>
<p>A signal could be in some undefined state.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Signal1&quot; as S1
robust &quot;Signal2&quot; as S2
S1 has 0,1,2,hello
S2 has 0,1,2
@0
S1 is 0
S2 is 0
@100
S1 is {0,1} #SlateGrey
S2 is {0,1}
@200
S1 is 1
S2 is 0
@300
S1 is hello
S2 is {0,2}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-06.uml">
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
<h2>Hidden state
</h2>
<p>It is also possible to hide some state.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
concise &quot;Web User&quot; as WU

@0
WU is {-}

@100
WU is A1

@200
WU is {-}

@300
WU is {hidden}

@400
WU is A3

@500
WU is {-}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-07.uml">
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
<h2>Using Time and Date
</h2>
<p>It is possible to use time or date.
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Web Browser&quot; as WB
concise &quot;Web User&quot; as WU

@2019/07/02
WU is Idle
WB is Idle

@2019/07/04
WU is Waiting : some note
WB is Processing : some other note

@2019/07/05
WB is Waiting
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-08.uml">
</div>
</div>
<p>
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Web Browser&quot; as WB
concise &quot;Web User&quot; as WU

@1:15:00
WU is Idle
WB is Idle

@1:16:30
WU is Waiting : some note
WB is Processing : some other note

@1:17:30
WB is Waiting
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-09.uml">
</div>
</div>
<p>
</p>
<p>
</p>
<p>
<a id="11">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Adding constraint
</h2>It is possible to display time constraints on the diagrams.
<div>
<div class="mycell">

<pre>@startuml
robust &quot;Web Browser&quot; as WB
concise &quot;Web User&quot; as WU

WB is Initializing
WU is Absent

@WB
0 is idle
+200 is Processing
+100 is Waiting
WB@0 &lt;-&gt; @50 : {50 ms lag}

@WU
0 is Waiting
+500 is ok
@200 &lt;-&gt; @+150 : {150 ms}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-10.uml">
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
<h2>Adding texts
</h2>
<p>You can optionally add a title, a header, a footer, a legend and a caption:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Title this is my title
header: some header
footer: some footer
legend
Some legend
end legend
caption some caption

robust &quot;Web Browser&quot; as WB
concise &quot;Web User&quot; as WU

@0
WU is Idle
WB is Idle

@100
WU is Waiting
WB is Processing

@300
WB is Waiting
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/timing-diagram/timing-diagram-11.uml">
</div>
</div>
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
