<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<h1>Salt</h1>

<b>Salt</b> is a subproject included in PlantUML that may help you to design graphical interface.
<p>
You can use either <code>@startsalt</code> keyword, or <code>@startuml</code> followed by a line with <code>salt</code> keyword.

<h2>Basic widgets</h2>

A window must start and end with brackets.
You can then define:
<ul>
<li>Button using <code>[</code> and <code>]</code>.
<li>Radio button using <code>(</code> and <code>)</code>.
<li>Checkbox using <code>[</code> and <code>]</code>.
<li>User text area using <code>"</code>
</ul>

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startuml
salt
{
  Just plain text
  [This is my button]
  ()  Unchecked radio
  (X) Checked radio
  []  Unchecked box
  [X] Checked box
  "Enter text here   "
  ^This is a droplist^
}
@enduml
		</pre></td>
		<td><img border="0" src="/uml/help/salt/01-Basic+widgets.uml" /></td>
	</tr>
</table>
The goal of this tool is to discuss about simple and sample windows.

<h2>Using grid</h2>
A table is automatically created when you use an opening bracket <code>{</code>.
<br>
And you have to use <code>|</code> to separate columns. 
<br>
For example:

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{
  Login    | "MyName   "
  Password | "****     "
  [Cancel] | [  OK   ]
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/02-Using+grid.uml" /></td>
	</tr>
</table>

Just after the opening bracket, you can use a character to define if you want to draw lines or columns of the grid :

<table border=1 cellpadding=3 cellspacing=0>
<tr><td><code>#</code></td> <td>To display all vertical and horizontal lines</tr>

<tr><td><code>!</code></td> <td>To display all vertical lines</tr>

<tr><td><code>-</code></td> <td>To display all horizontal lines</tr>

<tr><td><code>+</code></td> <td>To display external lines</tr>
</table>

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{+
  Login    | "MyName   "
  Password | "****     "
  [Cancel] | [  OK   ]
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/03-Using+grid2.uml" /></td>
	</tr>
</table>

<h2>Using separator</h2>
You can use several horizontal lines as separator.

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{
  Text1
  ..
  "Some field"
  ==
  Note on usage
  ~~
  Another text
  --
  [Ok]
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/04-Using+separator.uml" /></td>
	</tr>
</table>

<h2>Tree widget</h2>
To have a Tree, you have to start with <code>{T</code> and to use <code>+</code> to denote hierarchy.

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
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
		</pre></td>
		<td><img border="0" src="/uml/help/salt/05-Tree+widget.uml" /></td>
	</tr>
</table>

<h2>Enclosing brackets</h2>
You can define subelements by opening a new opening bracket.

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{
Name         | "                 "
Modifiers:   | { (X) public | () default | () private | () protected
                [] abstract | [] final   | [] static }
Superclass:  | { "java.lang.Object " | [Browse...] }
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/06-Enclosing+brackets.uml" /></td>
	</tr>
</table>

<h2>Adding tabs</h2>
You can add tabs using <code>{/</code> notation.
Note that you can use HTML code to have bold text.

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
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
		</pre></td>
		<td><img border="0" src="/uml/help/salt/07-Adding+tabs.uml" /></td>
	</tr>
</table>


Tab could also be vertically oriented:

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{+
{/ &lt;b&gt;General
Fullscreen
Behavior
Saving } |
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images 
	[Close]
}
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/08-Adding+tabs2.uml" /></td>
	</tr>
</table>


<h2>Using menu</h2>
You can add a menu by using <code>{*</code> notation.

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{+
{* File | Edit | Source | Refactor }
{/ General | Fullscreen | Behavior | Saving }
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images 
}
[Close]
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/09-Using+menu.uml" /></td>
	</tr>
</table>

It is also possible to open a menu:

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{+
{* File | Edit | Source | Refactor 
 Refactor | New | Open File | - | Close | Close All }
{/ General | Fullscreen | Behavior | Saving }
{
	{ Open image in: | ^Smart Mode^ }
	[X] Smooth images when zoomed
	[X] Confirm image deletion
	[ ] Show hidden images 
}
[Close]
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/10-Using+menu2.uml" /></td>
	</tr>
</table>

<h2 id=table>Advanced table</h2>
You can use two special notations for table :
<ul>
<li><code>*</code> to indicate that a cell with span with left</li>
<li><code>.</code> to denotate an empty cell</li>
</ul>

<table cellspacing="10" cellpadding="10">
	<tr>
		<td class="scriptplantu"><pre>
&#64;startsalt
{#
. | Column 2 | Column 3
Row header 1 | value 1 | value 2
Row header 2 | A long cell | *
}
@endsalt
		</pre></td>
		<td><img border="0" src="/uml/help/salt/11-Advanced+table.uml" /></td>
	</tr>
</table>

<h3>OpenIconic</h3>

<a href="https://useiconic.com/open/">OpenIconic</a> is an very nice open source icon set.
Those icons have been integrated into the <a href=creole.html>creole parser</a>, so you can use them out-of-the-box.
<p>
You can use the following syntax: <code>&lt;&amp;ICON_NAME&gt;</code>. 
<table cellspacing="10" cellpadding="10">
	<tr valign="top">
		<td class="scriptplantu"><pre>
&#64;startsalt
{
  Login&lt;&person&gt; | "MyName   "
  Password&lt;&key&gt; | "****     "
  [Cancel &lt;&circle-x&gt;] | [OK &lt;&account-login&gt;]
}
@endsalt
        </pre></td>
		<td><img border="2" src="/uml/help/salt/12-OpenIconic.uml" /></td>
	</tr>
</table>


</a:layout>
