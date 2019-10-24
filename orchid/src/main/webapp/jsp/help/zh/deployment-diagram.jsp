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
<h1>部署图
</h1>
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
<h2>声明元素
</h2>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
actor actor
agent agent
artifact artifact
boundary boundary
card card
cloud cloud
component component
control control
database database
entity entity
file file
folder folder
frame frame
interface  interface
node node
package package
queue queue
stack stack
rectangle rectangle
storage storage
usecase usecase
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-00.uml">
</div>
</div>
<p>可选的，您可以使用方括号 
<code>[]
</code> 放置长描述文本。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
folder folder [
这是一个 &lt;b&gt;文件夹
----
您可以使用
====
不同类型
....
的分隔符
]

node node [
这是一个 &lt;b&gt;结点
----
您可以使用
====
不同类型
....
的分隔符
]

database database [
这是个数据库 &lt;b&gt;数据库
----
您可以使用
====
不同类型
....
的分隔符
]

usecase usecase [
这是个 &lt;b&gt;用例
----
您可以使用
====
不同类型
....
的分隔符
]

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-01.uml">
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
<h3>= 链接 =
</h3>
<p>您可以在元素之间创建简单链接:
</p>
<div>
<div class="mycell">

<pre>@startuml

node node1
node node2
node node3
node node4
node node5
node1 -- node2
node1 .. node3
node1 ~~ node4
node1 == node5

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-02.uml">
</div>
</div>您可以在元素之间创建简单链接:
<div>
<div class="mycell">

<pre>@startuml

node node1
node node2
node node3
node node4
node node5
node1 -- node2
node1 .. node3
node1 ~~ node4
node1 == node5

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-03.uml">
</div>
</div>
<p>横向的链接:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
left to right direction
frame user1{
card root
card sub1
card sub2
}

card leaf1
card leaf2

root--&gt;sub1
root--&gt;sub2
sub1--&gt;leaf1
sub1--&gt;leaf2
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-04.uml">
</div>
</div>
<p>您还可以使用以下类型:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

cloud cloud1
cloud cloud2
cloud cloud3
cloud cloud4
cloud cloud5
cloud1 -0- cloud2
cloud1 -0)- cloud3
cloud1 -(0- cloud4
cloud1 -(0)- cloud5

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-05.uml">
</div>
</div>
<a id="4">
</a>
<p> 
</p>
<p> 
</p>
<h3>= 包装 =
</h3>
<div>
<div class="mycell">

<pre>@startuml
artifact Foo1 {
  folder Foo2
}

folder Foo3 {
  artifact Foo4
}

frame Foo5 {
  database Foo6
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-06.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
node Foo1 {
 cloud Foo2 
}

cloud Foo3 {
  frame Foo4
}

database Foo5  {
  storage Foo6
}

storage Foo7 {
  storage Foo8
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-07.uml">
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
<h3>= 圆角 =
</h3>
<div>
<div class="mycell">

<pre>@startuml
skinparam rectangle {
	roundCorner&lt;&lt;Concept&gt;&gt; 25
}

rectangle &quot;Concept Model&quot; &lt;&lt;Concept&gt;&gt; {
	rectangle &quot;Example 1&quot; &lt;&lt;Concept&gt;&gt; as ex1
	rectangle &quot;Another rectangle&quot;
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-08.uml">
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
