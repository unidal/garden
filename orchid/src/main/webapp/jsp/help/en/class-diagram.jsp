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
<h1>Class Diagram
</h1>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Relations between classes
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>
<p>Relations between classes are defined using the following symbols :
</p>
<p>
</p>
<table border="1" cellspacing="0" cellpadding="5">
<tr>
<td>
<b>Type 
</b>
</td>
<td>
<b>Symbol 
</b>
</td>
<td>
<b>Drawing 
</b>
</td>
</tr>
<tr>
<td>Extension
</td>
<td>
<code>&lt;|--
</code>
</td>
<td>
<img>
</td>
</tr>
<tr>
<td>Composition
</td>
<td>
<code>*--
</code>
</td>
<td>
<img>
</td>
</tr>
<tr>
<td>Aggregation
</td>
<td>
<code>o--
</code>
</td>
<td>
<img>
</td>
</tr>
</table>
<p>It is possible to replace 
<code>--
</code> by 
<code>..
</code> to have a dotted line.
</p>
<p>Knowing those rules, it is possible to draw the following drawings:
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Class01 &lt;|-- Class02
Class03 *-- Class04
Class05 o-- Class06
Class07 .. Class08
Class09 -- Class10
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-00.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Class11 &lt;|.. Class12
Class13 --&gt; Class14
Class15 ..&gt; Class16
Class17 ..|&gt; Class18
Class19 &lt;--* Class20
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-01.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Class21 #-- Class22
Class23 x-- Class24
Class25 }-- Class26
Class27 +-- Class28
Class29 ^-- Class30
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-02.uml">
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
<h2>Label on relations
</h2>
<p>
</p>
<p>It is possible a add a label on the relation, using 
<code>:
</code>, followed by the text of the label.
</p>
<p>For cardinality, you can use double-quotes 
<code>&quot;&quot;
</code> on each side of the relation.
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

Class01 &quot;1&quot; *-- &quot;many&quot; Class02 : contains

Class03 o-- Class04 : aggregation

Class05 --&gt; &quot;1&quot; Class06

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-03.uml">
</div>
</div>
<p>You can add an extra arrow pointing at one object showing which object acts on the other object, using 
<code>&lt;
</code> or 
<code>&gt;
</code> at the begin or at the end of the label.
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
class Car

Driver - Car : drives &gt;
Car *- Wheel : have 4 &gt;
Car -- Person : &lt; owns

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-04.uml">
</div>
</div>
<a id="4">
</a>
<p> 
</p>
<p> 
</p>
<h2>Adding methods
</h2>
<p>To declare fields and methods, you can use the symbol 
<code>:
</code> followed by the field's or method's name.
</p>
<p>The system checks for parenthesis to choose between methods and fields.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Object &lt;|-- ArrayList

Object : equals()
ArrayList : Object[] elementData
ArrayList : size()

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-05.uml">
</div>
</div>
<p>
</p>
<p>It is also possible to group between brackets 
<code>{}
</code> all fields and methods.
</p>
<p>Note that the syntax is highly flexible about type/name order.
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
class Dummy {
  String data
  void methods()
}

class Flight {
   flightNumber : Integer
   departureTime : Date
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-06.uml">
</div>
</div>
<p>You can use 
<code>{field}
</code> and 
<code>{method}
</code> modifiers to override default behaviour of the parser about fields and methods.
</p>
<div>
<div class="mycell">

<pre>@startuml
class Dummy {
  {field} A field (despite parentheses)
  {method} Some method
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-07.uml">
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
<h2>Defining visibility
</h2>
<p>When you define methods or fields, you can use characters to define the visibility of the corresponding item:
</p>
<p>
</p>
<table border="1" cellspacing="0" cellpadding="5">
<tr>
<td>
<b>Character 
</b>
</td>
<td>
<b>Icon for field 
</b>
</td>
<td>
<b>Icon for method 
</b>
</td>
<td>
<b>Visibility 
</b>
</td>
</tr>
<tr>
<td>
<code>-
</code>
</td>
<td>
<img>
</td>
<td>
<img>
</td>
<td>private
</td>
</tr>
<tr>
<td>
<code>#
</code>
</td>
<td>
<img>
</td>
<td>
<img>
</td>
<td>protected
</td>
</tr>
<tr>
<td>
<code>~
</code>
</td>
<td>
<img>
</td>
<td>
<img>
</td>
<td>package private
</td>
</tr>
<tr>
<td>
<code>+
</code>
</td>
<td>
<img>
</td>
<td>
<img>
</td>
<td>public
</td>
</tr>
</table>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

class Dummy {
 -field1
 #field2
 ~method1()
 +method2()
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-08.uml">
</div>
</div>
<p>
</p>
<p>You can turn off this feature using the 
<code>skinparam classAttributeIconSize 0
</code> command :
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam classAttributeIconSize 0
class Dummy {
 -field1
 #field2
 ~method1()
 +method2()
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-09.uml">
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
<h2>Abstract and Static
</h2>
<p>
</p>
<p>
</p>
<p>You can define static or abstract methods or fields using the 
<code>{static}
</code> or 
<code>{abstract}
</code> modifier.
</p>
<p>These modifiers can be used at the start or at the end of the line. You can also use 
<code>{classifier}
</code> instead of 
<code>{static}
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
class Dummy {
  {static} String id
  {abstract} void methods()
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-10.uml">
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
<h2>Advanced class body
</h2>
<p>
</p>
<p>
</p>
<p>By default, methods and fields are automatically regrouped by PlantUML. You can use separators to define your own way of ordering fields and methods. The following separators are possible : 
<code>--
</code>
<code>..
</code>
<code>==
</code>
<code>__
</code>.
</p>
<p>You can also use titles within the separators:
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-11.uml">
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
<h2>Notes and stereotypes
</h2>
<p>Stereotypes are defined with the 
<code>class
</code> keyword, 
<code>&lt;&lt;
</code> and 
<code>&gt;&gt;
</code>.
</p>
<p>You can also define notes using 
<code>note left of
</code> , 
<code>note right of
</code> , 
<code>note top of
</code> , 
<code>note bottom of
</code> keywords.
</p>
<p>You can also define a note on the last defined class using 
<code>note left
</code>, 
<code>note right
</code>, 
<code>note top
</code>, 
<code>note bottom
</code>.
</p>
<p>A note can be also define alone with the 
<code>note
</code> keywords, then linked to other objects using the 
<code>..
</code> symbol.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-12.uml">
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
<h2>More on notes
</h2>
<p>
</p>
<p>It is also possible to use few html tags like :
</p>
<p>
</p>
<ul>
<li>
<code>&lt;b&gt;
</code>
</li>
<li>
<code>&lt;u&gt;
</code>
</li>
<li>
<code>&lt;i&gt;
</code>
</li>
<li>
<code>&lt;s&gt;
</code>, 
<code>&lt;del&gt;
</code>, 
<code>&lt;strike&gt;
</code>
</li>
<li>
<code>&lt;font color=&quot;#AAAAAA&quot;&gt;
</code> or 
<code>&lt;font color=&quot;colorName&quot;&gt;
</code>
</li>
<li>
<code>&lt;color:#AAAAAA&gt;
</code> or 
<code>&lt;color:colorName&gt;
</code>
</li>
<li>
<code>&lt;size:nn&gt;
</code> to change font size
</li>
<li>
<code>&lt;img src=&quot;file&quot;&gt;
</code> or 
<code>&lt;img:file&gt;
</code>: the file must be accessible by the filesystem
</li>
</ul>
<p>
</p>
<p>You can also have a note on several lines.
</p>
<p>You can also define a note on the last defined class using 
<code>note left
</code>, 
<code>note right
</code>, 
<code>note top
</code>, 
<code>note bottom
</code>.
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-13.uml">
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
<h2>Note on links
</h2>
<p>
</p>
<p>It is possible to add a note on a link, just after the link definition, using 
<code>note on link
</code>.
</p>
<p>You can also use 
<code>note left on link
</code>, 
<code>note right on link
</code>, 
<code>note top on link
</code>, 
<code>note bottom on link
</code> if you want to change the relative position of the note with the label.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-14.uml">
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
<h2>Abstract class and interface
</h2>
<p>
</p>
<p>You can declare a class as abstract using 
<code>abstract&quot;
</code> or 
<code>abstract class
</code> keywords.
</p>
<p>The class will be printed in 
<em>italic
</em>.
</p>
<p>
</p>
<p>You can use the 
<code>interface
</code>, 
<code>annotation
</code> and 
<code>enum
</code> keywords too.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-15.uml">
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
<h2>Using non-letters
</h2>
<p>
</p>
<p>If you want to use 
<a href="unicode">non-letters
</a> in the class (or enum...) display, you can either :
</p>
<ul>
<li>Use the 
<code>as
</code> keyword in the class definition
</li>
<li>Put quotes 
<code>&quot;&quot;
</code> around the class name
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
class &quot;This is my class&quot; as class1
class class2 as &quot;It works this way too&quot;

class2 *-- &quot;foo/dummy&quot; : use
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-16.uml">
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
<h2>Hide attributes, methods...
</h2>
<p>You can parameterize the display of classes using the 
<code>hide/show
</code> command.
</p>
<p>The basic command is: 
<code>hide empty members
</code>. This command will hide attributes or methods if they are empty.
</p>
<p>Instead of 
<code>empty members
</code>, you can use:
</p>
<ul>
<li>
<code>empty fields
</code> or 
<code>empty attributes
</code> for empty fields,
</li>
<li>
<code>empty methods
</code> for empty methods,
</li>
<li>
<code>fields
</code> or 
<code>attributes
</code> which will hide fields, even if they are described,
</li>
<li>
<code>methods
</code> which will hide methods, even if they are described,
</li>
<li>
<code>members
</code> which will hide fields 
<u>and
</u> methods, even if they are described,
</li>
<li>
<code>circle
</code> for the circled character in front of class name,
</li>
<li>
<code>stereotype
</code> for the stereotype.
</li>
</ul>
<p>You can also provide, just after the 
<code>hide
</code> or 
<code>show
</code> keyword:
</p>
<ul>
<li>
<code>class
</code> for all classes,
</li>
<li>
<code>interface
</code> for all interfaces,
</li>
<li>
<code>enum
</code> for all enums,
</li>
<li>
<code>&lt;&lt;foo1&gt;&gt;
</code> for classes which are stereotyped with 
<em>foo1
</em>,
</li>
<li>an existing class name.
</li>
</ul>
<p>You can use several 
<code>show/hide
</code> commands to define rules and exceptions.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-17.uml">
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
<h2>Hide classes
</h2>
<p>
</p>
<p>You can also use the 
<code>show/hide
</code> commands to hide classes.
</p>
<p>This may be useful if you define a large 
<a href="preprocessing">!included file
</a>, and if you want to hide come classes after 
<a href="preprocessing">file inclusion
</a>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

class Foo1
class Foo2

Foo2 *-- Foo1

hide Foo2

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-18.uml">
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
<h2>Use generics
</h2>
<p>
</p>
<p>You can also use bracket 
<code>&lt;
</code> and 
<code>&gt;
</code> to define generics usage in a class.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

class Foo&lt;? extends Element&gt; {
  int size()
}
Foo *- Element

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-19.uml">
</div>
</div>
<p>It is possible to disable this drawing using 
<code>skinparam genericDisplay old
</code> command.
</p>
<p>
<a id="16">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Specific Spot
</h2>
<p>Usually, a spotted character (C, I, E or A) is used for classes, interface, enum and abstract classes.
</p>
<p>But you can define your own spot for a class when you define the stereotype, adding a single character and a color, like in this example:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

class System &lt;&lt; (S,#FF7700) Singleton &gt;&gt;
class Date &lt;&lt; (D,orchid) &gt;&gt;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-20.uml">
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
<h2>Packages
</h2>
<p>You can define a package using the 
<code>package
</code> keyword, and optionally declare a background color for your package (Using a html color code or name).
</p>
<p>Note that package definitions can be nested.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

package &quot;Classic Collections&quot; #DDDDDD {
  Object &lt;|-- ArrayList
}

package net.sourceforge.plantuml {
  Object &lt;|-- Demo1
  Demo1 *- Demo2
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-21.uml">
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
<h2>Packages style
</h2>
<p>
</p>
<p>
</p>
<p>There are different styles available for packages.
</p>
<p>You can specify them either by setting a default style with the command : 
<code>skinparam packageStyle
</code>, or by using a stereotype on the package:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
scale 750 width
package foo1 &lt;&lt;Node&gt;&gt; {
  class Class1
}

package foo2 &lt;&lt;Rectangle&gt;&gt; {
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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-22.uml">
</div>
</div>
<p>
</p>
<p>You can also define links between packages, like in the following example:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

skinparam packageStyle rectangle

package foo1.foo2 {
}

package foo1.foo2.foo3 {
  class Object
}

foo1.foo2 +-- foo1.foo2.foo3

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-23.uml">
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
<h2>Namespaces
</h2>
<p>In packages, the name of a class is the unique identifier of this class. It means that you cannot have two classes with the very same name in different packages.
</p>
<p>In that case, you should use 
<a href="http://en.wikipedia.org/wiki/Namespace_%28computer_science%29">namespaces
</a> instead of packages.
</p>
<p>You can refer to classes from other namespaces by fully qualify them. Classes from the default namespace are qualified with a starting dot.
</p>
<p>Note that you don't have to explicitly create namespace : a fully qualified class is automatically put in the right namespace.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-24.uml">
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
<h2>Automatic namespace creation
</h2>
<p>
</p>
<p>
</p>
<p>You can define another separator (other than the dot) using the command : 
<code>set namespaceSeparator ???
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

set namespaceSeparator ::
class X1::X2::foo {
  some info
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-25.uml">
</div>
</div>
<p>You can disable automatic package creation using the command 
<code>set namespaceSeparator none
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

set namespaceSeparator none
class X1.X2.foo {
  some info
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-26.uml">
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
<h2>Lollipop interface
</h2>
<p>
</p>
<p>You can also define lollipops interface on classes, using the following syntax:
</p>
<ul>
<li>
<code>bar ()- foo
</code>
</li>
<li>
<code>bar ()-- foo
</code>
</li>
<li>
<code>foo -() bar
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
class foo
bar ()- foo
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-27.uml">
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
<h2>Changing arrows direction
</h2>
<p>By default, links between classes have two dashes 
<code>--
</code> and are vertically oriented. It is possible to use horizontal link by putting a single dash (or dot) like this:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Room o- Student
Room *-- Chair
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-28.uml">
</div>
</div>
<p>You can also change directions by reversing the link:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Student -o Room
Chair --* Room
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-29.uml">
</div>
</div>
<p>It is also possible to change arrow direction by adding 
<code>left
</code>, 
<code>right
</code>, 
<code>up
</code> or 
<code>down
</code> keywords inside the arrow:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
foo -left-&gt; dummyLeft 
foo -right-&gt; dummyRight 
foo -up-&gt; dummyUp 
foo -down-&gt; dummyDown
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-30.uml">
</div>
</div>
<p>You can shorten the arrow by using only the first character of the direction (for example, 
<code>-d-
</code> instead of 
<code>-down-
</code>) or the two first characters (
<code>-do-
</code>).
</p>
<p>Please note that you should not abuse this functionality : 
<em>Graphviz
</em> gives usually good results without tweaking.
</p>
<p>
<a id="23">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Association classes
</h2>
<p>You can define 
<em>association class
</em> after that a relation has been defined between two classes, like in this example:
</p>
<div>
<div class="mycell">

<pre>@startuml
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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-31.uml">
</div>
</div>
<p>You can define it in another direction:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
class Student {
  Name
}
Student &quot;0..*&quot; -- &quot;1..*&quot; Course
(Student, Course) . Enrollment

class Enrollment {
  drop()
  cancel()
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-32.uml">
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
<h2>Skinparam
</h2>
<p>
</p>
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
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-33.uml">
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
<h2>Skinned Stereotypes
</h2>
<p>
</p>
<p>You can define specific color and fonts for stereotyped classes.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-34.uml">
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
<h2>Color gradient
</h2>
<p>
</p>
<p>It's possible to declare individual color for classes or note using the # notation.
</p>
<p>You can use either 
<a href="color">standard color name
</a> or RGB code.
</p>
<p>You can also use color gradient in background, with the following syntax: two colors names separated either by:
</p>
<ul>
<li>
<code>|
</code>,
</li>
<li>
<code>/
</code>,
</li>
<li>
<code>\
</code>,
</li>
<li>or 
<code>-
</code>
</li>
</ul>depending the direction of the gradient.
<p>For example, you could have:
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-35.uml">
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
<h2>Help on layout
</h2>
<p>
</p>
<p>Sometimes, the default layout is not perfect...
</p>
<p>You can use 
<code>together
</code> keyword to group some classes together : the layout engine will try to group them (as if they were in the same package).
</p>
<p>You can also use 
<code>hidden
</code> links to force the layout.
</p>
<div>
<div class="mycell">

<pre>@startuml

class Bar1
class Bar2
together {
  class Together1
  class Together2
  class Together3
}
Together1 - Together2
Together2 - Together3
Together2 -[hidden]--&gt; Bar1
Bar1 -[hidden]&gt; Bar2


@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-36.uml">
</div>
</div>
<p>
</p>
<p>
</p>
<p>
<a id="28">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Splitting large files
</h2>
<p>Sometimes, you will get some very large image files.
</p>
<p>You can use the 
<code>page (hpages)x(vpages)
</code> command to split the generated image into several files :
</p>
<p>
<code>hpages
</code> is a number that indicated the number of horizontal pages, and 
<code>vpages
</code> is a number that indicated the number of vertical pages.
</p>
<p>You can also use some specific skinparam settings to put borders on splitted pages (see example).
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
' Split into 4 pages
page 2x2
skinparam pageMargin 10
skinparam pageExternalColor gray
skinparam pageBorderColor black

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
</div>
<div class="mycell">
<img src="/uml/help/class-diagram/class-diagram-37.uml">
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
