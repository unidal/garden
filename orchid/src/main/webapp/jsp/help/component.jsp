<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Components</h2>
<div>Components must be bracketed.
<p>
You can also use the <code>component</code> keyword to defines a
component.
And you can define an alias, using the <code>as</code>
keyword.
This alias will be used latter, when defining relations.</div>
<pre>&#64;startuml

[First component]
[Another component] as Comp2  
component Comp3
component [Last\ncomponent] as Comp4

@enduml
</pre>
<img src='${model.webapp}/uml/help/component/01-Components.uml'>
</div>

<div>
<h2>Interfaces</h2>
<div>Interface can be defined using the <code>()</code> symbol (because this looks like a circle).
<p>
You can also use the <code>interface</code> keyword to defines an interface.
And you can define an alias, using the <code>as</code> keyword.
This alias will be used latter, when defining relations.
<p>
We will see latter that interface definition is optional.</div>
<pre>&#64;startuml

() &quot;First Interface&quot;
() &quot;Another interface&quot; as Interf2
interface Interf3
interface &quot;Last\ninterface&quot; as Interf4

@enduml
</pre>
<img src='${model.webapp}/uml/help/component/02-Interfaces.uml'>
</div>

<div>
<h2>Basic example</h2>
<div><p>
Links between elements are made using combinations of dotted line
(<code>..</code>), straight line (<code>--</code>), and arrows (<code>--&gt;</code>)
symbols.</div>
<pre>&#64;startuml

DataAccess - [First Component] 
[First Component] ..&gt; HTTP : use

@enduml
</pre>
<img src='${model.webapp}/uml/help/component/03-Basic+example.uml'>
</div>

<div>
<h2>Using notes</h2>
<div>You can use the
<code>note left of</code> , <code>note right of</code> ,
<code>note top of</code> , <code>note bottom of</code>
keywords to define notes related to a single object.
<p>
A note can be also define alone with the <code>note</code>
keywords, then linked to other objects using the <code>..</code> symbol.</div>
<pre>&#64;startuml

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
<img src='${model.webapp}/uml/help/component/04-Using+notes.uml'>
</div>

<div>
<h2>Grouping Components</h2>
<div>You can use several keywords to group components and interfaces together:
<ul>
<li><code>package</code></li>
<li><code>node</code></li>
<li><code>folder</code></li>
<li><code>frame</code></li>
<li><code>cloud</code></li>
<li><code>database</code></li>
</ul></div>
<pre>&#64;startuml

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
<img src='${model.webapp}/uml/help/component/05-Grouping+Components.uml'>
</div>

<div>
<h2>Changing arrows direction</h2>
<div>By default, links between classes have two dashes <code>--</code> and are vertically oriented.
It is possible to use horizontal link by putting a single dash (or dot) like this:</div>
<pre>&#64;startuml
[Component] --&gt; Interface1
[Component] -&gt; Interface2
@enduml
</pre>
<img src='${model.webapp}/uml/help/component/06-Changing+arrows+direction.uml'>
</div>

<div>
<h2>Title the diagram</h2>
<div>The <code>title</code> keywords is used to put a title.
<p>
You can use <code>title</code> and <code>end title</code>
keywords for a longer title, as in sequence diagrams.</div>
<pre>&#64;startuml
title Very simple component\ndiagram

interface &quot;Data Access&quot; as DA

DA - [First Component] 
[First Component] ..&gt; HTTP : use

@enduml
</pre>
<img src='${model.webapp}/uml/help/component/07-Title+the+diagram.uml'>
</div>

<div>
<h2>Use UML2 notation</h2>
<div>The <code>skinparam componentStyle uml2</code> command is used to switch to UML2 notation.</div>
<pre>&#64;startuml
skinparam componentStyle uml2

interface &quot;Data Access&quot; as DA

DA - [First Component] 
[First Component] ..&gt; HTTP : use

@enduml
</pre>
<img src='${model.webapp}/uml/help/component/08-Use+UML2+notation.uml'>
</div>

<div>
<h2>Individual colors</h2>
<div>You can specify a color after component definition.</div>
<pre>&#64;startuml
component  [Web Server] #Yellow
@enduml
</pre>
<img src='${model.webapp}/uml/help/component/09-Individual+colors.uml'>
</div>

<div>
<h2>Skinparam</h2>
<div>You can use the <code><a href=skinparam.html>skinparam</a></code>
command to change colors and fonts for the drawing.
<p>
You can use this command :
<ul>
<li>In the diagram definition, like any other commands,
<li>In an <a href=preprocessing.html>included file</a>,
<li>In a configuration file, provided in the <a href=command_line.html>command line</a> or the <a href=ant_task.html>ANT task</a>.
</ul>
You can define specific color and fonts for stereotyped components and interfaces.</div>
<pre>&#64;startuml

skinparam component {
  FontSize 13
  InterfaceBackgroundColor RosyBrown
  InterfaceBorderColor orange
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
<img src='${model.webapp}/uml/help/component/10-Skinparam.uml'>
</div>



</a:layout>
