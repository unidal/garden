<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Basic widgets</h2>
<div>A window must start and end with brackets.
You can then define:
<ul>
<li>Button using <code>[</code> and <code>]</code>.
<li>Radio button using <code>(</code> and <code>)</code>.
<li>Checkbox using <code>[</code> and <code>]</code>.
<li>User text area using <code>"</code>.
</ul></div>
<pre>&#64;startuml
salt
{
  Just plain text
  [This is my button]
  ()  Unchecked radio
  (X) Checked radio
  []  Unchecked box
  [X] Checked box
  &quot;Enter text here   &quot;
  ^This is a droplist^
}
@enduml
</pre>
<img src='${model.webapp}/uml/help/salt/01-Basic+widgets.uml'>
</div>

<div>
<h2>Using grid</h2>
<div>A table is automatically created when you use an opening bracket <code>{</code>.
<br>
And you have to use <code>|</code> to separate columns.
<br>
For example:</div>
<pre>&#64;startsalt
{
  Login    | &quot;MyName   &quot;
  Password | &quot;****     &quot;
  [Cancel] | [  OK   ]
}
@endsalt
</pre>
<img src='${model.webapp}/uml/help/salt/02-Using+grid.uml'>
</div>

<div>
<h2>Using separator</h2>
<div>You can use several horizontal lines as separator.</div>
<pre>&#64;startsalt
{
  Text1
  ..
  &quot;Some field&quot;
  ==
  Note on usage
  ~~
  Another text
  --
  [Ok]
}
@endsalt
</pre>
<img src='${model.webapp}/uml/help/salt/03-Using+separator.uml'>
</div>

<div>
<h2>Tree widget</h2>
<div>To have a Tree, you have to start with <code>{T</code> and to use <code>+</code> to
denote hierarchy.</div>
<pre>&#64;startsalt
{
{T
 + World
 ++ America
 +++ Canada
 +++ USA
 ++++ New York
 ++++ Boston
 +++ Mexico
 ++ Europe
 +++ Italy
 +++ Germany
 ++++ Berlin
 ++ Africa
}
}
@endsalt
</pre>
<img src='${model.webapp}/uml/help/salt/04-Tree+widget.uml'>
</div>

<div>
<h2>Enclosing brackets</h2>
<div>You can define subelements by opening a new opening bracket.</div>
<pre>&#64;startsalt
{
Name         | &quot;                 &quot;
Modifiers:   | { (X) public | () default | () private | () protected
                [] abstract | [] final   | [] static }
Superclass:  | { &quot;java.lang.Object &quot; | [Browse...] }
}
@endsalt
		</pre>
<img src='${model.webapp}/uml/help/salt/05-Enclosing+brackets.uml'>
</div>

<div>
<h2>Adding tabs</h2>
<div>You can add tabs using <code>{/</code> notation.
Note that you can use HTML code to have bold text.</div>
<pre>&#64;startsalt
{+
{/ &lt;b&gt;General | Fullscreen | Behavior | Saving }
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images
}
[Close]
}
@endsalt
</pre>
<img src='${model.webapp}/uml/help/salt/06-Adding+tabs.uml'>
</div>



</a:layout>
