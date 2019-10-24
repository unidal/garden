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
<h1>状态图
</h1>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>简单状态
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>使用(
<code>[*]
</code>)开始和结束状态图。
<p>使用
<code>--&gt;
</code>添加箭头。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] --&gt; State1
State1 --&gt; [*]
State1 : this is a string
State1 : this is another string

State1 -&gt; State2
State2 --&gt; [*]

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-00.uml">
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
<h2>Change state rendering
</h2>
<p>You can use 
<code>hide empty description
</code> to render state as simple box.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
hide empty description
[*] --&gt; State1
State1 --&gt; [*]
State1 : this is a string
State1 : this is another string

State1 -&gt; State2
State2 --&gt; [*]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-01.uml">
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
<h2>合成状态
</h2>
<p>
</p>
<p>一个状态也可能是合成的，必须使用关键字
<code>state
</code>和花括号来定义合成状态。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
scale 350 width
[*] --&gt; NotShooting

state NotShooting {
  [*] --&gt; Idle
  Idle --&gt; Configuring : EvConfig
  Configuring --&gt; Idle : EvConfig
}

state Configuring {
  [*] --&gt; NewValueSelection
  NewValueSelection --&gt; NewValuePreview : EvNewValue
  NewValuePreview --&gt; NewValueSelection : EvNewValueRejected
  NewValuePreview --&gt; NewValueSelection : EvNewValueSaved
  
  state NewValuePreview {
	 State1 -&gt; State2
  }
  
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-02.uml">
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
<h2>长名字
</h2>
<p>
</p>
<p>也可以使用关键字
<code>state
</code>定义长名字状态。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
scale 600 width

[*] -&gt; State1
State1 --&gt; State2 : Succeeded
State1 --&gt; [*] : Aborted
State2 --&gt; State3 : Succeeded
State2 --&gt; [*] : Aborted
state State3 {
  state &quot;Accumulate Enough Data\nLong State Name&quot; as long1
  long1 : Just a test
  [*] --&gt; long1
  long1 --&gt; long1 : New Data
  long1 --&gt; ProcessData : Enough Data
}
State3 --&gt; State3 : Failed
State3 --&gt; [*] : Succeeded / Save Result
State3 --&gt; [*] : Aborted
 
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-03.uml">
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
<h2>并发状态
</h2>
<p>
</p>
<p>用
<code>--
</code> or 
<code>||
</code>作为分隔符来合成并发状态。
</p>
<div>
<div class="mycell">

<pre>@startuml
[*] --&gt; Active

state Active {
  [*] -&gt; NumLockOff
  NumLockOff --&gt; NumLockOn : EvNumLockPressed
  NumLockOn --&gt; NumLockOff : EvNumLockPressed
  --
  [*] -&gt; CapsLockOff
  CapsLockOff --&gt; CapsLockOn : EvCapsLockPressed
  CapsLockOn --&gt; CapsLockOff : EvCapsLockPressed
  --
  [*] -&gt; ScrollLockOff
  ScrollLockOff --&gt; ScrollLockOn : EvCapsLockPressed
  ScrollLockOn --&gt; ScrollLockOff : EvCapsLockPressed
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-04.uml">
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
<h2>箭头方向
</h2>
<p>使用
<code>-&gt;
</code>定义水平箭头，也可以使用下列格式强制设置箭头方向：
</p>
<ul>
<li>
<code>-down-&gt;
</code> (default arrow)
</li>
<li>
<code>-right-&gt;
</code> or 
<code>-&gt;
</code>
</li>
<li>
<code>-left-&gt;
</code>
</li>
<li>
<code>-up-&gt;
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] -up-&gt; First
First -right-&gt; Second
Second --&gt; Third
Third -left-&gt; Last

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-05.uml">
</div>
</div>可以用首字母缩写或者开始的两个字母定义方向(如, 
<code>-d-
</code>，
<code>-down-
</code>和
<code>-do-
</code>是完全等价的)。
<p>请不要滥用这些功能，
<em>Graphviz
</em>不喜欢这样。
</p>
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
<p>可以用 
<code>note left of
</code>, 
<code>note right of
</code>, 
<code>note top of
</code>, 
<code>note bottom of
</code> 关键字来定义注释。
</p>
<p>还可以定义多行注释。
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] --&gt; Active
Active --&gt; Inactive

note left of Active : this is a short\nnote

note right of Inactive
  A note can also
  be defined on
  several lines
end note

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-06.uml">
</div>
</div>
<p>
</p>
<p>以及浮动注释。
</p>
<div>
<div class="mycell">

<pre>@startuml

state foo
note &quot;This is a floating note&quot; as N1

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-07.uml">
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
<h2>更多注释
</h2>
<p>
</p>
<p>可以在合成状态中放置注释。
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] --&gt; NotShooting

state &quot;Not Shooting State&quot; as NotShooting {
  state &quot;Idle mode&quot; as Idle
  state &quot;Configuring mode&quot; as Configuring
  [*] --&gt; Idle
  Idle --&gt; Configuring : EvConfig
  Configuring --&gt; Idle : EvConfig
}

note right of NotShooting : This is a note on a composite state

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-08.uml">
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
<h2>显示参数
</h2>
<p>用
<code>
&lt;a href=&quot;skinparam&quot;&gt;skinparam
&lt;/a&gt;
</code>改变字体和颜色。
</p>
<p>可以在如下场景中使用：
</p>
<ul>
<li>在图示的定义中，
</li>
<li>
<a href="preprocessing">在引入的文件中
</a>，
</li>
<li>在
<a href="command-line">命令行
</a>或者
<a href="ant-task">ANT任务
</a>提供的配置文件中。
</li>
</ul>
<p>还可以为状态的构造类型指定特殊的字体和颜色。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam backgroundColor LightYellow
skinparam state {
  StartColor MediumBlue
  EndColor Red
  BackgroundColor Peru
  BackgroundColor&lt;&lt;Warning&gt;&gt; Olive
  BorderColor Gray
  FontName Impact
}

[*] --&gt; NotShooting

state &quot;Not Shooting State&quot; as NotShooting {
  state &quot;Idle mode&quot; as Idle &lt;&lt;Warning&gt;&gt;
  state &quot;Configuring mode&quot; as Configuring
  [*] --&gt; Idle
  Idle --&gt; Configuring : EvConfig
  Configuring --&gt; Idle : EvConfig
}

NotShooting --&gt; [*]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-09.uml">
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
