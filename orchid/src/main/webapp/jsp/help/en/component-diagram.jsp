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
<h1>Component Diagram
</h1>
<p>
</p>
<p>Let's have few examples : 
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Components
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>Components must be bracketed.
<p>You can also use the 
<code>component
</code> keyword to define a component. And you can define an alias, using the 
<code>as
</code> keyword. This alias will be used latter, when defining relations.
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
<h2>Interfaces
</h2>
<p>Interface can be defined using the 
<code>()
</code> symbol (because this looks like a circle).
</p>
<p>You can also use the 
<code>interface
</code> keyword to define an interface. And you can define an alias, using the 
<code>as
</code> keyword. This alias will be used latter, when defining relations.
</p>
<p>We will see latter that interface definition is optional.
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
<h2>Basic example
</h2>
<p>
</p>
<p>
</p>
<p>Links between elements are made using combinations of dotted line (
<code>..
</code>), straight line (
<code>--
</code>), and arrows (
<code>--&gt;
</code>) symbols.
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
<h2>Using notes
</h2>
<p>You can use the 
<code>note left of
</code> , 
<code>note right of
</code> , 
<code>note top of
</code> , 
<code>note bottom of
</code> keywords to define notes related to a single object.
</p>
<p>
</p>
<p>A note can be also define alone with the 
<code>note
</code> keywords, then linked to other objects using the 
<code>..
</code> symbol.
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
<h2>Grouping Components
</h2>
<p>You can use several keywords to group components and interfaces together:
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
<h2>Changing arrows direction
</h2>
<p>
</p>
<p>By default, links between classes have two dashes 
<code>--
</code> and are vertically oriented. It is possible to use horizontal link by putting a single dash (or dot) like this:
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
<p>You can also change directions by reversing the link:
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
<p>It is also possible to change arrow direction by adding 
<code>left
</code>, 
<code>right
</code>, 
<code>up
</code> or 
<code>down
</code> keywords inside the arrow:
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
<p>You can shorten the arrow by using only the first character of the direction (for example, 
<code>-d-
</code> instead of 
<code>-down-
</code>) or the two first characters (
<code>-do-
</code>).
</p>
<p>Please note that you should not abuse this functionality : 
<em>Graphviz
</em> gives usually good results without tweaking.
</p>
<p>
<a id="8">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Use UML2 notation
</h2>
<p>The 
<code>skinparam componentStyle uml2
</code> command is used to switch to UML2 notation.
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
<h2>Long description
</h2>It is possible to put description on several lines using square brackets.
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
<h2>Individual colors
</h2>
<p>
</p>
<p>You can specify a color after component definition.
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
<h2>Using Sprite in Stereotype
</h2>You can use sprites within stereotype components.
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
<h2>Skinparam
</h2>
<p>
</p>
<p>
</p>
<p>You can use the 
<code>
&lt;a href=&quot;skinparam&quot;&gt;skinparam
&lt;/a&gt;
</code> command to change colors and fonts for the drawing.
</p>
<p>You can use this command :
</p>
<ul>
<li>In the diagram definition, like any other commands,
</li>
<li>In an 
<a href="preprocessing">included file
</a>,
</li>
<li>In a configuration file, provided in the 
<a href="command-line">command line
</a> or the 
<a href="ant-task">ANT task
</a>.
</li>
</ul>
<p>You can define specific color and fonts for stereotyped components and interfaces.
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
