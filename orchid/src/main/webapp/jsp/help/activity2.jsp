<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Simple Activity</h2>
<div>Activities label starts with <code>:</code> and ends with <code>;</code>.
<p>
Text formatting can be done using <a href=creole.html>creole wiki syntax</a>.
<p>
They are implicitly linked in their definition order.</div>
<pre>&#64;startuml
:Hello world;
:This is on defined on
several **lines**;
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/01-Simple+Activity.uml'>
</div>

<div>
<h2>Start&Stop</h2>
<div>You can use <code>start</code> and <code>stop</code> keywords to denote the
beginning and the end of a diagram.</div>
<pre>&#64;startuml
start
:Hello world;
:This is on defined on
several **lines**;
stop
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/02-Start&Stop.uml'>
</div>

<div>
<h2>Conditional</h2>
<div>You can use <code>if</code>, <code>then</code> and <code>else</code> keywords to put tests if your diagram.
Labels can be provided using parentheses.</div>
<pre>&#64;startuml

start

if (Graphviz installed?) then (yes)
  :process all\ndiagrams;
else (no)
  :process only
  __sequence__ and __activity__ diagrams;
endif

stop

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/03-Conditional.uml'>
</div>

<div>
<h2>Repeat loop</h2>
<div>You can use <code>repeat</code> and <code>repeatwhile</code> keywords to have repeat loops.</div>
<pre>&#64;startuml

start

repeat
  :read data;
  :generate diagrams;
repeat while (more data?)

stop

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/04-Repeat+loop.uml'>
</div>

<div>
<h2>While loop</h2>
<div>You can use <code>while</code> and <code>end while</code> keywords to have repeat loops.</div>
<pre>&#64;startuml

start

while (data available?)
  :read data;
  :generate diagrams;
endwhile

stop

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/05-While+loop.uml'>
</div>

<div>
<h2>Parallel processing</h2>
<div>You can use <code>fork</code>, <code>fork again</code> and <code>end fork</code> keywords to denote parallel processing.</div>
<pre>&#64;startuml

start

if (multiprocessor?) then (yes)
  fork
    :Treatment 1;
  fork again
    :Treatment 2;
  end fork
else (monoproc)
  :Treatment 1;
  :Treatment 2;
endif

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/06-Parallel+processing.uml'>
</div>

<div>
<h2>Notes</h2>
<div>Text formatting can be done using <a href=creole.html>creole wiki syntax</a>.</div>
<pre>&#64;startuml

start
:foo1;
note left: This is a note
:foo2;
note right
  This note is on several
  //lines// and can
  contain &lt;b&gt;HTML&lt;/b&gt;
  ====
  * Calling the method &quot;&quot;foo()&quot;&quot; is prohibited
end note
stop

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/07-Notes.uml'>
</div>

<div>
<h2>Title & Legend</h2>
<div>You can add title, header, footer, legend to a diagram:</div>
<pre>&#64;startuml
title this is my title
if (condition?) then (yes)
  :yes;
else (no)
  :no;
  note right
    this is a note
  end note
endif
stop

legend
this is the legend
endlegend

footer dummy footer
header
  this is
  a long __dummy__ header
end header

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/08-Title+&+Legend.uml'>
</div>

<div>
<h2>Colors</h2>
<div>You can use specify a <a href=http://www.w3schools.com/HTML/html_colornames.asp>color</a> for some activities.</div>
<pre>&#64;startuml

start
:starting progress;
:#HotPink:reading configuration files
These files should edited at this point!;
:#AAAAAA:ending of the process;

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/09-Colors.uml'>
</div>

<div>
<h2>Arrows</h2>
<div>Using the <code>-&gt;</code> notation, you can add texts to arrow, and change
their <a href=http://www.w3schools.com/HTML/html_colornames.asp>color</a>.</div>
<pre>&#64;startuml
:foo1;
-&gt; You can put text on arrows;
if (test) then
  -[#blue]-&gt;
  :foo2;
  -[#green]-&gt; The text can
  also be on several lines
  and **very** long...;
  :foo3;
else
  -[#black]-&gt;
  :foo4;
endif
-[#gray]-&gt;
:foo5;
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/10-Arrows.uml'>
</div>

<div>
<h2>Grouping</h2>
<div>You can group activity together by defining partition:</div>
<pre>&#64;startuml
start
partition Initialization {
    :read config file;
    :init internal variable;
}
partition Running {
    :wait for user interaction;
    :print information;
}

stop
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/11-Grouping.uml'>
</div>

<div>
<h2>Swimlanes</h2>
<div>Using pipe <code>|</code>, you can define swimlanes.
<br>
It's also possible to change swimlanes <a href=http://www.w3schools.com/HTML/html_colornames.asp>color</a>.</div>
<pre>&#64;startuml
|Swimlane1|
start
:foo1;
|#AntiqueWhite|Swimlane2|
:foo2;
:foo3;
|Swimlane1|
:foo4;
|Swimlane2|
:foo5;
stop
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/12-Swimlanes.uml'>
</div>

<div>
<h2>Detach</h2>
<div>It's possible to remove an arrow using the <code>detach</code> keyword.</div>
<pre>&#64;startuml
 :start;
 fork
   :foo1;
   :foo2;
 fork again
   :foo3;
   detach
 endfork
 if (foo4) then
   :foo5;
   detach
 endif
 :foo6;
 detach
 :foo7;
 stop
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/13-Detach.uml'>
</div>

<div>
<h2>SDL</h2>
<div>By changing the final <code>;</code> separator, you can set different rendering for the activity:
<ul>
<li><code>|</code></li>
<li><code>&lt;</code></li>
<li><code>&gt;</code></li>
<li><code>/</code></li>
<li><code>]</code></li>
<li><code>}</code></li>
</ul></div>
<pre>&#64;startuml
:Ready;
:next(o)|
:Receiving;
split
 :nak(i)&lt;
 :ack(o)&gt;
split again
 :ack(i)&lt;
 :next(o)
 on several line|
 :i := i + 1]
 :ack(o)&gt;
split again
 :err(i)&lt;
 :nak(o)&gt;
split again
 :foo/
split again
 :i &gt; 5}
stop
end split
:finish;
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/14-SDL.uml'>
</div>

<div>
<h2>Complete example</h2>
<pre>&#64;startuml

start
:ClickServlet.handleRequest();
:new page;
if (Page.onSecurityCheck) then (true)
  :Page.onInit();
  if (isForward?) then (no)
    :Process controls;
    if (continue processing?) then (no)
      stop
    endif
    
    if (isPost?) then (yes)
      :Page.onPost();
    else (no)
      :Page.onGet();
    endif
    :Page.onRender();
  endif
else (false)
endif

if (do redirect?) then (yes)
  :redirect process;
else
  if (do forward?) then (yes)
    :Forward request;
  else (no)
    :Render page template;
  endif
endif

stop

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity2/15-Complete+example.uml'>
</div>



</a:layout>
