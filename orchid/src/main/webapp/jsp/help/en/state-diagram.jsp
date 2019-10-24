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
<h1>State Diagram
</h1>
<p>
<a href="https://en.wikipedia.org/wiki/State_diagram">State diagrams
</a> are used to give an abstract description of the behavior of a system. This behavior is represented as a series of events that can occur in one or more possible states.
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Simple State
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>You can use 
<code>[*]
</code> for the starting point and ending point of the state diagram.
<p>Use 
<code>--&gt;
</code> for arrows.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] --&gt; State1
State1 --&gt; [*]
State1 : this is a string
State1 : this is another string

State1 -&gt; State2
State2 --&gt; [*]

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-00.uml">
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
<h2>Change state rendering
</h2>
<p>You can use 
<code>hide empty description
</code> to render state as simple box.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
hide empty description
[*] --&gt; State1
State1 --&gt; [*]
State1 : this is a string
State1 : this is another string

State1 -&gt; State2
State2 --&gt; [*]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-01.uml">
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
<h2>Composite state
</h2>
<p>
</p>
<p>A state can also be composite. You have to define it using the 
<code>state
</code> keywords and brackets.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
scale 350 width
[*] --&gt; NotShooting

state NotShooting {
  [*] --&gt; Idle
  Idle --&gt; Configuring : EvConfig
  Configuring --&gt; Idle : EvConfig
}

state Configuring {
  [*] --&gt; NewValueSelection
  NewValueSelection --&gt; NewValuePreview : EvNewValue
  NewValuePreview --&gt; NewValueSelection : EvNewValueRejected
  NewValuePreview --&gt; NewValueSelection : EvNewValueSaved
  
  state NewValuePreview {
	 State1 -&gt; State2
  }
  
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-02.uml">
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
<h2>Long name
</h2>
<p>
</p>
<p>You can also use the 
<code>state
</code> keyword to use long description for states.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
scale 600 width

[*] -&gt; State1
State1 --&gt; State2 : Succeeded
State1 --&gt; [*] : Aborted
State2 --&gt; State3 : Succeeded
State2 --&gt; [*] : Aborted
state State3 {
  state &quot;Accumulate Enough Data\nLong State Name&quot; as long1
  long1 : Just a test
  [*] --&gt; long1
  long1 --&gt; long1 : New Data
  long1 --&gt; ProcessData : Enough Data
}
State3 --&gt; State3 : Failed
State3 --&gt; [*] : Succeeded / Save Result
State3 --&gt; [*] : Aborted
 
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-03.uml">
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
<h2>Fork
</h2>
<p>
</p>
<p>You can also fork and join using the 
<code>&lt;&lt;fork&gt;&gt;
</code> and 
<code>&lt;&lt;join&gt;&gt;
</code> stereotypes.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

state fork_state &lt;&lt;fork&gt;&gt;
[*] --&gt; fork_state
fork_state --&gt; State2
fork_state --&gt; State3

state join_state &lt;&lt;join&gt;&gt;
State2 --&gt; join_state
State3 --&gt; join_state
join_state --&gt; State4
State4 --&gt; [*]

@enduml


</pre>
<p>
</p>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-04.uml">
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
<h2>Concurrent state
</h2>
<p>
</p>
<p>You can define concurrent state into a composite state using either 
<code>--
</code> or 
<code>||
</code> symbol as separator.
</p>
<div>
<div class="mycell">

<pre>@startuml
[*] --&gt; Active

state Active {
  [*] -&gt; NumLockOff
  NumLockOff --&gt; NumLockOn : EvNumLockPressed
  NumLockOn --&gt; NumLockOff : EvNumLockPressed
  --
  [*] -&gt; CapsLockOff
  CapsLockOff --&gt; CapsLockOn : EvCapsLockPressed
  CapsLockOn --&gt; CapsLockOff : EvCapsLockPressed
  --
  [*] -&gt; ScrollLockOff
  ScrollLockOff --&gt; ScrollLockOn : EvCapsLockPressed
  ScrollLockOn --&gt; ScrollLockOff : EvCapsLockPressed
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-05.uml">
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
<h2>Arrow direction
</h2>
<p>You can use 
<code>-&gt;
</code> for horizontal arrows. It is possible to force arrow's direction using the following syntax:
</p>
<ul>
<li>
<code>-down-&gt;
</code> (default arrow)
</li>
<li>
<code>-right-&gt;
</code> or 
<code>-&gt;
</code>
</li>
<li>
<code>-left-&gt;
</code>
</li>
<li>
<code>-up-&gt;
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] -up-&gt; First
First -right-&gt; Second
Second --&gt; Third
Third -left-&gt; Last

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-06.uml">
</div>
</div>You can shorten the arrow by using only the first character of the direction (for example, 
<code>-d-
</code> instead of 
<code>-down-
</code>) or the two first characters (
<code>-do-
</code>).
<p>Please note that you should not abuse this functionality : 
<em>Graphviz
</em> gives usually good results without tweaking.
</p>
<p>
<a id="9">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Note
</h2>
<p>You can also define notes using 
<code>note left of
</code>, 
<code>note right of
</code>, 
<code>note top of
</code>, 
<code>note bottom of
</code> keywords.
</p>
<p>You can also define notes on several lines.
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] --&gt; Active
Active --&gt; Inactive

note left of Active : this is a short\nnote

note right of Inactive
  A note can also
  be defined on
  several lines
end note

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-07.uml">
</div>
</div>
<p>
</p>
<p>You can also have floating notes.
</p>
<div>
<div class="mycell">

<pre>@startuml

state foo
note &quot;This is a floating note&quot; as N1

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-08.uml">
</div>
</div>
<p>
<a id="10">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>More in notes
</h2>
<p>
</p>
<p>You can put notes on composite states.
</p>
<div>
<div class="mycell">

<pre>@startuml

[*] --&gt; NotShooting

state &quot;Not Shooting State&quot; as NotShooting {
  state &quot;Idle mode&quot; as Idle
  state &quot;Configuring mode&quot; as Configuring
  [*] --&gt; Idle
  Idle --&gt; Configuring : EvConfig
  Configuring --&gt; Idle : EvConfig
}

note right of NotShooting : This is a note on a composite state

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-09.uml">
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
<li>In a configuration file, provided in the 
<a href="command-line">command line
</a> or the 
<a href="ant-task">ANT task
</a>.
</li>
</ul>You can define specific color and fonts for stereotyped states.
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam backgroundColor LightYellow
skinparam state {
  StartColor MediumBlue
  EndColor Red
  BackgroundColor Peru
  BackgroundColor&lt;&lt;Warning&gt;&gt; Olive
  BorderColor Gray
  FontName Impact
}

[*] --&gt; NotShooting

state &quot;Not Shooting State&quot; as NotShooting {
  state &quot;Idle mode&quot; as Idle &lt;&lt;Warning&gt;&gt;
  state &quot;Configuring mode&quot; as Configuring
  [*] --&gt; Idle
  Idle --&gt; Configuring : EvConfig
  Configuring --&gt; Idle : EvConfig
}

NotShooting --&gt; [*]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/state-diagram/state-diagram-10.uml">
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
