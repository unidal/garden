<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>


<div id="root">
<a id="1">
</a>
<p> 
</p>
<p> 
</p>
<h1>Entity Relationship Diagram
</h1>
<p>Based on the Information Engineering notation.
</p>
<p>This is an extension to the existing 
<a href="class-diagram">Class Diagram
</a>. This extension adds:
</p>
<p>
</p>
<ul>
<li>Additional relations for the Information Engineering notation.
</li>
<li>An 
<code>entity
</code> alias that maps to the class diagram 
<code>class
</code>.
</li>
<li>An additional visibility modifier 
<code>*
</code> to identify mandatory attributes.
</li>
</ul>
<p>Otherwise, the syntax for drawing diagrams is the same as for class diagrams. All other features of class diagrams are also supported.
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Information Engineering Relations
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
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
</tr>
<tr>
<td>Zero or One
</td>
<td>
<code>|o--
</code>
</td>
</tr>
<tr>
<td>Exactly One
</td>
<td>
<code>||--
</code>
</td>
</tr>
<tr>
<td>Zero or Many
</td>
<td>
<code>}o--
</code>
</td>
</tr>
<tr>
<td>One or Many
</td>
<td>
<code>}|--
</code>
</td>
</tr>
</table>
<p>Examples:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

Entity01 }|..|| Entity02
Entity03 }o..o| Entity04
Entity05 ||--o{ Entity06
Entity07 |o--|| Entity08

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ie-diagram/ie-diagram-00.uml">
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
<h2>Entities
</h2>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
entity Entity01 {
  * identifying_attribute
  --
  * mandatory_attribute
  optional_attribute
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ie-diagram/ie-diagram-01.uml">
</div>
</div>
<p>Again, this is the normal class diagram syntax (aside from use of 
<code>entity
</code> instead of 
<code>class
</code>). Anything that you can do in a class diagram can be done here.
</p>
<p>The 
<code>*
</code> visibility modifier can be used to identify mandatory attributes. A space can be used after the modifier character to avoid conflicts with the creole bold:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
entity Entity01 {
   optional attribute
   **optional bold attribute**
   * **mandatory bold attribute**
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ie-diagram/ie-diagram-02.uml">
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
<h2>Complete Example
</h2>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

' hide the spot
hide circle

' avoid problems with angled crows feet
skinparam linetype ortho

entity &quot;Entity01&quot; as e01 {
  *e1_id : number &lt;&lt;generated&gt;&gt;
  --
  *name : text
  description : text
}

entity &quot;Entity02&quot; as e02 {
  *e2_id : number &lt;&lt;generated&gt;&gt;
  --
  *e1_id : number &lt;&lt;FK&gt;&gt;
  other_details : text
}

entity &quot;Entity03&quot; as e03 {
  *e3_id : number &lt;&lt;generated&gt;&gt;
  --
  e1_id : number &lt;&lt;FK&gt;&gt;
  other_details : text
}

e01 ||..o{ e02
e01 |o..o{ e03

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ie-diagram/ie-diagram-03.uml">
</div>
</div>
<p>Currently the crows feet do not look very good when the relationship is drawn at an angle to the entity. This can be avoided by using the 
<code>linetype ortho
</code> skinparam.
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
