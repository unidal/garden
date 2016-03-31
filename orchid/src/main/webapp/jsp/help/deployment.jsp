<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Declaring element</h2>
<pre>&#64;startuml

artifact artifact
actor actor
folder folder
node node
frame frame
cloud cloud
database database
storage storage
agent agent
usecase usecase
component component
boundary boundary
control control
entity entity
interface interface


@enduml
</pre>
<img src='${model.webapp}/uml/help/deployment/01-Declaring+element.uml'>
</div>

<div>
<h2>Linking</h2>
<pre>&#64;startuml

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
<img src='${model.webapp}/uml/help/deployment/02-Linking.uml'>
</div>

<div>
<h2>Linking</h2>
<pre>&#64;startuml

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
<img src='${model.webapp}/uml/help/deployment/03-Linking.uml'>
</div>

<div>
<h2>Linking</h2>
<pre>&#64;startuml

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
<img src='${model.webapp}/uml/help/deployment/04-Linking.uml'>
</div>



</a:layout>
