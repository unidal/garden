<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:layout>

<br>

<div>
<h2>Relations between classes</h2>
<div>Relations between classes are defined using the following symbols :
<br/><br/>
<div style="margin-left: 2em">
<table border="1" cellpadding="5" cellspacing="0">
<tr>
<td>Extension</td>
<td><code>&lt;|--</code></td>
<td><img alt="extension symbol" width="40" src="img/extends01.png"/></td>
</tr>
<tr>
<td>Composition</td>
<td><code>*--</code></td>
<td><img alt="composition symbol" src="img/sym03.png"/></td>
</tr>
<tr>
<td>Aggregation</td>
<td><code>o--</code></td>
<td><img alt="aggregation symbol" src="img/sym01.png"/></td>
</tr>
</table>
</div>
<p>
It is possible to replace <code>--</code> by <code>..</code> to have a dotted
line.
<p>
Knowing those rules, it is possible to draw the following drawings:
<p></div>
<pre>&#64;startuml
Class01 &lt;|-- Class02
Class03 *-- Class04
Class05 o-- Class06
Class07 .. Class08
Class09 -- Class10
@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/01-Relations+between+classes.uml'>
</div>

<div>
<h2>Label on relations</h2>
<div>It is possible a add a label on the relation, using "<code>:</code>", followed
by the text of the label.
<p>For cardinality, you can use double-quotes <code>""</code> on each side
of the relation.</div>
<pre>&#64;startuml

Class01 &quot;1&quot; *-- &quot;many&quot; Class02 : contains

Class03 o-- Class04 : aggregation

Class05 --&gt; &quot;1&quot; Class06

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/02-Label+on+relations.uml'>
</div>

<div>
<h2>Adding methods</h2>
<div>To declare fields and methods, you can use the symbol
<code>":"</code> followed by the field's or method's name.
<p>The system checks for parenthesis to choose between methods and fields.</div>
<pre>&#64;startuml
Object &lt;|-- ArrayList

Object : equals()
ArrayList : Object[] elementData
ArrayList : size()

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/03-Adding+methods.uml'>
</div>

<div>
<h2>Defining visibility</h2>
<div>When you define methods or fields, you can use characters to define the
visibility of the corresponding item:
<p>
<table border="1" cellpadding="2" cellspacing="0">
<tr align=center>
<td><b>Character</b></td>
<td><b>Icon for field</b></td>
<td><b>Icon for method</b></td>
<td><b>Visibility</b></td>
</tr>
<tr align=center>
<td><code>-</code></td>
<td><img src="PRIVATE_FIELD.png"/></td>
<td><img src="PRIVATE_METHOD.png"/></td>
<td align=left><code>private</code></td>
</tr>
<tr align=center>
<td><code>#</code></td>
<td><img src="PROTECTED_FIELD.png"/></td>
<td><img src="PROTECTED_METHOD.png"/></td>
<td align=left><code>protected</code></td>
</tr>
<tr align=center>
<td><code>~</code></td>
<td><img src="PACKAGE_PRIVATE_FIELD.png"/></td>
<td><img src="PACKAGE_PRIVATE_METHOD.png"/></td>
<td align=left><code>package private</code></td>
</tr>
<tr align=center>
<td><code>+</code></td>
<td><img src="PUBLIC_FIELD.png"/></td>
<td><img src="PUBLIC_METHOD.png"/></td>
<td align=left><code>public</code></td>
</tr>
</table></div>
<pre>&#64;startuml

class Dummy {
 -field1
 #field2
 ~method1()
 +method2()
}

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/04-Defining+visibility.uml'>
</div>

<div>
<h2>Abstract and Static</h2>
<div>You can define static or abstract methods or fields using the <code>{static}</code>
or <code>{abstract}</code> modifier.
<p>These modifiers can be used at the start or at the end of the line.
You can also use <code>{classifier}</code> instead of <code>{static}</code>.</div>
<pre>&#64;startuml
class Dummy {
  {static} String id
  {abstract} void methods()
}
@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/05-Abstract+and+Static.uml'>
</div>

<div>
<h2>Advanced class body</h2>
<div>By default, methods and fields are automatically regrouped by PlantUML.
You can use separators to define your own way of ordering fields and methods.
The following separators are possible : <code>--</code> <code>..</code> <code>==</code> <code>__</code>.
<p>You can also use titles within the separators:</div>
<pre>&#64;startuml
class Foo1 {
  You can use
  several lines
  ..
  as you want
  and group
  ==
  things together.
  __
  You can have as many groups
  as you want
  --
  End of class
}

class User {
  .. Simple Getter ..
  + getName()
  + getAddress()
  .. Some setter ..
  + setName()
  __ private data __
  int age
  -- encrypted --
  String password
}

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/06-Advanced+class+body.uml'>
</div>

<div>
<h2>Notes and stereotypes</h2>
<div>Stereotypes are defined with the <code>class</code> keyword, " <code>&lt;&lt;</code>
" and " <code>&gt;&gt;</code> ".
<p>You can also define notes using <code>note left of</code> , <code>note
right of</code> , <code>note top of</code> , <code>note bottom of</code>
keywords.
<p>You can also define a note on the last defined class using <code>note left</code>, <code>note right</code>,
<code>note top</code>, <code>note bottom</code>.
<p>A note can be also define alone with the <code>note</code>
keywords, then linked to other objects using the <code>..</code> symbol.</div>
<pre>&#64;startuml
class Object &lt;&lt; general &gt;&gt;
Object &lt;|--- ArrayList

note top of Object : In java, every class\nextends this one.

note &quot;This is a floating note&quot; as N1
note &quot;This note is connected\nto several objects.&quot; as N2
Object .. N2
N2 .. ArrayList

class Foo
note left: On last defined class

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/07-Notes+and+stereotypes.uml'>
</div>

<div>
<h2>More on notes</h2>
<div>It is also possible to use few html tags like :
<ul>
<li><code>&lt;b&gt;</code></li>
<li><code>&lt;u&gt;</code></li>
<li><code>&lt;i&gt;</code></li>
<li><code>&lt;s&gt;</code>, <code>&lt;del&gt;</code>, <code>&lt;strike&gt;</code></li>
<li><code>&lt;font color="#AAAAAA"&gt;</code> or <code>&lt;font color="<a href=http://www.w3schools.com/HTML/html_colornames.asp>colorName</a>"&gt;</code></li>
<li><code>&lt;color:#AAAAAA&gt;</code> or <code>&lt;color:<a href=http://www.w3schools.com/HTML/html_colornames.asp>colorName</a>&gt;</code></li>
<li><code>&lt;size:nn&gt;</code> to change font size</li>
<li><code>&lt;img src="file"&gt;</code> or <code>&lt;img:file&gt;</code>
: the file must be accessible by the filesystem</li>
</ul>
<p>You can also have a note on several lines</p>
<p>You can also define a note on the last defined class using <code>note left</code>, <code>note right</code>,
<code>note top</code>, <code>note bottom</code>.</div>
<pre>&#64;startuml

class Foo
note left: On last defined class

note top of Object
  In java, &lt;size:18&gt;every&lt;/size&gt; &lt;u&gt;class&lt;/u&gt;
  &lt;b&gt;extends&lt;/b&gt;
  &lt;i&gt;this&lt;/i&gt; one.
end note

note as N1
  This note is &lt;u&gt;also&lt;/u&gt;
  &lt;b&gt;&lt;color:royalBlue&gt;on several&lt;/color&gt;
  &lt;s&gt;words&lt;/s&gt; lines
  And this is hosted by &lt;img:sourceforge.jpg&gt;
end note

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/08-More+on+notes.uml'>
</div>

<div>
<h2>Note on links</h2>
<div>It is possible to add a note on a link, just after the link definition, using <code>note on link</code>.
<p>
You can also use <code>note left on link</code>, <code>note right on link</code>, <code>note top on link</code>,
<code>note bottom on link</code> if you want to change the relative position of the note with the label.</div>
<pre>&#64;startuml

class Dummy
Dummy --&gt; Foo : A link
note on link #red: note that is red

Dummy --&gt; Foo2 : Another link
note right on link #blue
	this is my note on right link
	and in blue
end note

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/09-Note+on+links.uml'>
</div>

<div>
<h2>Abstract class and interface</h2>
<div><a name="enum" id="enum">You can declare a class as abstract using <code>"abstract"</code>
or <code>"abstract class"</code> keywords.</a>
<p>The class will be printed in <i>italic</i>.</p>
<p>You can use the <code>interface</code>, <code>annotation</code> and <code>enum</code> keywords too.</p></div>
<pre>&#64;startuml

abstract class AbstractList
abstract AbstractCollection
interface List
interface Collection

List &lt;|-- AbstractList
Collection &lt;|-- AbstractCollection

Collection &lt;|- List
AbstractCollection &lt;|- AbstractList
AbstractList &lt;|-- ArrayList

class ArrayList {
  Object[] elementData
  size()
}

enum TimeUnit {
  DAYS
  HOURS
  MINUTES
}

annotation SuppressWarnings

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/10-Abstract+class+and+interface.uml'>
</div>

<div>
<h2>Using non-letters</h2>
<div>If you want to use <a href=unicode.html>non-letters</a> in the class (or enum...) display, you can either :
<ul>
<li>Use the <code>as</code> keyword in the class definition</li>
<li>Put quotes <code>""</code> around the class name</li>
</ul></div>
<pre>&#64;startuml
class &quot;This is my class&quot; as class1
class class2 as &quot;It works this way too&quot;

class2 *-- &quot;foo/dummy&quot; : use
@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/11-Using+non-letters.uml'>
</div>

<div>
<h2>Hide attributes, methods...</h2>
<div>You can parameterize the display of classes using the <code>hide/show</code>
command.
<p>
The basic command is: <code>hide empty members</code>. This
command will hide attributes or methods if they are empty.
<p>
Instead of <code>empty members</code>, you can use:
<ul>
<li><code>empty fields</code> or <code>empty attributes</code> for
empty fields,
<li><code>empty methods</code> for empty methods,
<li><code>fields</code> or <code>attributes</code> which will hide
fields, even if they are described,
<li><code>methods</code> which will hide methods, even if they are
described,
<li><code>members</code> which will hide fields <u>and</u> methods,
even if they are described,
<li><code>circle</code> for the circled character in front of
class name,
<li><code>stereotype</code> for the stereotype.
</ul>
You can also provide, just after the <code>hide</code> or <code>show</code>
keyword:
<ul>
<li><code>class</code> for all classes,
<li><code>interface</code> for all interfaces,
<li><code>enum</code> for all enums,
<li><code>&lt;&lt;foo1&gt;&gt;</code> for classes which are
stereotyped with <i>foo1</i>,
<li>an existing class name.
</ul>
You can use several <code>show/hide</code> commands to define rules and
exceptions.</div>
<pre>&#64;startuml

class Dummy1 {
  +myMethods()
}

class Dummy2 {
  +hiddenMethod()
}

class Dummy3 &lt;&lt;Serializable&gt;&gt; {
	String name
}

hide members
hide &lt;&lt;Serializable&gt;&gt; circle
show Dummy1 methods
show &lt;&lt;Serializable&gt;&gt; fields

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/12-Hide+attributes,+methods....uml'>
</div>

<div>
<h2>Hide classes</h2>
<div>You can also use the <code>show/hide</code> commands to hide classes.
<p>
This may be useful if you define a large <a href=preprocessing.html>!included file</a>,
and if you want to hide come classes after <a href=preprocessing.html>file inclusion</a>.</div>
<pre>&#64;startuml

class Foo1
class Foo2

Foo2 *-- Foo1

hide Foo2

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/13-Hide+classes.uml'>
</div>

<div>
<h2>Use generics</h2>
<div>You can also use bracket <code>&lt;</code> and <code>&gt;</code> to define generics usage in a class.</div>
<pre>&#64;startuml

class Foo&lt;? extends Element&gt; {
  int size()
}
Foo *- Element

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/14-Use+generics.uml'>
</div>

<div>
<h2>Specific Spot</h2>
<div>Usually, a spotted character (C, I, E or A) is used for classes,
interface, enum and abstract classes.
<p>
But you can define your own spot for a class when you define the stereotype,
adding a single character and a color, like in this example:</div>
<pre>&#64;startuml

class System &lt;&lt; (S,#FF7700) Singleton &gt;&gt;
class Date &lt;&lt; (D,orchid) &gt;&gt;
@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/15-Specific+Spot.uml'>
</div>

<div>
<h2>Packages</h2>
<div>You can define a package using the
<code>package</code> keyword, and optionally declare a background color
for your package (Using a html color code or name).
<p>
Note that package definitions can be nested.</div>
<pre>&#64;startuml

package &quot;Classic Collections&quot; #DDDDDD {
  Object &lt;|-- ArrayList
}

package net.sourceforge.plantuml {
  Object &lt;|-- Demo1
  Demo1 *- Demo2
}

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/16-Packages.uml'>
</div>

<div>
<h2>Packages style</h2>
<div>There are different styles available for packages.
<p>
You can specify them either by setting a default style with the command : <code>skinparam packageStyle</code>,
or by using a stereotype on the package:</div>
<pre>&#64;startuml
scale 750 width
package foo1 &lt;&lt;Node&gt;&gt; {
  class Class1
}

package foo2 &lt;&lt;Rect&gt;&gt; {
  class Class2
}

package foo3 &lt;&lt;Folder&gt;&gt; {
  class Class3
}

package foo4 &lt;&lt;Frame&gt;&gt; {
  class Class4
}

package foo5 &lt;&lt;Cloud&gt;&gt; {
  class Class5
}

package foo6 &lt;&lt;Database&gt;&gt; {
  class Class6
}

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/17-Packages+style.uml'>
</div>

<div>
<h2>Namespaces</h2>
<div>In packages, the name of a class is the unique identifier of this class.
It means that you cannot have two classes with the very same name in
different packages.
<p>
In that case, you should use <a href=http://en.wikipedia.org/wiki/Namespace_%28computer_science%29>namespaces</a>
instead of packages.
<p>
You can refer to classes from other namespaces by fully qualify
them. Classes from the default namespace are qualified with a starting
dot.
<p>
Note that you don't have to explicitly create namespace : a fully
qualified class is automatically put in the right namespace.</div>
<pre>&#64;startuml

class BaseClass

namespace net.dummy #DDDDDD {
    .BaseClass &lt;|-- Person
    Meeting o-- Person
    
    .BaseClass &lt;|- Meeting
}

namespace net.foo {
  net.dummy.Person  &lt;|- Person
  .BaseClass &lt;|-- Person

  net.dummy.Meeting o-- Person
}

BaseClass &lt;|-- net.unused.Person

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/18-Namespaces.uml'>
</div>

<div>
<h2>Automatic namespace creation</h2>
<div>You can define another separator (other than the dot) using
the command : <code>set namespaceSeparator ???</code>.</div>
<pre>&#64;startuml

set namespaceSeparator ::
class X1::X2::foo {
  some info
}

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/19-Automatic+namespace+creation.uml'>
</div>

<div>
<h2>Lollipop interface</h2>
<div>You can also define lollipops interface on classes, using the following
syntax:
<ul>
<li><code>bar ()- foo</code></li>
<li><code>bar ()-- foo</code></li>
<li><code>foo -() bar</code></li>
</ul></div>
<pre>&#64;startuml
class foo
bar ()- foo
@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/20-Lollipop+interface.uml'>
</div>

<div>
<h2>Changing arrows direction</h2>
<div>By default, links between classes have two dashes <code>--</code> and are vertically oriented.
It is possible to use horizontal link by putting a single dash (or dot) like this:</div>
<pre>&#64;startuml
Room o- Student
Room *-- Chair
@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/21-Changing+arrows+direction.uml'>
</div>

<div>
<h2>Title the diagram</h2>
<div>The <code>title</code> keyword is used to put a title.
<p>
You can use <code>title</code> and <code>end title</code>
keywords for a longer title, as in sequence diagrams.</div>
<pre>&#64;startuml

title Simple &lt;b&gt;example&lt;/b&gt;\nof title 
Object &lt;|-- ArrayList

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/22-Title+the+diagram.uml'>
</div>

<div>
<h2>Legend the diagram</h2>
<div>The <code>legend</code> and <code>end legend</code> are keywords is used to put a legend.
<p>
You can optionally specify to have <code>left</code>, <code>right</code> or <code>center</code>
alignment for the legend.</div>
<pre>&#64;startuml

Object &lt;|- ArrayList

legend right
  &lt;b&gt;Object&lt;/b&gt; and &lt;b&gt;ArrayList&lt;/b&gt;
  are simple class
endlegend

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/23-Legend+the+diagram.uml'>
</div>

<div>
<h2>Association classes</h2>
<div>You can define <i>association class</i> after that a relation has been
defined between two classes, like in this example:</div>
<pre>&#64;startuml
class Student {
  Name
}
Student &quot;0..*&quot; - &quot;1..*&quot; Course
(Student, Course) .. Enrollment

class Enrollment {
  drop()
  cancel()
}
@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/24-Association+classes.uml'>
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
</ul></div>
<pre>&#64;startuml

skinparam class {
	BackgroundColor PaleGreen
	ArrowColor SeaGreen
	BorderColor SpringGreen
}
skinparam stereotypeCBackgroundColor YellowGreen

Class01 &quot;1&quot; *-- &quot;many&quot; Class02 : contains

Class03 o-- Class04 : aggregation

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/25-Skinparam.uml'>
</div>

<div>
<h2>Skinned Stereotypes</h2>
<div>You can define specific color and fonts for stereotyped classes.</div>
<pre>&#64;startuml

skinparam class {
	BackgroundColor PaleGreen
	ArrowColor SeaGreen
	BorderColor SpringGreen
	BackgroundColor&lt;&lt;Foo&gt;&gt; Wheat
	BorderColor&lt;&lt;Foo&gt;&gt; Tomato
}
skinparam stereotypeCBackgroundColor YellowGreen
skinparam stereotypeCBackgroundColor&lt;&lt; Foo &gt;&gt; DimGray

Class01 &lt;&lt;Foo&gt;&gt;
Class03 &lt;&lt;Foo&gt;&gt;
Class01 &quot;1&quot; *-- &quot;many&quot; Class02 : contains

Class03 o-- Class04 : aggregation

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/26-Skinned+Stereotypes.uml'>
</div>

<div>
<h2>Color gradient</h2>
<div>It's possible to declare individual color for classes or note using the # notation.
<br>
You can use either <a href=http://www.w3schools.com/HTML/html_colornames.asp>standard color name</a>
or RGB code.
<p>
You can also use color gradient in background, with the following syntax:
two colors names separated either by:
<ul>
<li><code>|</code>,
<li><code>/</code>,
<li><code>\</code>,
<li>or <code>-</code>
</ul>
depending the direction of the gradient.
For example, you could have:</div>
<pre>&#64;startuml

skinparam backgroundcolor AntiqueWhite/Gold
skinparam classBackgroundColor Wheat|CornflowerBlue

class Foo #red-green
note left of Foo #blue\9932CC
  this is my
  note on this class
end note

package example #GreenYellow/LightGoldenRodYellow {
  class Dummy
}

@enduml
</pre>
<img src='${model.webapp}/uml/help/classes/27-Color+gradient.uml'>
</div>

<div>
<h2>Splitting large files</h2>
<pre>&#64;startuml
' Split into 4 pages
page 2x2

class BaseClass

namespace net.dummy #DDDDDD {
    .BaseClass &lt;|-- Person
    Meeting o-- Person
    
    .BaseClass &lt;|- Meeting

}

namespace net.foo {
  net.dummy.Person  &lt;|- Person
  .BaseClass &lt;|-- Person

  net.dummy.Meeting o-- Person
}

BaseClass &lt;|-- net.unused.Person
@enduml
		</pre>
<img src='${model.webapp}/uml/help/classes/28-Splitting+large+files.uml'>
</div>



</a:layout>
