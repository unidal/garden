<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Simple Activity</h2>
<div>You can use <code>(*)</code> for the starting point and ending point of
the activity diagram.
<p>
In some occasion, you may want to use <code>(*top)</code> to force the starting point to be at the top of the diagram.
<p>
Use <code>--&gt;</code> for arrows.</div>
<pre>&#64;startuml

(*) --&gt; &quot;First Activity&quot;
&quot;First Activity&quot; --&gt; (*)

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/01-Simple+Activity.uml'>
</div>

<div>
<h2>Label on arrows</h2>
<div><p>
By default, an arrow starts at the last used activity.
<p>
You can put a label on an arrow using brackets <code>[</code> and
<code>]</code> just after the arrow definition.</div>
<pre>&#64;startuml

(*) --&gt; &quot;First Activity&quot;
--&gt;[You can put also labels] &quot;Second Activity&quot;
--&gt; (*)

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/02-Label+on+arrows.uml'>
</div>

<div>
<h2>Changing arrow direction</h2>
<div>You can use <code>-&gt;</code> for horizontal arrows. It is possible to
force arrow's direction using the following syntax:
<ul>
<li><code>-down-&gt;</code> (default arrow)</li>
<li><code>-right-&gt;</code> or <code>-&gt;</code></li>
<li><code>-left-&gt;</code></li>
<li><code>-up-&gt;</code></li>
</ul></div>
<pre>&#64;startuml

(*) -up-&gt; &quot;First Activity&quot;
-right-&gt; &quot;Second Activity&quot;
--&gt; &quot;Third Activity&quot;
-left-&gt; (*)

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/03-Changing+arrow+direction.uml'>
</div>

<div>
<h2>Branches</h2>
<div>You can use <code>if/then/else</code> keywords to define branches.
<p></div>
<pre>&#64;startuml
(*) --&gt; &quot;Initialization&quot;

if &quot;Some Test&quot; then
  --&gt;[true] &quot;Some Activity&quot;
  --&gt; &quot;Another activity&quot;
  -right-&gt; (*)
else
  -&gt;[false] &quot;Something else&quot;
  --&gt;[Ending process] (*)
endif

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/04-Branches.uml'>
</div>

<div>
<h2>More on Branches</h2>
<div>By default, a branch is connected to the last defined activity, but it
is possible to override this and to define a link with the <code>if</code> keywords.
<p>
It is also possible to nest branches.
<p></div>
<pre>&#64;startuml

(*) --&gt; if &quot;Some Test&quot; then

  --&gt;[true] &quot;activity 1&quot;
  
  if &quot;&quot; then
    -&gt; &quot;activity 3&quot; as a3
  else
    if &quot;Other test&quot; then
      -left-&gt; &quot;activity 5&quot;
    else
      --&gt; &quot;activity 6&quot;
    endif
  endif
  
else

  -&gt;[false] &quot;activity 2&quot;
  
endif

a3 --&gt; if &quot;last test&quot; then
  --&gt; &quot;activity 7&quot;
else
  -&gt; &quot;activity 8&quot;
endif

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/05-More+on+Branches.uml'>
</div>

<div>
<h2>Synchronization</h2>
<div>You can use <code>=== code ===</code> to display synchronization bars.</div>
<pre>&#64;startuml

(*) --&gt; ===B1=== 
--&gt; &quot;Parallel Activity 1&quot;
--&gt; ===B2===

===B1=== --&gt; &quot;Parallel Activity 2&quot;
--&gt; ===B2===

--&gt; (*)

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/06-Synchronization.uml'>
</div>

<div>
<h2>Long activity description</h2>
<div>When you declare activities, you can span on several lines the
description text. You can also add <code>\n</code> in the description.
<p>
You can also give a short code to the activity with the <code>as</code>
keyword.
This code can be used latter in the diagram description.</div>
<pre>&#64;startuml
(*) -left-&gt; &quot;this &lt;size:20&gt;activity&lt;/size&gt;
	is &lt;b&gt;very&lt;/b&gt; &lt;color:red&gt;long2&lt;/color&gt;
	and defined on several lines
	that contains many &lt;i&gt;text&lt;/i&gt;&quot; as A1

-up-&gt; &quot;Another activity\n on several lines&quot;

A1 --&gt; &quot;Short activity &lt;img:sourceforge.jpg&gt;&quot;
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/07-Long+activity+description.uml'>
</div>

<div>
<h2>Notes</h2>
<div>You can add notes on a activity using the commands
<code>note left</code>,
<code>note right</code>, <code>note top</code> or <code>note
bottom</code>,
just after the description of the activity you want to note.
<p>
If you want to put a note on the starting point, define the note
at the very beginning of the diagram description.
<p>
You can also have a note on several lines, using the
<code>endnote</code> keywords.</div>
<pre>&#64;startuml

(*) --&gt; &quot;Some Activity&quot;
note right: This activity has to be defined
&quot;Some Activity&quot; --&gt; (*)
note left
 This note is on
 several lines
end note

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/08-Notes.uml'>
</div>

<div>
<h2>Partition</h2>
<div>You can define a partition using the <code>partition</code> keyword, and
optionally declare a background color for your partition (Using a html
color code or name)
<p>
When you declare activities, they are automatically put in the
last used partition.
<p>
You can close the partition definition using a closing bracket <code>}</code>.</div>
<pre>&#64;startuml

partition Conductor {
  (*) --&gt; &quot;Climbs on Platform&quot;
  --&gt; === S1 ===
  --&gt; Bows
}

partition Audience LightSkyBlue {
  === S1 === --&gt; Applauds
}

partition Conductor {
  Bows --&gt; === S2 ===
  --&gt; WavesArmes
  Applauds --&gt; === S2 ===
}

partition Orchestra #CCCCEE {
  WavesArmes --&gt; Introduction
  --&gt; &quot;Play music&quot;
}

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/09-Partition.uml'>
</div>

<div>
<h2>Title the diagram</h2>
<div>The <code>title</code> keywords is used to put a title.
<p>
You can use <code>title</code> and <code>end title</code> keywords for a longer title, as in sequence diagrams.</div>
<pre>&#64;startuml
title Simple example\nof title 

(*) --&gt; &quot;First activity&quot;
--&gt; (*)
@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/10-Title+the+diagram.uml'>
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
You can define specific color and fonts for stereotyped activities.</div>
<pre>&#64;startuml

skinparam backgroundColor #AAFFFF
skinparam activity {
  StartColor red
  BarColor SaddleBrown 
  EndColor Silver
  BackgroundColor Peru
  BackgroundColor&lt;&lt; Begin &gt;&gt; Olive
  BorderColor Peru
  FontName Impact
}

(*) --&gt; &quot;Climbs on Platform&quot; &lt;&lt; Begin &gt;&gt;
--&gt; === S1 ===
--&gt; Bows
--&gt; === S2 ===
--&gt; WavesArmes
--&gt; (*)

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/11-Skinparam.uml'>
</div>

<div>
<h2>Octagon</h2>
<div>You can change the shape of activities to octagon using the <code>skinparam activityShape octagon</code>
command.</div>
<pre>&#64;startuml
'Default is skinparam activityShape roundBox
skinparam activityShape octagon

(*) --&gt; &quot;First Activity&quot;
&quot;First Activity&quot; --&gt; (*)

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/12-Octagon.uml'>
</div>

<div>
<h2>Complete example</h2>
<pre>&#64;startuml
title Servlet Container

(*) --&gt; &quot;ClickServlet.handleRequest()&quot;
--&gt; &quot;new Page&quot;

if &quot;Page.onSecurityCheck&quot; then
  -&gt;[true] &quot;Page.onInit()&quot;
  
  if &quot;isForward?&quot; then
   -&gt;[no] &quot;Process controls&quot;
   
   if &quot;continue processing?&quot; then
     --&gt;[yes] ===RENDERING===
   else
     --&gt;[no] ===REDIRECT_CHECK===
   endif
   
  else
   --&gt;[yes] ===RENDERING===
  endif
  
  if &quot;is Post?&quot; then
    --&gt;[yes] &quot;Page.onPost()&quot;
    --&gt; &quot;Page.onRender()&quot; as render
    --&gt; ===REDIRECT_CHECK===
  else
    --&gt;[no] &quot;Page.onGet()&quot;
    --&gt; render
  endif
  
else
  --&gt;[false] ===REDIRECT_CHECK===
endif

if &quot;Do redirect?&quot; then
 -&gt;[yes] &quot;redirect request&quot;
 --&gt; ==BEFORE_DESTROY===
else
 if &quot;Do Forward?&quot; then
  -left-&gt;[yes] &quot;Forward request&quot;
  --&gt; ==BEFORE_DESTROY===
 else
  -right-&gt;[no] &quot;Render page template&quot;
  --&gt; ==BEFORE_DESTROY===
 endif
endif

--&gt; &quot;Page.onDestroy()&quot;
--&gt;(*)

@enduml
</pre>
<img src='${model.webapp}/uml/help/activity/13-Complete+example.uml'>
</div>



</a:layout>
