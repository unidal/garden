<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Usecases</h2>
<div>Use cases are enclosed using between parentheses (because two
parentheses looks like an oval).
<p>
You can also use the <code>usecase</code> keyword to define a
usecase.
And you can define an alias, using the <code>as</code> keyword.
This alias will be used latter, when defining relations.</div>
<pre>&#64;startuml

(First usecase)
(Another usecase) as (UC2)  
usecase UC3
usecase (Last\nusecase) as UC4

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/01-Usecases.uml'>
</div>

<div>
<h2>Actors</h2>
<div>Actor are enclosed using between two points.
<p>
You can also use the <code>actor</code> keyword to define an
actor.
And you can define an alias, using the <code>as</code> keyword.
This alias will be used latter, when defining relations.
<p>
We will see later that the actor definitions are optional.</div>
<pre>&#64;startuml

:First Actor:
:Another\nactor: as Men2  
actor Men3
actor :Last actor: as Men4

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/02-Actors.uml'>
</div>

<div>
<h2>Usecases description</h2>
<div>If you want to have description on several lines, you can use quotes.
<p>
You can also use the following separators: <code>--</code>
<code>..</code> <code>==</code> <code>__</code>.
And you can put titles within the separators.</div>
<pre>&#64;startuml

usecase UC1 as &quot;You can use
several lines to define your usecase.
You can also use separators.
--
Several separators are possible.
==
And you can add titles:
..Conclusion..
This allows large description.&quot;

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/03-Usecases+description.uml'>
</div>

<div>
<h2>Basic example</h2>
<div><p>
To link actors and use cases, the arrow <code>--&gt;</code> is
used.
<p>
The more dashes <code>"-"</code> in the arrow, the longer the
arrow.
You can add a label on the arrow, by adding a "<code>:</code>"
character in the arrow definition.
<p>
In this example, you see that <i>User</i> has not been defined
before, and is used as an actor.</div>
<pre>&#64;startuml

User -&gt; (Start)
User --&gt; (Use the application) : A small label

:Main Admin: ---&gt; (Use the application) : This is\nyet another\nlabel

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/04-Basic+example.uml'>
</div>

<div>
<h2>Extension</h2>
<div>If one actor/use case extends another one, you can use the symbol <code>&lt;|--</code>
(which stands for <img width="40" src="img/extends01.png">).</div>
<pre>&#64;startuml
:Main Admin: as Admin
(Use the application) as (Use)

User &lt;|-- Admin
(Start) &lt;|-- (Use)

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/05-Extension.uml'>
</div>

<div>
<h2>Using notes</h2>
<div>You can use the <code>note left of</code> , <code>note right of</code> ,
<code>note top of</code> , <code>note bottom of</code> keywords to
define notes related to a single object.
<p>
A note can be also define alone with the <code>note</code>
keywords, then linked to other objects using the <code>..</code> symbol.</div>
<pre>&#64;startuml
:Main Admin: as Admin
(Use the application) as (Use)

User -&gt; (Start)
User --&gt; (Use)

Admin ---&gt; (Use)

note right of Admin : This is an example.

note right of (Use)
  A note can also
  be on several lines
end note

note &quot;This note is connected\nto several objects.&quot; as N2
(Start) .. N2
N2 .. (Use)
@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/06-Using+notes.uml'>
</div>

<div>
<h2>Stereotypes</h2>
<div>You can add stereotypes while defining actors and use cases using " <code>&lt;&lt;</code>
" and " <code>&gt;&gt;</code> ".</div>
<pre>&#64;startuml
User &lt;&lt; Human &gt;&gt;
:Main Database: as MySql &lt;&lt; Application &gt;&gt;
(Start) &lt;&lt; One Shot &gt;&gt;
(Use the application) as (Use) &lt;&lt; Main &gt;&gt;

User -&gt; (Start)
User --&gt; (Use)

MySql --&gt; (Use)

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/07-Stereotypes.uml'>
</div>

<div>
<h2>Changing arrows direction</h2>
<div>By default, links between classes have two dashes <code>--</code> and are vertically oriented.
It is possible to use horizontal link by putting a single dash (or dot) like this:</div>
<pre>&#64;startuml
:user: --&gt; (Use case 1)
:user: -&gt; (Use case 2)
@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/08-Changing+arrows+direction.uml'>
</div>

<div>
<h2>Title the diagram</h2>
<div>The <code>title</code> keywords is used to put a title.
<p>
You can use <code>title</code> and <code>end title</code>
keywords for a longer title, as in sequence diagrams.</div>
<pre>&#64;startuml
title Simple &lt;b&gt;Usecase&lt;/b&gt;\nwith one actor

&quot;Use the application&quot; as (Use)
User -&gt; (Use)

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/09-Title+the+diagram.uml'>
</div>

<div>
<h2>Splitting diagrams</h2>
<div>The <code>newpage</code> keywords to split your diagram into several pages or images.</div>
<pre>&#64;startuml
:actor1: --&gt; (Usecase1)
newpage
:actor2: --&gt; (Usecase2)
@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/10-Splitting+diagrams.uml'>
</div>

<div>
<h2>Left to right direction</h2>
<div>The general default behavior when building diagram is <b>top to bottom</b>.</div>
<pre>&#64;startuml
'default
top to bottom direction
user1 --&gt; (Usecase 1)
user2 --&gt; (Usecase 2)

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/11-Left+to+right+direction.uml'>
</div>

<div>
<h2>Skinparam</h2>
<div>You can use the <code><a href=skinparam.html>skinparam</a></code>
command to change colors and fonts for the drawing.
<p>
You can use this command :
<ul>
<li>In the diagram definition, like any other commands,</li>
<li>In an <a href=preprocessing.html>included file</a>,</li>
<li>In a configuration file, provided in the <a href=command_line.html>command line</a> or the <a href=ant_task.html>ANT task</a>.</li>
</ul>
You can define specific color and fonts for stereotyped actors and usecases.</div>
<pre>&#64;startuml
skinparam handwritten true

skinparam usecase {
	BackgroundColor DarkSeaGreen
	BorderColor DarkSlateGray

	BackgroundColor&lt;&lt; Main &gt;&gt; YellowGreen
	BorderColor&lt;&lt; Main &gt;&gt; YellowGreen
	
	ArrowColor Olive
	ActorBorderColor black
	ActorFontName Courier

	ActorBackgroundColor&lt;&lt; Human &gt;&gt; Gold
}

User &lt;&lt; Human &gt;&gt;
:Main Database: as MySql &lt;&lt; Application &gt;&gt;
(Start) &lt;&lt; One Shot &gt;&gt;
(Use the application) as (Use) &lt;&lt; Main &gt;&gt;

User -&gt; (Start)
User --&gt; (Use)

MySql --&gt; (Use)

@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/12-Skinparam.uml'>
</div>

<div>
<h2>Complete example</h2>
<pre>&#64;startuml
left to right direction
skinparam packageStyle rect
actor customer
actor clerk
rectangle checkout {
  customer -- (checkout)
  (checkout) .&gt; (payment) : include
  (help) .&gt; (checkout) : extends
  (checkout) -- clerk
}
@enduml
</pre>
<img src='${model.webapp}/uml/help/usecase/13-Complete+example.uml'>
</div>



</a:layout>
