<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Basic examples</h2>
<div>The sequence <code>-&gt;</code> is used to draw a message between two
participants.
Participants do not have to be explicitly declared.
<p>
To have a dotted arrow, you use <code>--&gt;</code>
<p>
It is also possible to use <code>&lt;-</code> and <code>&lt;--</code>.
That does not change the drawing, but may improve readability.
Note that this is only true for sequence diagrams, rules are different for the other diagrams.</div>
<pre>&#64;startuml
Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

Alice -&gt; Bob: Another authentication Request
Alice &lt;-- Bob: another authentication Response
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/01-Basic+examples.uml'>
</div>

<div>
<h2>Declaring participant</h2>
<div>It is possible to change participant order using the <code>participant</code>
keyword.
<p>
It is also possible to use other keywords to declare a participant:
<ul>
<li><code>actor</code></li>
<li><code>boundary</code></li>
<li><code>control</code></li>
<li><code>entity</code></li>
<li><code>database</code></li>
</ul></div>
<pre>&#64;startuml
actor Foo1
boundary Foo2
control Foo3
entity Foo4
database Foo5
Foo1 -&gt; Foo2 : To boundary
Foo1 -&gt; Foo3 : To control
Foo1 -&gt; Foo4 : To entity
Foo1 -&gt; Foo5 : To database

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/02-Declaring+participant.uml'>
</div>

<div>
<h2>Use non-letters in participants</h2>
<div>You can use quotes to define participants.
And you can use the <code>as</code> keyword to give an alias to those participants.</div>
<pre>&#64;startuml
Alice -&gt; &quot;Bob()&quot; : Hello
&quot;Bob()&quot; -&gt; &quot;This is very\nlong&quot; as Long
' You can also declare:
' &quot;Bob()&quot; -&gt; Long as &quot;This is very\nlong&quot;
Long --&gt; &quot;Bob()&quot; : ok
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/03-Use+non-letters+in+participants.uml'>
</div>

<div>
<h2>Message to Self</h2>
<div>A participant can send a message to itself.
<p>
It is also possible to have multi-line using <code>\n</code>.</div>
<pre>&#64;startuml
Alice-&gt;Alice: This is a signal to self.\nIt also demonstrates\nmultiline \ntext
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/04-Message+to+Self.uml'>
</div>

<div>
<h2>Change arrow style</h2>
<div>You can change arrow style by several ways:
<ul>
<li>add a final <code>x</code> to denote a lost message
<li>use <code>\</code> or <code>/</code> instead of <code>&lt;</code> or <code>&gt;</code> to
have only the bottom or top part of the arrow
<li>repeat the arrow head (for example, <code>&gt;&gt;</code> or <code>//</code>) head to have a thin drawing
<li>use <code>--</code> instead of <code>-</code> to have a dotted arrow
<li>add a final "o" at arrow head
<li>use bidirectional arrow
</ul></div>
<pre>&#64;startuml
Bob -&gt;x Alice
Bob -&gt; Alice
Bob -&gt;&gt; Alice
Bob -\ Alice
Bob \\- Alice
Bob //-- Alice

Bob -&gt;o Alice
Bob o\\-- Alice

Bob &lt;-&gt; Alice
Bob &lt;-&gt;o Alice
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/05-Change+arrow+style.uml'>
</div>

<div>
<h2>Change arrow color</h2>
<div>You can change the color of individual arrows using the following notation:</div>
<pre>&#64;startuml
Bob -[#red]&gt; Alice : hello
Alice -[#0000FF]-&gt;Bob : ok
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/06-Change+arrow+color.uml'>
</div>

<div>
<h2>Message sequence numbering</h2>
<div>The keyword <code>autonumber</code> is used to
automatically add number to messages.</div>
<pre>&#64;startuml
autonumber
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/07-Message+sequence+numbering.uml'>
</div>

<div>
<h2>Title</h2>
<div>The <code>title</code> keywords is used to put a title.</div>
<pre>&#64;startuml

title Simple communication example

Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/08-Title.uml'>
</div>

<div>
<h2>Legend the diagram</h2>
<div>The <code>legend</code> and <code>end legend</code> are keywords is used to put a legend.
<p>
You can optionally specify to have <code>left</code>, <code>right</code> or <code>center</code>
alignment for the legend.</div>
<pre>&#64;startuml

Alice -&gt; Bob : Hello
legend right
  Short
  legend
endlegend

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/09-Legend+the+diagram.uml'>
</div>

<div>
<h2>Splitting diagrams</h2>
<div>The <code>newpage</code> keyword is used to split a diagram into several images.
<p>
You can put a title for the new page just after the <code>newpage</code>
keyword.
<p>
This is very handy with <i>Word</i> to print long diagram on
several pages.</div>
<pre>&#64;startuml

Alice -&gt; Bob : message 1
Alice -&gt; Bob : message 2

newpage

Alice -&gt; Bob : message 3
Alice -&gt; Bob : message 4

newpage A title for the\nlast page

Alice -&gt; Bob : message 5
Alice -&gt; Bob : message 6
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/10-Splitting+diagrams.uml'>
</div>

<div>
<h2>Grouping message</h2>
<div><p>
It is possible to group messages together using the following
keywords:
<ul>
<li><code>alt/else</code></li>
<li><code>opt</code></li>
<li><code>loop</code></li>
<li><code>par</code></li>
<li><code>break</code></li>
<li><code>critical</code></li>
<li><code>group</code>, followed by a text to be displayed</li>
</ul>
<p>
It is possible a add a text that will be displayed into the
header (except for <code>group</code>).
<p>
The <code>end</code> keyword is used to close the group.
<p>
Note that it is possible to nest groups.</div>
<pre>&#64;startuml
Alice -&gt; Bob: Authentication Request

alt successful case

    Bob -&gt; Alice: Authentication Accepted
    
else some kind of failure

    Bob -&gt; Alice: Authentication Failure
    group My own label
    	Alice -&gt; Log : Log attack start
        loop 1000 times
            Alice -&gt; Bob: DNS Attack
        end
    	Alice -&gt; Log : Log attack end
    end
    
else Another type of failure

   Bob -&gt; Alice: Please repeat
   
end
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/11-Grouping+message.uml'>
</div>

<div>
<h2>Notes on messages</h2>
<div>It is possible to put notes on message using the <code>note left</code>
or <code>note right</code> keywords <i>just after the message</i>.
<p>
You can have a multi-line note using the <code>end note</code>
keywords.</div>
<pre>&#64;startuml
Alice-&gt;Bob : hello
note left: this is a first note

Bob-&gt;Alice : ok
note right: this is another note

Bob-&gt;Bob : I am thinking
note left
	a note
	can also be defined
	on several lines
end note
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/12-Notes+on+messages.uml'>
</div>

<div>
<h2>Some other notes</h2>
<div>It is also possible to place notes relative to participant with
<code>note left of</code> , <code>note right of</code> or <code>note over</code> keywords.
<p>
It is possible to highlight a note by changing its background
<a href=http://www.w3schools.com/HTML/html_colornames.asp>color</a>.
<p>
You can also have a multi-line note using the <code>end note</code>
keywords.</div>
<pre>&#64;startuml
participant Alice
participant Bob
note left of Alice #aqua
	This is displayed 
	left of Alice. 
end note
 
note right of Alice: This is displayed right of Alice.

note over Alice: This is displayed over Alice.

note over Alice, Bob #FFAAAA: This is displayed\n over Bob and Alice.

note over Bob, Alice
	This is yet another
	example of
	a long note.
end note
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/13-Some+other+notes.uml'>
</div>

<div>
<h2>Changing notes shape</h2>
<div>You can use <code>hnote</code> and <code>rnote</code> keywords
to change note shapes.</div>
<pre>&#64;startuml
caller -&gt; server : conReq
hnote over caller : idle
caller &lt;- server : conConf
rnote over server
 &quot;r&quot; as rectangle
 &quot;h&quot; as hexagon
endrnote
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/14-Changing+notes+shape.uml'>
</div>

<div>
<h2>Creole and HTML</h2>
<div><a href="creole.html">It is also possible to use creole formatting:</a></div>
<pre>&#64;startuml
participant Alice
participant &quot;The **Famous** Bob&quot; as Bob

Alice -&gt; Bob : hello --there--
... Some ~~long delay~~ ...
Bob -&gt; Alice : ok
note left
  This is **bold**
  This is //italics//
  This is &quot;&quot;monospaced&quot;&quot;
  This is --stroked--
  This is __underlined__
  This is ~~waved~~
end note

Alice -&gt; Bob : A //well formatted// message
note right of Alice 
 This is &lt;back:cadetblue&gt;&lt;size:18&gt;displayed&lt;/size&gt;&lt;/back&gt; 
 __left of__ Alice. 
end note
note left of Bob 
 &lt;u:red&gt;This&lt;/u&gt; is &lt;color #118888&gt;displayed&lt;/color&gt; 
 **&lt;color purple&gt;left of&lt;/color&gt; &lt;s:red&gt;Alice&lt;/strike&gt; Bob**. 
end note
note over Alice, Bob
 &lt;w:#FF33FF&gt;This is hosted&lt;/w&gt; by &lt;img sourceforge.jpg&gt;
end note 
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/15-Creole+and+HTML.uml'>
</div>

<div>
<h2>Divider</h2>
<div>If you want, you can split a diagram using <code>==</code> separator to
divide your diagram into logical steps.</div>
<pre>&#64;startuml

== Initialization ==

Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

== Repetition ==

Alice -&gt; Bob: Another authentication Request
Alice &lt;-- Bob: another authentication Response

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/16-Divider.uml'>
</div>

<div>
<h2>Reference</h2>
<div>You can use reference in a diagram, using the keyword <code>ref over</code>.</div>
<pre>&#64;startuml
participant Alice
actor Bob

ref over Alice, Bob : init

Alice -&gt; Bob : hello

ref over Bob
  This can be on
  several lines
end ref
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/17-Reference.uml'>
</div>

<div>
<h2>Delay</h2>
<div>You can use <code>...</code> to indicate a delay in the diagram.
And it is also possible to put a message with this delay.</div>
<pre>&#64;startuml

Alice -&gt; Bob: Authentication Request
...
Bob --&gt; Alice: Authentication Response
...5 minutes latter...
Bob --&gt; Alice: Bye !

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/18-Delay.uml'>
</div>

<div>
<h2>Space</h2>
<div>You can use <code>|||</code> to indicate some spacing in the diagram.
<br>
It is also possible to specify a number of pixel to be used.</div>
<pre>&#64;startuml

Alice -&gt; Bob: message 1
Bob --&gt; Alice: ok
|||
Alice -&gt; Bob: message 2
Bob --&gt; Alice: ok
||45||
Alice -&gt; Bob: message 3
Bob --&gt; Alice: ok

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/19-Space.uml'>
</div>

<div>
<h2>Lifeline Activation and Destruction</h2>
<div>The <code>activate</code> and <code>deactivate</code> are used to denote
participant activation.
<p>
Once a participant is activated, its lifeline appears.
<p>
The <code>activate</code> and <code>deactivate</code> apply on
the previous message.
<p>
The <code>destroy</code> denote the end of the lifeline of a
participant.</div>
<pre>&#64;startuml
participant User

User -&gt; A: DoWork
activate A

A -&gt; B: &lt;&lt; createRequest &gt;&gt;
activate B

B -&gt; C: DoWork
activate C
C --&gt; B: WorkDone
destroy C

B --&gt; A: RequestCreated
deactivate B

A -&gt; User: Done
deactivate A

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/20-Lifeline+Activation+and+Destruction.uml'>
</div>

<div>
<h2>Participant creation</h2>
<div>You can use the <code>create</code> keyword just before the first
reception of a message to emphasize the fact that this message is
actually <i>creating</i> this new object.</div>
<pre>&#64;startuml
Bob -&gt; Alice : hello

create Other
Alice -&gt; Other : new

create control String
Alice -&gt; String
note right : You can also put notes!

Alice --&gt; Bob : ok

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/21-Participant+creation.uml'>
</div>

<div>
<h2>Incoming and outgoing messages</h2>
<div>You can use incoming or outgoing arrows if you want to focus on a part
of the diagram.
<p>
Use square brackets to denote the left "<code>[</code>" or the
right "<code>]</code>" side of the diagram.</div>
<pre>&#64;startuml
[-&gt; A: DoWork

activate A

A -&gt; A: Internal call
activate A

A -&gt;] : &lt;&lt; createRequest &gt;&gt;

A&lt;--] : RequestCreated
deactivate A
[&lt;- A: Done
deactivate A
@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/22-Incoming+and+outgoing+messages.uml'>
</div>

<div>
<h2>Stereotypes and Spots</h2>
<div>It is possible to add stereotypes to participants using <code>&lt;&lt;</code>
and <code>&gt;&gt;</code>.
<p>
In the stereotype, you can add a spotted character
in a colored circle using the syntax <code>(X,color)</code>.</div>
<pre>&#64;startuml

participant &quot;Famous Bob&quot; as Bob &lt;&lt; Generated &gt;&gt;
participant Alice &lt;&lt; (C,#ADD1B2) Testable &gt;&gt;

Bob-&gt;Alice: First message

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/23-Stereotypes+and+Spots.uml'>
</div>

<div>
<h2>More information on titles</h2>
<div>You can use <a href=creole.html>creole formatting</a> in the title.</div>
<pre>&#64;startuml

title __Simple__ **communication** example

Alice -&gt; Bob: Authentication Request
Bob -&gt; Alice: Authentication Response

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/24-More+information+on+titles.uml'>
</div>

<div>
<h2>Participants encompass</h2>
<div>It is possible to draw a box around some participants, using <code>box</code>
and <code>end box</code> commands.
<p>
You can add an optional title or a
optional background color, after the <code>box</code> keyword.</div>
<pre>&#64;startuml

box &quot;Internal Service&quot; #LightBlue
	participant Bob
	participant Alice
end box
participant Other

Bob -&gt; Alice : hello
Alice -&gt; Other : hello

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/25-Participants+encompass.uml'>
</div>

<div>
<h2>Removing Footer</h2>
<div>You can use the <code>hide footbox</code> keywords to remove the footer
of the diagram.</div>
<pre>&#64;startuml

hide footbox
title Footer removed

Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/26-Removing+Footer.uml'>
</div>

<div>
<h2>Skinparam</h2>
<div>You can use the <code><a href=skinparam.html>skinparam</a></code>
command to change colors and fonts for the drawing.
<p>
You can use this command:
<ul>
<li>In the diagram definition, like any other commands,</li>
<li>In an <a href=preprocessing.html>included file</a>,</li>
<li>In a configuration file, provided in the
<a href=command_line.html>command line</a> or the <a href=ant_task.html>ANT task</a>.
</li>
</ul></div>
<pre>&#64;startuml
skinparam backgroundColor #EEEBDC

skinparam sequence {
	ArrowColor DeepSkyBlue
	ActorBorderColor DeepSkyBlue
	LifeLineBorderColor blue
	LifeLineBackgroundColor #A9DCDF
	
	ParticipantBorderColor DeepSkyBlue
	ParticipantBackgroundColor DodgerBlue
	ParticipantFontName Impact
	ParticipantFontSize 17
	ParticipantFontColor #A9DCDF
	
	ActorBackgroundColor aqua
	ActorFontColor DeepSkyBlue
	ActorFontSize 17
	ActorFontName Aapex
}

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

@enduml
</pre>
<img src='${model.webapp}/uml/help/sequence/27-Skinparam.uml'>
</div>



</a:layout>
