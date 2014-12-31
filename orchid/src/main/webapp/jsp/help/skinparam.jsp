<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Text Alignment</h2>
<pre>@startuml
skinparam sequenceMessageAlign center
Alice -&gt; Bob : Hi
Alice -&gt; Bob : This is very long
@enduml</pre>
<img src='${model.webapp}/uml/help/skinparam/01-Text+Alignment.uml'>
</div>

<div>
<h2>Black and White</h2>
<pre>@startuml

skinparam monochrome true

actor User
participant &quot;First Class&quot; as A
participant &quot;Second Class&quot; as B
participant &quot;Last Class&quot; as C

User -&gt; A: DoWork
activate A

A -&gt; B: Create Request
activate B

B -&gt; C: DoWork
activate C
C --&gt; B: WorkDone
destroy C

B --&gt; A: Request Created
deactivate B

A --&gt; User: Done
deactivate A

@enduml</pre>
<img src='${model.webapp}/uml/help/skinparam/02-Black+and+White.uml'>
</div>



</a:layout>
