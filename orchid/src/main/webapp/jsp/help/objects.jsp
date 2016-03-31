<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Definition of objects</h2>
<div><p>
You define instance of objects using the <code>object</code>
keywords.</div>
<pre>&#64;startuml
object firstObject
object &quot;My Second Object&quot; as o2
@enduml
</pre>
<img src='${model.webapp}/uml/help/objects/01-Definition+of+objects.uml'>
</div>

<div>
<h2>Relations between objects</h2>
<div>Relations between objects are defined using the following symbols :
<br/><br/>
<div style="margin-left: 2em">
<table border="1" cellpadding="5" cellspacing="0">
<tr>
<td>Extension</td>
<td><code>&lt;|--</code></td>
<td><img width="40" src="img/extends01.png"/></td>
</tr>
<tr>
<td>Composition</td>
<td><code>*--</code></td>
<td><img src="img/sym03.png"/></td>
</tr>
<tr>
<td>Aggregation</td>
<td><code>o--</code></td>
<td><img src="img/sym01.png"/></td>
</tr>
</table>
</div>
<p>
It is possible to replace <code>--</code> by <code>..</code> to
have a dotted line.
<p>
Knowing those rules, it is possible to draw the following drawings.
<p>
It is possible a add a label on the relation, using " <code>:</code>
", followed by the text of the label.
<p>
For cardinality, you can use double-quotes <code>""</code> on
each side of the relation.</div>
<pre>&#64;startuml
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
<img src='${model.webapp}/uml/help/objects/02-Relations+between+objects.uml'>
</div>

<div>
<h2>Adding fields</h2>
<div>To declare fields, you can use the symbol <code>":"</code> followed by
the field's name.</div>
<pre>&#64;startuml

object user

user : name = &quot;Dummy&quot;
user : id = 123

@enduml
</pre>
<img src='${model.webapp}/uml/help/objects/03-Adding+fields.uml'>
</div>



</a:layout>
