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
<h1>Sequence Diagram
</h1>
<a id="2">
</a>
<p> 
</p>
<p> 
</p>
<h2>Basic examples
</h2>
<p>
</p>The sequence 
<code>-&gt;
</code> is used to draw a message between two participants. Participants do not have to be explicitly declared.
<p>To have a dotted arrow, you use 
<code>--&gt;
</code>
</p>
<p>It is also possible to use 
<code>&lt;-
</code> and 
<code>&lt;--
</code>. That does not change the drawing, but may improve readability. Note that this is only true for sequence diagrams, rules are different for the other diagrams.
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

Alice -&gt; Bob: Another authentication Request
Alice &lt;-- Bob: Another authentication Response
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-00.uml">
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
<h2>Declaring participant
</h2>
<p>If the keyword 
<code>participant
</code> is used to declare a participant, more control on that participant is possible.
</p>
<p>The order of declaration will be the (default) 
<strong>order of display
</strong>.
</p>
<p>Using these other keywords to declare participants will 
<strong>change the shape
</strong> of the participant representation:
</p>
<ul>
<li>
<code>actor
</code>
</li>
<li>
<code>boundary
</code>
</li>
<li>
<code>control
</code>
</li>
<li>
<code>entity
</code>
</li>
<li>
<code>database
</code>
</li>
<li>
<code>collections
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
actor Foo1
boundary Foo2
control Foo3
entity Foo4
database Foo5
collections Foo6
Foo1 -&gt; Foo2 : To boundary
Foo1 -&gt; Foo3 : To control
Foo1 -&gt; Foo4 : To entity
Foo1 -&gt; Foo5 : To database
Foo1 -&gt; Foo6 : To collections

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-01.uml">
</div>
</div>
<p>Rename a participant using the 
<code>as
</code> keyword.
</p>
<p>You can also change the background 
<a href="color">color
</a> of actor or participant.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
actor Bob #red
' The only difference between actor
'and participant is the drawing
participant Alice
participant &quot;I have a really\nlong name&quot; as L #99FF99
/' You can also declare:
   participant L as &quot;I have a really\nlong name&quot;  #99FF99
  '/

Alice-&gt;Bob: Authentication Request
Bob-&gt;Alice: Authentication Response
Bob-&gt;L: Log transaction
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-02.uml">
</div>
</div>
<p>You can use the 
<code>order
</code> keyword to customize the display order of participants.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
participant Last order 30
participant Middle order 20
participant First order 10
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-03.uml">
</div>
</div>
<p>
</p>
<p>
<a id="4">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Use non-letters in participants
</h2>
<p>
</p>
<p>You can use quotes to define participants. And you can use the 
<code>as
</code> keyword to give an alias to those participants.
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice -&gt; &quot;Bob()&quot; : Hello
&quot;Bob()&quot; -&gt; &quot;This is very\nlong&quot; as Long
' You can also declare:
' &quot;Bob()&quot; -&gt; Long as &quot;This is very\nlong&quot;
Long --&gt; &quot;Bob()&quot; : ok
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-04.uml">
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
<h2>Message to Self
</h2>
<p>A participant can send a message to itself.
</p>
<p>It is also possible to have multi-line using 
<code>\n
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice-&gt;Alice: This is a signal to self.\nIt also demonstrates\nmultiline \ntext
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-05.uml">
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
<h2>Change arrow style
</h2>
<p>You can change arrow style by several ways:
</p>
<ul>
<li>add a final 
<code>x
</code> to denote a lost message
</li>
<li>use 
<code>\
</code> or 
<code>/
</code> instead of 
<code>&lt;
</code> or 
<code>&gt;
</code> to have only the bottom or top part of the arrow
</li>
<li>repeat the arrow head (for example, 
<code>&gt;&gt;
</code> or 
<code>//
</code>) head to have a thin drawing
</li>
<li>use 
<code>--
</code> instead of 
<code>-
</code> to have a dotted arrow
</li>
<li>add a final "o" at arrow head
</li>
<li>use bidirectional arrow 
<code>&lt;-&gt;
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-06.uml">
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
<h2>Change arrow color
</h2>
<p>You can change the color of individual arrows using the following notation:
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -[#red]&gt; Alice : hello
Alice -[#0000FF]-&gt;Bob : ok
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-07.uml">
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
<h2>Message sequence numbering
</h2>
<p>
</p>
<p>The keyword 
<code>autonumber
</code> is used to automatically add number to messages.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-08.uml">
</div>
</div>
<p>You can specify a startnumber with 
<code>autonumber 
&lt;em&gt;start
&lt;/em&gt;
</code> , and also an increment with 
<code>autonumber 
&lt;em&gt;start
&lt;/em&gt;
&lt;em&gt;increment
&lt;/em&gt;
</code>.
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response

autonumber 15
Bob -&gt; Alice : Another authentication Request
Bob &lt;- Alice : Another authentication Response

autonumber 40 10
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-09.uml">
</div>
</div>
<p>
</p>
<p>You can specify a format for your number by using between double-quote.
</p>
<p>The formatting is done with the Java class 
<code>DecimalFormat
</code> (
<code>0
</code> means digit, 
<code>#
</code> means digit and zero if absent).
</p>
<p>You can use some html tag in the format.
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber &quot;&lt;b&gt;[000]&quot;
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response

autonumber 15 &quot;&lt;b&gt;(&lt;u&gt;##&lt;/u&gt;)&quot;
Bob -&gt; Alice : Another authentication Request
Bob &lt;- Alice : Another authentication Response

autonumber 40 10 &quot;&lt;font color=red&gt;&lt;b&gt;Message 0  &quot;
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-10.uml">
</div>
</div>
<p>You can also use 
<code>autonumber stop
</code> and 
<code>autonumber resume 
&lt;em&gt;increment
&lt;/em&gt;
&lt;em&gt;format
&lt;/em&gt;
</code> to respectively pause and resume automatic numbering.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber 10 10 &quot;&lt;b&gt;[000]&quot;
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response

autonumber stop
Bob -&gt; Alice : dummy

autonumber resume &quot;&lt;font color=red&gt;&lt;b&gt;Message 0  &quot;
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response

autonumber stop
Bob -&gt; Alice : dummy

autonumber resume 1 &quot;&lt;font color=blue&gt;&lt;b&gt;Message 0  &quot;
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-11.uml">
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
<h2>Page Title, Header and Footer
</h2>
<p>The 
<code>title
</code> keyword is used to add a title to the page.
</p>
<p>Pages can display headers and footers using 
<code>header
</code> and 
<code>footer
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

header Page Header
footer Page %page% of %lastpage%

title Example Title

Alice -&gt; Bob : message 1
Alice -&gt; Bob : message 2

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-12.uml">
</div>
</div>
<p>
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
<p>
</p>
<p>The 
<code>newpage
</code> keyword is used to split a diagram into several images.
</p>
<p>You can put a title for the new page just after the 
<code>newpage
</code> keyword. This title overrides the previously specified title if any.
</p>
<p>This is very handy with 
<em>Word
</em> to print long diagram on several pages.
</p>
<p>(Note: this really does work. Only the first page is shown below, but it is a display artifact.)
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-13.uml">
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
<h2>Grouping message
</h2>
<p>
</p>
<p>It is possible to group messages together using the following keywords:
</p>
<ul>
<li>
<code>alt/else
</code>
</li>
<li>
<code>opt
</code>
</li>
<li>
<code>loop
</code>
</li>
<li>
<code>par
</code>
</li>
<li>
<code>break
</code>
</li>
<li>
<code>critical
</code>
</li>
<li>
<code>group
</code>, followed by a text to be displayed
</li>
</ul>
<p>
</p>
<p>It is possible a add a text that will be displayed into the header (except for 
<code>group
</code>).
</p>
<p>The 
<code>end
</code> keyword is used to close the group.
</p>
<p>Note that it is possible to nest groups.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-14.uml">
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
<h2>Notes on messages
</h2>
<p>It is possible to put notes on message using the 
<code>note left
</code> or 
<code>note right
</code> keywords 
<em>just after the message
</em>.
</p>
<p>You can have a multi-line note using the 
<code>end note
</code> keywords.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-15.uml">
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
<h2>Some other notes
</h2>
<p>
</p>
<p>It is also possible to place notes relative to participant with 
<code>note left of
</code> , 
<code>note right of
</code> or 
<code>note over
</code> keywords.
</p>
<p>
</p>
<p>It is possible to highlight a note by changing its background 
<a href="color">color
</a>.
</p>
<p>You can also have a multi-line note using the 
<code>end note
</code> keywords.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-16.uml">
</div>
</div>
<p>
<a id="14">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Changing notes shape
</h2>
<p>You can use 
<code>hnote
</code> and 
<code>rnote
</code> keywords to change note shapes.
</p>
<div>
<div class="mycell">

<pre>@startuml
caller -&gt; server : conReq
hnote over caller : idle
caller &lt;- server : conConf
rnote over server
 &quot;r&quot; as rectangle
 &quot;h&quot; as hexagon
endrnote
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-17.uml">
</div>
</div>
<p>
<a id="15">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Creole and HTML
</h2>
<p>
<a href="creole">It is also possible to use creole formatting:
</a>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-18.uml">
</div>
</div>
<p>
<a id="16">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Divider
</h2>
<p>
</p>
<p>If you want, you can split a diagram using 
<code>==
</code> separator to divide your diagram into logical steps.
</p>
<div>
<div class="mycell">

<pre>@startuml

== Initialization ==

Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

== Repetition ==

Alice -&gt; Bob: Another authentication Request
Alice &lt;-- Bob: another authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-19.uml">
</div>
</div>
<p>
<a id="17">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Reference
</h2>
<p>You can use reference in a diagram, using the keyword 
<code>ref over
</code>.
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-20.uml">
</div>
</div>
<p>
<a id="18">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Delay
</h2>
<p>You can use 
<code>...
</code> to indicate a delay in the diagram. And it is also possible to put a message with this delay.
</p>
<div>
<div class="mycell">

<pre>@startuml

Alice -&gt; Bob: Authentication Request
...
Bob --&gt; Alice: Authentication Response
...5 minutes later...
Bob --&gt; Alice: Bye !

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-21.uml">
</div>
</div>
<p>
<a id="19">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Space
</h2>
<p>
</p>
<p>You can use 
<code>|||
</code> to indicate some spacing in the diagram.
</p>
<p>It is also possible to specify a number of pixel to be used.
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-22.uml">
</div>
</div>
<p>
<a id="20">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Lifeline Activation and Destruction
</h2>
<p>The 
<code>activate
</code> and 
<code>deactivate
</code> are used to denote participant activation.
</p>
<p>Once a participant is activated, its lifeline appears.
</p>
<p>The 
<code>activate
</code> and 
<code>deactivate
</code> apply on the previous message.
</p>
<p>The 
<code>destroy
</code> denote the end of the lifeline of a participant.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-23.uml">
</div>
</div>
<p>
</p>
<p>Nested lifeline can be used, and it is possible to add a 
<a href="color">color
</a> on the lifeline.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
participant User

User -&gt; A: DoWork
activate A #FFBBBB

A -&gt; A: Internal call
activate A #DarkSalmon

A -&gt; B: &lt;&lt; createRequest &gt;&gt;
activate B

B --&gt; A: RequestCreated
deactivate B
deactivate A
A -&gt; User: Done
deactivate A

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-24.uml">
</div>
</div>
<p>Autoactivation is possible and works with the return keywords:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
autoactivate on
alice -&gt; bob : hello
bob -&gt; bob : self call
bill -&gt; bob #005500 : hello from thread 2
bob -&gt; george ** : create
return done in thread 2
return rc
bob -&gt; george !! : delete
return success
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-25.uml">
</div>
</div>
<p>
<a id="21">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Return
</h2>
<p>Command 
<code>return
</code> generates a return message with optional text label.
</p>
<p>The return point is that which caused the most recent life-line activation.
</p>
<p>The syntax is 
<code>return label
</code> where 
<code>label
</code> if provided is any string acceptable for conventional messages.
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -&gt; Alice : hello
activate Alice
Alice -&gt; Alice : some action
return bye
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-26.uml">
</div>
</div>
<p>
<a id="22">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Participant creation
</h2>
<p>
</p>
<p>You can use the 
<code>create
</code> keyword just before the first reception of a message to emphasize the fact that this message is actually 
<em>creating
</em> this new object.
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -&gt; Alice : hello

create Other
Alice -&gt; Other : new

create control String
Alice -&gt; String
note right : You can also put notes!

Alice --&gt; Bob : ok

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-27.uml">
</div>
</div>
<p>
<a id="23">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Shortcut syntax for activation, deactivation, creation
</h2>
<p>
</p>
<p>Immediately after specifying the target participant, the following syntax can be used:
</p>
<p>
</p>
<ul>
<li>
<code>++
</code> Activate the target (optionally a #color may follow this)
</li>
<li>
<code>--
</code> Deactivate the source
</li>
<li>
<code>**
</code> Create an instance of the target
</li>
<li>
<code>!!
</code> Destroy an instance of the target
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
alice -&gt; bob ++ : hello
bob -&gt; bob ++ : self call
bob -&gt; bib ++  #005500 : hello
bob -&gt; george ** : create
return done
return rc
bob -&gt; george !! : delete
return success
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-28.uml">
</div>
</div>
<p>
<a id="24">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Incoming and outgoing messages
</h2>
<p>You can use incoming or outgoing arrows if you want to focus on a part of the diagram.
</p>
<p>Use square brackets to denote the left "
<code>[
</code>" or the right "
<code>]
</code>" side of the diagram.
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-29.uml">
</div>
</div>
<p>
</p>
<p>You can also have the following syntax:
</p>
<div>
<div class="mycell">

<pre>@startuml
[-&gt; Bob
[o-&gt; Bob
[o-&gt;o Bob
[x-&gt; Bob

[&lt;- Bob
[x&lt;- Bob

Bob -&gt;]
Bob -&gt;o]
Bob o-&gt;o]
Bob -&gt;x]

Bob &lt;-]
Bob x&lt;-]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-30.uml">
</div>
</div>
<p>
<a id="25">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Anchors and Duration
</h2>
<p>
</p>
<p>
</p>
<p>With 
<code>teoz
</code> usage it is possible to add anchors to the diagram and use the anchors to specify duration time.
</p>
<div>
<div class="mycell">

<pre>@startuml
!pragma teoz true

{start} Alice -&gt; Bob : start doing things during duration
Bob -&gt; Max : something
Max -&gt; Bob : something else
{end} Bob -&gt; Alice : finish

{start} &lt;-&gt; {end} : some time

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-31.uml">
</div>
</div>
<p>
<a id="26">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Stereotypes and Spots
</h2>
<p>
</p>
<p>
</p>
<p>It is possible to add stereotypes to participants using 
<code>&lt;&lt;
</code> and 
<code>&gt;&gt;
</code>.
</p>
<p>In the stereotype, you can add a spotted character in a colored circle using the syntax 
<code>(X,color)
</code>.
</p>
<div>
<div class="mycell">

<pre>@startuml

participant &quot;Famous Bob&quot; as Bob &lt;&lt; Generated &gt;&gt;
participant Alice &lt;&lt; (C,#ADD1B2) Testable &gt;&gt;

Bob-&gt;Alice: First message

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-32.uml">
</div>
</div>
<p>By default, the 
<em>guillemet
</em> character is used to display the stereotype. You can change this behavious using the skinparam 
<code>guillemet
</code>:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

skinparam guillemet false
participant &quot;Famous Bob&quot; as Bob &lt;&lt; Generated &gt;&gt;
participant Alice &lt;&lt; (C,#ADD1B2) Testable &gt;&gt;

Bob-&gt;Alice: First message

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-33.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

participant Bob &lt;&lt; (C,#ADD1B2) &gt;&gt;
participant Alice &lt;&lt; (C,#ADD1B2) &gt;&gt;

Bob-&gt;Alice: First message

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-34.uml">
</div>
</div>
<p>
<a id="27">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>More information on titles
</h2>
<p>You can use 
<a href="creole">creole formatting
</a> in the title.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

title __Simple__ **communication** example

Alice -&gt; Bob: Authentication Request
Bob -&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-35.uml">
</div>
</div>You can add newline using 
<code>\n
</code> in the title description.
<div>
<div class="mycell">

<pre>@startuml

title __Simple__ communication example\non several lines

Alice -&gt; Bob: Authentication Request
Bob -&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-36.uml">
</div>
</div>You can also define title on several lines using 
<code>title
</code> and 
<code>end title
</code> keywords.
<div>
<div class="mycell">

<pre>@startuml

title
 &lt;u&gt;Simple&lt;/u&gt; communication example
 on &lt;i&gt;several&lt;/i&gt; lines and using &lt;font color=red&gt;html&lt;/font&gt;
 This is hosted by &lt;img:sourceforge.jpg&gt;
end title

Alice -&gt; Bob: Authentication Request
Bob -&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-37.uml">
</div>
</div>
<p>
<a id="28">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Participants encompass
</h2>
<p>
</p>
<p>
</p>
<p>It is possible to draw a box around some participants, using 
<code>box
</code> and 
<code>end box
</code> commands.
</p>
<p>You can add an optional title or a optional background color, after the 
<code>box
</code> keyword.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

box &quot;Internal Service&quot; #LightBlue
	participant Bob
	participant Alice
end box
participant Other

Bob -&gt; Alice : hello
Alice -&gt; Other : hello

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-38.uml">
</div>
</div>
<p>
<a id="29">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Removing Foot Boxes
</h2>
<p>You can use the 
<code>hide footbox
</code> keywords to remove the foot boxes of the diagram.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

hide footbox
title Foot Box removed

Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-39.uml">
</div>
</div>
<p>
<a id="30">
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
<p>
</p>
<p>You can use this command:
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
<p>You can also change other rendering parameter, as seen in the following examples:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam sequenceArrowThickness 2
skinparam roundcorner 20
skinparam maxmessagesize 60
skinparam sequenceParticipant underline

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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-40.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam backgroundColor #EEEBDC
skinparam handwritten true

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
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-41.uml">
</div>
</div>
<p>
</p>
<p>
<a id="31">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Changing padding
</h2>
<p>
</p>
<p>It is possible to tune some padding settings.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam ParticipantPadding 20
skinparam BoxPadding 10

box &quot;Foo1&quot;
participant Alice1
participant Alice2
end box
box &quot;Foo2&quot;
participant Bob1
participant Bob2
end box
Alice1 -&gt; Bob1 : hello
Alice1 -&gt; Out : out
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-42.uml">
</div>
</div>
<p>
</p>
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
