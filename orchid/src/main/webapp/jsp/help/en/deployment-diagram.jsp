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
<h1>Deployment Diagram
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
<h2>Declaring element
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
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
<p>You can optionaly put text using bracket 
<code>[]
</code> for a long description.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
folder folder [
This is a &lt;b&gt;folder
----
You can use separator
====
of different kind
....
and style
]

node node [
This is a &lt;b&gt;node
----
You can use separator
====
of different kind
....
and style
]

database database [
This is a &lt;b&gt;database
----
You can use separator
====
of different kind
....
and style
]

usecase usecase [
This is a &lt;b&gt;usecase
----
You can use separator
====
of different kind
....
and style
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
<h2>Linking
</h2>
<p>You can create simple links between elements with or without labels:
</p>
<div>
<div class="mycell">

<pre>@startuml

node node1
node node2
node node3
node node4
node node5
node1 -- node2 : label1
node1 .. node3 : label2
node1 ~~ node4 : label3
node1 == node5

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-02.uml">
</div>
</div>
<p>
</p>
<p>It is possible to use several types of links:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

artifact artifact1
artifact artifact2
artifact artifact3
artifact artifact4
artifact artifact5
artifact artifact6
artifact artifact7
artifact artifact8
artifact artifact9
artifact artifact10
artifact1 --&gt; artifact2
artifact1 --* artifact3
artifact1 --o artifact4
artifact1 --+ artifact5
artifact1 --# artifact6
artifact1 --&gt;&gt; artifact7
artifact1 --0 artifact8
artifact1 --^ artifact9
artifact1 --(0 artifact10

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-03.uml">
</div>
</div>
<p>You can also have the following types:
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
<img src="/uml/help/deployment-diagram/deployment-diagram-04.uml">
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
<h2>Packages
</h2>
<em>There is a limit of three levels.
</em>
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

cloud vpc {
  node ec2 {
	stack stack
  }
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/deployment-diagram/deployment-diagram-05.uml">
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
<img src="/uml/help/deployment-diagram/deployment-diagram-06.uml">
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
<h2>Round corner
</h2>
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
<img src="/uml/help/deployment-diagram/deployment-diagram-07.uml">
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
