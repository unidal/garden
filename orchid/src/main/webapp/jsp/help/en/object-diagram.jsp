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
<h1>Object Diagram
</h1>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Definition of objects
</h2>
<p>
</p>
<p>You define instance of objects using the 
<code>object
</code> keywords.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
object firstObject
object &quot;My Second Object&quot; as o2
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-00.uml">
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
<h2>Relations between objects
</h2>
<p>Relations between objects are defined using the following symbols :
</p>
<p>
</p>
<table border="1" cellspacing="0" cellpadding="5">
<tr>
<td>
<b>Type 
</b>
</td>
<td>
<b>Symbol 
</b>
</td>
<td>
<b>Image 
</b>
</td>
</tr>
<tr>
<td>Extension
</td>
<td>
<code>&lt;|--
</code>
</td>
<td>
<img>
</td>
</tr>
<tr>
<td>Composition
</td>
<td>
<code>*--
</code>
</td>
<td>
<img>
</td>
</tr>
<tr>
<td>Aggregation
</td>
<td>
<code>o--
</code>
</td>
<td>
<img>
</td>
</tr>
</table>
<p>It is possible to replace 
<code>--
</code> by 
<code>..
</code> to have a dotted line.
</p>
<p>Knowing those rules, it is possible to draw the following drawings.
</p>
<p>It is possible a add a label on the relation, using 
<code>:
</code> followed by the text of the label.
</p>
<p>For cardinality, you can use double-quotes 
<code>&quot;&quot;
</code> on each side of the relation.
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
object Object01
object Object02
object Object03
object Object04
object Object05
object Object06
object Object07
object Object08

Object01 &lt;|-- Object02
Object03 *-- Object04
Object05 o-- &quot;4&quot; Object06
Object07 .. Object08 : some labels
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-01.uml">
</div>
</div>
<a id="4">
</a>
<p> 
</p>
<p> 
</p>
<h2>Adding fields
</h2>
<p>To declare fields, you can use the symbol 
<code>:
</code> followed by the field's name.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

object user

user : name = &quot;Dummy&quot;
user : id = 123

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-02.uml">
</div>
</div>
<p>It is also possible to group all fields between brackets 
<code>{}
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

object user {
  name = &quot;Dummy&quot;
  id = 123
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-03.uml">
</div>
</div>
<a id="5">
</a>
<p> 
</p>
<p> 
</p>
<h2>Common features with class diagrams
</h2>
<p>
</p>
<ul>
<li>
<a href="class-diagram#Hide attributes, methods...">Hide attributes, methods...
</a>
</li>
<li>
<a href="class-diagram#Notes">Defines notes
</a>
</li>
<li>
<a href="class-diagram#Using">Use packages
</a>
</li>
<li>
<a href="class-diagram#Skinparam">Skin the output
</a>
</li>
</ul>
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
