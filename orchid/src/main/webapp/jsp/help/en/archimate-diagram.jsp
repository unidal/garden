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
<h1>Archimate Diagram
</h1>
<p>
<u>This is only a proposal and subject to change
</u>.
</p>
<p>You are very welcome 
<a href="http://forum.plantuml.net">to create a new discussion
</a> on this future syntax. Your feedbacks, ideas and suggestions help us to find the right solution.
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Archimate keyword
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>
<p>You can use the 
<code>archimate
</code> keyword to define an element. Stereotype can optionally specify an additional icon. Some colors (
<code>Business
</code>, 
<code>Application
</code>, 
<code>Motivation
</code>, 
<code>Strategy
</code>, 
<code>Technology
</code>, 
<code>Physical
</code>, 
<code>Implementation
</code>) are also available.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
archimate #Technology &quot;VPN Server&quot; as vpnServerA &lt;&lt;technology-device&gt;&gt;

rectangle GO #lightgreen
rectangle STOP #red
rectangle WAIT #orange
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/archimate-diagram/archimate-diagram-00.uml">
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
<h2>Defining Junctions
</h2>
<p>Using the 
<code>circle
</code> keyword and the 
<a href="preprocessing">preprocessor
</a>, you can also create junctions.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
!define Junction_Or circle #black
!define Junction_And circle #whitesmoke

Junction_And JunctionAnd
Junction_Or JunctionOr

archimate #Technology &quot;VPN Server&quot; as vpnServerA &lt;&lt;technology-device&gt;&gt;

rectangle GO #lightgreen
rectangle STOP #red
rectangle WAIT #orange
GO -up-&gt; JunctionOr
STOP -up-&gt; JunctionOr
STOP -down-&gt; JunctionAnd
WAIT -down-&gt; JunctionAnd
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/archimate-diagram/archimate-diagram-01.uml">
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
<h2>Example 1
</h2>
<p>

</p>
<pre>@startuml

sprite $bProcess jar:archimate/business-process
sprite $aService jar:archimate/application-service
sprite $aComponent jar:archimate/application-component

archimate #Business &quot;Handle claim&quot;  as HC &lt;&lt;business-process&gt;&gt;
archimate #Business &quot;Capture Information&quot;  as CI &lt;&lt;business-process&gt;&gt;
archimate #Business &quot;Notify\nAdditional Stakeholders&quot; as NAS &lt;&lt;business-process&gt;&gt;
archimate #Business &quot;Validate&quot; as V &lt;&lt;business-process&gt;&gt;
archimate #Business &quot;Investigate&quot; as I &lt;&lt;business-process&gt;&gt;
archimate #Business &quot;Pay&quot; as P &lt;&lt;business-process&gt;&gt;

HC *-down- CI
HC *-down- NAS
HC *-down- V
HC *-down- I
HC *-down- P

CI -right-&gt;&gt; NAS
NAS -right-&gt;&gt; V
V -right-&gt;&gt; I
I -right-&gt;&gt; P

archimate #APPLICATION &quot;Scanning&quot; as scanning &lt;&lt;application-service&gt;&gt;
archimate #APPLICATION &quot;Customer admnistration&quot; as customerAdministration &lt;&lt;application-service&gt;&gt;
archimate #APPLICATION &quot;Claims admnistration&quot; as claimsAdministration &lt;&lt;application-service&gt;&gt;
archimate #APPLICATION Printing  &lt;&lt;application-service&gt;&gt;
archimate #APPLICATION Payment  &lt;&lt;application-service&gt;&gt;

scanning -up-&gt; CI
customerAdministration  -up-&gt; CI
claimsAdministration -up-&gt; NAS
claimsAdministration -up-&gt; V
claimsAdministration -up-&gt; I
Payment -up-&gt; P

Printing -up-&gt; V
Printing -up-&gt; P

archimate #APPLICATION &quot;Document\nManagement\nSystem&quot; as DMS &lt;&lt;application-component&gt;&gt;
archimate #APPLICATION &quot;General\nCRM\nSystem&quot; as CRM &lt;&lt;application-component&gt;&gt;
archimate #APPLICATION &quot;Home & Away\nPolicy\nAdministration&quot; as HAPA &lt;&lt;application-component&gt;&gt;
archimate #APPLICATION &quot;Home & Away\nFinancial\nAdministration&quot; as HFPA &lt;&lt;application-component&gt;&gt;

DMS .up.|&gt; scanning
DMS .up.|&gt; Printing
CRM .up.|&gt; customerAdministration
HAPA .up.|&gt; claimsAdministration
HFPA .up.|&gt; Payment

legend left
Example from the &quot;Archisurance case study&quot; (OpenGroup).
See 
==
&lt;$bProcess&gt; :business process
==
&lt;$aService&gt; : application service
==
&lt;$aComponent&gt; : application component
endlegend

@enduml
</pre>
<p>
<img src="/uml/help/archimate-diagram/archimate-diagram-02.uml">
</p>
<p>
</p>
<p>
<a id="5">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Example 2
</h2>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
rectangle &quot;Capture Information&quot;  as CI &lt;&lt;$archimate/business-process&gt;&gt; #yellow
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/archimate-diagram/archimate-diagram-03.uml">
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
<h2>List possible sprites
</h2>
<p>You can list all possible sprites for Archimate using the following diagram: 

</p>
<pre>listsprite
</pre>
<p>
<img src="/uml/help/archimate-diagram/archimate-diagram-04.uml">
</p>
<p>
<a id="7">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>ArchiMate Macros
</h2>
<p>A list of Archimate marcros are defined 
<a href="https://github.com/ebbypeter/Archimate-PlantUML ">Archimate-PlantUML
</a> here which simplifies the creation of ArchiMate diagrams.
</p>
<p>Using the macros, creation of ArchiMate elements are done using the following format: 
<code>Category_ElementName(nameOfTheElement, &quot;description&quot;)
</code>
</p>
<p>For Example:
</p>
<ul>
<li>To define a Stakeholder element, which is part of Motivation category, the syntax will be 
<code>Motivation_Stakeholder(StakeholderElement, &quot;Stakeholder Description&quot;)
</code>
</li>
<li>To define a Business Service element,
</li>
</ul>
<code>Business_Service(BService, &quot;Business Service&quot;)
</code>
<p>The ArchiMate relationships are defined with the following pattern: 
<code>Rel_RelationType(fromElement, toElement, &quot;description&quot;)
</code> and to define the direction / orientation of the two elements: 
<code>Rel_RelationType_Direction(fromElement, toElement, &quot;description&quot;)
</code>
</p>
<p>The RelationTypes supported are:
</p>
<ul>
<li>Access
</li>
<li>Aggregation
</li>
<li>Assignment
</li>
<li>Association
</li>
<li>Composition
</li>
<li>Flow
</li>
<li>Influence
</li>
<li>Realization
</li>
<li>Serving
</li>
<li>Specilization
</li>
<li>Triggering
</li>
</ul>
<p>The Directions supported are:
</p>
<ul>
<li>Up
</li>
<li>Down
</li>
<li>Left
</li>
<li>Right
</li>
</ul>
<p>For example:
</p>
<ul>
<li>To denote a composition relationship between the Stakeholder and Business Service defined above, the syntax will be
</li>
</ul>
<code>Rel_Composition(StakeholderElement, BService, &quot;Description for the relationship&quot;)
</code>
<ul>
<li>Unordered List ItemTo orient the two elements in top - down position, the syntax will be
</li>
</ul>
<code>Rel_Composition_Down(StakeholderElement, BService, &quot;Description for the relationship&quot;)
</code>
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
