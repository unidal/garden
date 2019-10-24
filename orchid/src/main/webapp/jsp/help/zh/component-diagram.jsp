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
<h1>组件图
</h1>
<p>
</p>
<p>我们来看几个例子 : 
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h3>= 组件 =
</h3>
<p>
</p>组件必须用中括号括起来。
<p>还可以使用关键字
<code>component
</code>定义一个组件。 并且可以用关键字
<code>as
</code>给组件定义一个别名。 这个别名可以在稍后定义关系的时候使用。
</p>
<div>
<div class="mycell">

<pre>@startuml

[First component]
[Another component] as Comp2  
component Comp3
component [Last\ncomponent] as Comp4

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-00.uml">
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
<h3>= 接口 =
</h3>
<p>接口可以使用
<code>()
</code>来定义(因为这个看起来像个圆)。
</p>
<p>还可以使用关键字
<code>interface
</code>关键字来定义接口。 并且还可以使用关键字
<code>as
</code>定义一个别名。 这个别名可以在稍后定义关系的时候使用。
</p>
<p>我们稍后可以看到，接口的定义是可选的。
</p>
<div>
<div class="mycell">

<pre>@startuml

() &quot;First Interface&quot;
() &quot;Another interface&quot; as Interf2
interface Interf3
interface &quot;Last\ninterface&quot; as Interf4

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-01.uml">
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
<h2>基础的示例
</h2>
<p>
</p>
<p>
</p>
<p>元素之间可以使用虚线(
<code>..
</code>)、直线(
<code>--
</code>)、箭头(
<code>--&gt;
</code>)进行连接。
</p>
<div>
<div class="mycell">

<pre>@startuml

DataAccess - [First Component] 
[First Component] ..&gt; HTTP : use

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-02.uml">
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
<h2>使用注释
</h2>
<p>你可以使用 
<code>note left of
</code> , 
<code>note right of
</code> , 
<code>note top of
</code> , 
<code>note bottom of
</code> 等关键字定义相对于对象位置的注释。
</p>
<p>
</p>
<p>也可以使用关键字
<code>note
</code>单独定义注释，然后使用虚线(
<code>..
</code>)将其连接到其他对象。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

interface &quot;Data Access&quot; as DA

DA - [First Component] 
[First Component] ..&gt; HTTP : use

note left of HTTP : Web Service only

note right of [First Component]
  A note can also
  be on several lines
end note

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-03.uml">
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
<h2>组合组件
</h2>
<p>你可以使用多个关键字将组件和接口组合在一起。
</p>
<ul>
<li>
<code>package
</code>
</li>
<li>
<code>node
</code>
</li>
<li>
<code>folder
</code>
</li>
<li>
<code>frame
</code>
</li>
<li>
<code>cloud
</code>
</li>
<li>
<code>database
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

package &quot;Some Group&quot; {
  HTTP - [First Component]
  [Another Component]
}
 
node &quot;Other Groups&quot; {
  FTP - [Second Component]
  [First Component] --&gt; FTP
} 

cloud {
  [Example 1]
}


database &quot;MySql&quot; {
  folder &quot;This is my folder&quot; {
	[Folder 3]
  }
  frame &quot;Foo&quot; {
	[Frame 4]
  }
}


[Another Component] --&gt; [Example 1]
[Example 1] --&gt; [Folder 3]
[Folder 3] --&gt; [Frame 4]

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-04.uml">
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
<h2>改变箭头方向
</h2>
<p>
</p>
<p>默认情况下，对象之间用
<code>--
</code>连接，并且连接是竖直的。不过可以使用一个横线或者点设置水平方向的连接，就行这样：
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
[Component] --&gt; Interface1
[Component] -&gt; Interface2
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-05.uml">
</div>
</div>
<p>也可以使用反向连接：
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Interface1 &lt;-- [Component]
Interface2 &lt;- [Component]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-06.uml">
</div>
</div>
<p>还可以使用关键字
<code>left
</code>, 
<code>right
</code>, 
<code>up
</code> or 
<code>down
</code>改变箭头方向。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
[Component] -left-&gt; left 
[Component] -right-&gt; right 
[Component] -up-&gt; up
[Component] -down-&gt; down
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-07.uml">
</div>
</div>
<p>允许使用方向单词的首字母或者前两个字母表示方向(例如
<code>-d-
</code>, 
<code>-do-
</code>, 
<code>-down-
</code>都是等价的)。
</p>
<p>请不要乱用这些功能：
<em>Graphviz
</em>(PlantUML的后端引擎)不喜欢这个样子。
</p>
<p>
<a id="8">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>使用UML2标记符
</h2>
<p>命令
<code>skinparam componentStyle uml2
</code> 可以切换到UML2标记符。
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam componentStyle uml2

interface &quot;Data Access&quot; as DA

DA - [First Component] 
[First Component] ..&gt; HTTP : use

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-08.uml">
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
<h2>长描述
</h2>可以用方括号"[ ]"在连线上添加描述。
<div>
<div class="mycell">

<pre>@startuml
component comp1 [
This component
has a long comment
on several lines
]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-09.uml">
</div>
</div>
<a id="10">
</a>
<p> 
</p>
<p> 
</p>
<h2>不同的颜色表示
</h2>
<p>
</p>
<p>你可以在声明一个组件时加上颜色的声明。
</p>
<div>
<div class="mycell">

<pre>@startuml
component  [Web Server] #Yellow
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-10.uml">
</div>
</div>
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
<h2>在定型组件中使用精灵图
</h2>你可以在定型组件中使用精灵图（sprite）。
<div>
<div class="mycell">

<pre>@startuml
sprite $businessProcess [16x16/16] {
FFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFF
FFFFFFFFFF0FFFFF
FFFFFFFFFF00FFFF
FF00000000000FFF
FF000000000000FF
FF00000000000FFF
FFFFFFFFFF00FFFF
FFFFFFFFFF0FFFFF
FFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFF
FFFFFFFFFFFFFFFF
}


rectangle &quot; End to End\nbusiness process&quot; &lt;&lt;$businessProcess&gt;&gt; {
 rectangle &quot;inner process 1&quot; &lt;&lt;$businessProcess&gt;&gt; as src
 rectangle &quot;inner process 2&quot; &lt;&lt;$businessProcess&gt;&gt; as tgt
 src -&gt; tgt
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-11.uml">
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
<p>可以为构造类型和接口定义特殊的颜色和字体。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

skinparam interface {
  backgroundColor RosyBrown
  borderColor orange
}

skinparam component {
  FontSize 13
  BackgroundColor&lt;&lt;Apache&gt;&gt; Red
  BorderColor&lt;&lt;Apache&gt;&gt; #FF6655
  FontName Courier
  BorderColor black
  BackgroundColor gold
  ArrowFontName Impact
  ArrowColor #FF6655
  ArrowFontColor #777777
}

() &quot;Data Access&quot; as DA

DA - [First Component] 
[First Component] ..&gt; () HTTP : use
HTTP - [Web Server] &lt;&lt; Apache &gt;&gt;

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-12.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
[AA] &lt;&lt;static lib&gt;&gt;
[BB] &lt;&lt;shared lib&gt;&gt;
[CC] &lt;&lt;static lib&gt;&gt;

node node1
node node2 &lt;&lt;shared node&gt;&gt;
database Production

skinparam component {
	backgroundColor&lt;&lt;static lib&gt;&gt; DarkKhaki
	backgroundColor&lt;&lt;shared lib&gt;&gt; Green
}

skinparam node {
	borderColor Green
	backgroundColor Yellow
	backgroundColor&lt;&lt;shared node&gt;&gt; Magenta
}
skinparam databaseBackgroundColor Aqua

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/component-diagram/component-diagram-13.uml">
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
