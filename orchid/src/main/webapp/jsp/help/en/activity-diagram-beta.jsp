<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>


<div id="root">
<p>
</p>
<p>
<a id="1">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h1>Activity Diagram (beta)
</h1>
<p>Current 
<a href="activity-diagram-legacy">syntax for activity diagram
</a> has several limitations and drawbacks (for example, it's difficult to maintain).
</p>
<p>So a completely new syntax and implementation is proposed as 
<strong>beta version
</strong> to users (starting with V7947), so that we could define a better format and syntax.
</p>
<p>Another advantage of this new implementation is that it's done without the need of having Graphviz installed (as for sequence diagrams).
</p>
<p>The new syntax will replace the old one. However, for compatibility reason, the old syntax will still be recognized, to ensure 
<em>ascending compatibility
</em>.
</p>
<p>Users are simply encouraged to migrate to the new syntax.
</p>
<p>
</p>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Simple Activity
</h2>
<p>
</p>Activities label starts with 
<code>:
</code> and ends with 
<code>;
</code>.
<p>Text formatting can be done using 
<a href="creole">creole wiki syntax
</a>.
</p>
<p>They are implicitly linked in their definition order.
</p>
<div>
<div class="mycell">

<pre>@startuml
:Hello world;
:This is defined on
several **lines**;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-00.uml">
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
<h2>Start/Stop
</h2>
<p>You can use 
<code>start
</code> and 
<code>stop
</code> keywords to denote the beginning and the end of a diagram.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
start
:Hello world;
:This is defined on
several **lines**;
stop
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-01.uml">
</div>
</div>
<p>You can also use the 
<code>end
</code> keyword.
</p>
<div>
<div class="mycell">

<pre>@startuml
start
:Hello world;
:This is defined on
several **lines**;
end
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-02.uml">
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
<h2>Conditional
</h2>
<p>You can use 
<code>if
</code>, 
<code>then
</code> and 
<code>else
</code> keywords to put tests in your diagram. Labels can be provided using parentheses.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-03.uml">
</div>
</div>
<p>You can use the 
<code>elseif
</code> keyword to have several tests :
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
start
if (condition A) then (yes)
  :Text 1;
elseif (condition B) then (yes)
  :Text 2;
  stop
elseif (condition C) then (yes)
  :Text 3;
elseif (condition D) then (yes)
  :Text 4;
else (nothing)
  :Text else;
endif
stop
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-04.uml">
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
<h2>Repeat loop
</h2>
<p>You can use 
<code>repeat
</code> and 
<code>repeatwhile
</code> keywords to have repeat loops.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start

repeat
  :read data;
  :generate diagrams;
repeat while (more data?) is (yes)
-&gt;no;
stop

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-05.uml">
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
<h2>While loop
</h2>
<p>You can use 
<code>while
</code> and 
<code>end while
</code> keywords to have repeat loops.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start

while (data available?)
  :read data;
  :generate diagrams;
endwhile

stop

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-06.uml">
</div>
</div>
<p>It is possible to provide a label after the 
<code>endwhile
</code> keyword, or using the 
<code>is
</code> keyword.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
while (check filesize ?) is (not empty)
  :read file;
endwhile (empty)
:close file;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-07.uml">
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
<h2>Parallel processing
</h2>
<p>You can use 
<code>fork
</code>, 
<code>fork again
</code> and 
<code>end fork
</code> keywords to denote parallel processing.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-08.uml">
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
<h2>Notes
</h2>
<p>Text formatting can be done using 
<a href="creole">creole wiki syntax
</a>.
</p>
<p>A note can be floating, using 
<code>floating
</code> keyword.
</p>
<div>
<div class="mycell">

<pre>@startuml

start
:foo1;
floating note left: This is a note
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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-09.uml">
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
<h2>Colors
</h2>
<p>You can specify a 
<a href="color">color
</a> for some activities.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

start
:starting progress;
#HotPink:reading configuration files
These files should be edited at this point!;
#AAAAAA:ending of the process;

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-10.uml">
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
<h2>Arrows
</h2>
<p>Using the 
<code>-&gt;
</code> notation, you can add texts to arrow, and change their 
<a href="color">color
</a>.
</p>
<p>It's also possible to have dotted, dashed, bold or hidden arrows.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:foo1;
-&gt; You can put text on arrows;
if (test) then
  -[#blue]-&gt;
  :foo2;
  -[#green,dashed]-&gt; The text can
  also be on several lines
  and **very** long...;
  :foo3;
else
  -[#black,dotted]-&gt;
  :foo4;
endif
-[#gray,bold]-&gt;
:foo5;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-11.uml">
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
<h2>Connector
</h2>
<p>You can use parentheses to denote connector.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
start
:Some activity;
(A)
detach
(A)
:Other activity;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-12.uml">
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
<h2>Grouping
</h2>
<p>You can group activity together by defining partition:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-13.uml">
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
<h2>Swimlanes
</h2>
<p>Using pipe 
<code>|
</code>, you can define swimlanes.
</p>
<p>It's also possible to change swimlanes 
<a href="color">color
</a>.
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-14.uml">
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
<h2>Detach
</h2>
<p>It's possible to remove an arrow using the 
<code>detach
</code> keyword.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-15.uml">
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
<h2>SDL
</h2>
<p>By changing the final 
<code>;
</code> separator, you can set different rendering for the activity:
</p>
<ul>
<li>
<code>|
</code>
</li>
<li>
<code>&lt;
</code>
</li>
<li>
<code>&gt;
</code>
</li>
<li>
<code>/
</code>
</li>
<li>
<code>]
</code>
</li>
<li>
<code>}
</code>
</li>
</ul>
<div>
<div class="mycell">

<pre>@startuml
:Ready;
:next(o)|
:Receiving;
split
 :nak(i)&lt;
 :ack(o)&gt;
split again
 :ack(i)&lt;
 :next(o)
 on several lines|
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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-16.uml">
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
<h2>Complete example
</h2>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/activity-diagram-beta/activity-diagram-beta-17.uml">
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
