<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Simple State</h2>
<div>You can use <code>[*]</code> for the starting point and ending point of
the state diagram.
<p>
Use <code>--&gt;</code> for arrows.</div>
<pre>&#64;startuml

[*] --&gt; State1
State1 --&gt; [*]
State1 : this is a string
State1 : this is another string

State1 -&gt; State2
State2 --&gt; [*]

@enduml
</pre>
<img src='${model.webapp}/uml/help/state/01-Simple+State.uml'>
</div>

<div>
<h2>Composite state</h2>
<div>A state can also be composite. You have to define it using the <code>state</code>
keywords and brackets.</div>
<pre>&#64;startuml
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
<img src='${model.webapp}/uml/help/state/02-Composite+state.uml'>
</div>

<div>
<h2>Long name</h2>
<div>You can also use the <code>state</code> keyword to use long description
for states.</div>
<pre>&#64;startuml
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
<img src='${model.webapp}/uml/help/state/03-Long+name.uml'>
</div>

<div>
<h2>Concurrent state</h2>
<div>You can define concurrent state into a composite state using either <code>--</code>
or <code>||</code> symbol as separator.</div>
<pre>&#64;startuml
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
<img src='${model.webapp}/uml/help/state/04-Concurrent+state.uml'>
</div>

<div>
<h2>Arrow direction</h2>
<div>You can use <code>-&gt;</code> for horizontal arrows. It is possible to
force arrow's direction using the following syntax:
<ul>
<li><code>-down-&gt;</code> (default arrow)</li>
<li><code>-right-&gt;</code> or <code>-&gt;</code></li>
<li><code>-left-&gt;</code></li>
<li><code>-up-&gt;</code></li>
</ul></div>
<pre>&#64;startuml

[*] -up-&gt; First
First -right-&gt; Second
Second --&gt; Third
Third -left-&gt; Last

@enduml
</pre>
<img src='${model.webapp}/uml/help/state/05-Arrow+direction.uml'>
</div>

<div>
<h2>Note</h2>
<div>You can also define notes using
<code>note left of</code>, <code>note
right of</code>, <code>note top of</code>, <code>note bottom of</code>
keywords.
<p>
You can also define notes on several lines.</div>
<pre>&#64;startuml

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
<img src='${model.webapp}/uml/help/state/06-Note.uml'>
</div>

<div>
<h2>More in notes</h2>
<div>You can put notes on composite states.</div>
<pre>&#64;startuml

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
<img src='${model.webapp}/uml/help/state/07-More+in+notes.uml'>
</div>

<div>
<h2>Skinparam</h2>
<div>You can use the <code><a href=skinparam.html>skinparam</a></code> command to change colors and fonts for the drawing.
<p>
You can use this command :
<ul>
<li>In the diagram definition, like any other commands,
<li>In an <a href=preprocessing.html>included file</a>,
<li>In a configuration file, provided in the <a href=command_line.html>command line</a> or the <a href=ant_task.html>ANT task</a>.
</ul>
You can define specific color and fonts for stereotyped states.</div>
<pre>&#64;startuml
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
<img src='${model.webapp}/uml/help/state/08-Skinparam.uml'>
</div>



</a:layout>
