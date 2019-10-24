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
<h1>Use Case Diagram
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
<h2>Usecases
</h2>
<p>
</p>Use cases are enclosed using between parentheses (because two parentheses looks like an oval).
<p>You can also use the 
<code>usecase
</code> keyword to define a usecase. And you can define an alias, using the 
<code>as
</code> keyword. This alias will be used latter, when defining relations.
</p>
<div>
<div class="mycell">

<pre>@startuml

(First usecase)
(Another usecase) as (UC2)  
usecase UC3
usecase (Last\nusecase) as UC4

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-00.uml">
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
<h2>Actors
</h2>
<p>Actor are enclosed using between two points.
</p>
<p>You can also use the 
<code>actor
</code> keyword to define an actor. And you can define an alias, using the 
<code>as
</code> keyword. This alias will be used latter, when defining relations.
</p>
<p>We will see later that the actor definitions are optional.
</p>
<div>
<div class="mycell">

<pre>@startuml

:First Actor:
:Another\nactor: as Men2  
actor Men3
actor :Last actor: as Men4

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-01.uml">
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
<h2>Usecases description
</h2>
<p>
</p>
<p>If you want to have description on several lines, you can use quotes.
</p>
<p>You can also use the following separators: 
<code>--
</code>
<code>..
</code>
<code>==
</code>
<code>__
</code>. And you can put titles within the separators.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-02.uml">
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
<h2>Basic example
</h2>
<p>
</p>
<p>To link actors and use cases, the arrow 
<code>--&gt;
</code> is used.
</p>
<p>The more dashes 
<code>-
</code> in the arrow, the longer the arrow. You can add a label on the arrow, by adding a 
<code>:
</code> character in the arrow definition.
</p>
<p>In this example, you see that 
<em>User
</em> has not been defined before, and is used as an actor.
</p>
<div>
<div class="mycell">

<pre>@startuml

User -&gt; (Start)
User --&gt; (Use the application) : A small label

:Main Admin: ---&gt; (Use the application) : This is\nyet another\nlabel

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-03.uml">
</div>
</div>
<p>
</p>
<p>
<a id="6">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Extension
</h2>
<p>If one actor/use case extends another one, you can use the symbol 
<code>&lt;|--
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:Main Admin: as Admin
(Use the application) as (Use)

User &lt;|-- Admin
(Start) &lt;|-- (Use)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-04.uml">
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
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-05.uml">
</div>
</div>
<p>
<a id="8">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Stereotypes
</h2>
<p>You can add stereotypes while defining actors and use cases using 
<code>&lt;&lt;
</code> and 
<code>&gt;&gt;
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
User &lt;&lt; Human &gt;&gt;
:Main Database: as MySql &lt;&lt; Application &gt;&gt;
(Start) &lt;&lt; One Shot &gt;&gt;
(Use the application) as (Use) &lt;&lt; Main &gt;&gt;

User -&gt; (Start)
User --&gt; (Use)

MySql --&gt; (Use)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-06.uml">
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
<h2>Changing arrows direction
</h2>
<p>By default, links between classes have two dashes 
<code>--
</code> and are vertically oriented. It is possible to use horizontal link by putting a single dash (or dot) like this:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:user: --&gt; (Use case 1)
:user: -&gt; (Use case 2)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-07.uml">
</div>
</div>
<p>You can also change directions by reversing the link:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
(Use case 1) &lt;.. :user:
(Use case 2) &lt;- :user:
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-08.uml">
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
:user: -left-&gt; (dummyLeft) 
:user: -right-&gt; (dummyRight) 
:user: -up-&gt; (dummyUp)
:user: -down-&gt; (dummyDown)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-09.uml">
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
<a id="10">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Splitting diagrams
</h2>
<p>The 
<code>newpage
</code> keywords to split your diagram into several pages or images.
</p>
<div>
<div class="mycell">

<pre>@startuml
:actor1: --&gt; (Usecase1)
newpage
:actor2: --&gt; (Usecase2)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-10.uml">
</div>
</div>
<p>
<a id="11">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Left to right direction
</h2>
<p>The general default behavior when building diagram is 
<strong>top to bottom
</strong>.
</p>
<div>
<div class="mycell">

<pre>@startuml
'default
top to bottom direction
user1 --&gt; (Usecase 1)
user2 --&gt; (Usecase 2)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-11.uml">
</div>
</div>You may change to 
<strong>left to right
</strong> using the 
<code>left to right direction
</code> command. The result is often better with this direction.
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

left to right direction
user1 --&gt; (Usecase 1)
user2 --&gt; (Usecase 2)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-12.uml">
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
<li>In a configuration file, provided in 
<a href="command-line">the command line
</a> or 
<a href="ant-task">the ANT task
</a>.
</li>
</ul>
<p>You can define specific color and fonts for stereotyped actors and usecases.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-13.uml">
</div>
</div>
<p>
<a id="13">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Complete example
</h2>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
left to right direction
skinparam packageStyle rectangle
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
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-14.uml">
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
