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
<h2>= 类图 =
</h2>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>类之间的关系
</h2>
<p>
</p>
<p>类之间的关系通过下面的符号定义 :
</p>
<p>
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
<td>Extension（扩展）
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
<td>Composition（组合）
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
<td>Aggregation（聚合）
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
<p>
</p>
<p>使用
<code>..
</code> 来代替 
<code>--
</code> 可以得到点 线.
</p>
<p>
</p>
<p>在这些规则下，也可以绘制下列图形
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
<h2>关系上的标识
</h2>
<p>
</p>
<p>在关系之间使用标签来说明时, 使用 
<code>:
</code>后接 标签文字。
</p>
<p>对元素的说明，你可以在每一边使用 
<code>&quot;&quot;
</code> 来说明.
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
<p>在标签的开始或结束位置添加
<code>&lt;
</code> 或 
<code>&gt;
</code>以表明是哪个对象作用到哪个对象上。
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
<h2>添加方法
</h2>
<p>
</p>
<p>
</p>
<p>为了声明字段(对象属性）或者方法，你可以使用 后接字段名或方法名。
</p>
<p>系统检查是否有括号来判断是方法还是字段。
</p>
<p>
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
<p>也可以使用
<code>{}
</code> 把字段或者方法括起来
</p>
<p>注意，这种语法对于类型/名字的顺序是非常灵活的。
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
<p>你可以（显式地）使用 
<code>{field}
</code> 和 
<code>{method}
</code> 修饰符来覆盖解析器的对于字段和方法的默认行为
</p>
<blockquote>You can use 
<code>{field}
</code> and 
<code>{method}
</code> modifiers to override default behaviour of the parser about fields and methods.
</blockquote>
<p>
</p>
<p>
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
<h2>定义可访问性
</h2>
<p>一旦你定义了域或者方法，你可以定义 相应条目的可访问性质。
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
<p>你可以采用以下命令停用这些特性 
<code>skinparam classAttributeIconSize 0
</code> ：
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
<h2>抽象与静态
</h2>
<p>
</p>
<p>
</p>
<p>通过修饰符
<code>{static}
</code>或者
<code>{abstract}
</code>，可以定义静态或者抽象的方法或者属性。
</p>
<p>这些修饰符可以写在行的开始或者结束。也可以使用
<code>{classifier}
</code>这个修饰符来代替
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
<h2>高级类体
</h2>
<p>
</p>
<p>
</p>
<p>PlantUML默认自动将方法和属性重新分组，你可以自己定义分隔符来重排方法和属性，下面的分隔符都是可用的：
<code>--
</code>
<code>..
</code>
<code>==
</code>
<code>__
</code>.
</p>
<p>还可以在分隔符中添加标题：
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
<h2>备注和模板
</h2>
<p>
</p>
<p>模板通过类关键字("<<"和">>")来定义
</p>
<p>你可以使用
<code>note left of
</code> , 
<code>note right of
</code> , 
<code>note top of
</code> , 
<code>note bottom of
</code>这些关键字来添加备注。
</p>
<p>你还可以在类的声明末尾使用
<code>note left
</code>, 
<code>note right
</code>,
<code>note top
</code>, 
<code>note bottom
</code>来添加备注。
</p>
<p>此外，单独用
<code>note
</code>这个关键字也是可以的，使用 
<code>..
</code> 符号可以作出一条连接它与其它对象的虚线。
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
<h2>更多注释
</h2>
<p>
</p>
<p>可以在注释中使用部分html标签：
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
<p>你也可以在注释中展示多行。
</p>
<p>你也可以在定义的class之后直接使用 
<code>note left
</code>, 
<code>note right
</code>, 
<code>note top
</code>, 
<code>note bottom
</code> 来定义注释。
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
<h2>链接的注释
</h2>
<p>
</p>
<p>在定义链接之后，你可以用 
<code>note on link
</code> 给链接添加注释
</p>
<p>如果想要改变注释相对于标签的位置，你也可以用 
<code>note left on link
</code>， 
<code>note right on link
</code>， 
<code>note bottom on link
</code>。（对应位置分别在label的左边，右边，下边）
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
<h2>抽象类和接口
</h2>
<p>
</p>
<p>用关键字
<code>abstract
</code>或
<code>abstract class
</code>来定义抽象类。抽象类用斜体显示。 也可以使用
<code>interface
</code>, 
<code>annotation
</code> 和 
<code>enum
</code>关键字。
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
<h2>使用非字母字符
</h2>
<p>如果你想在类（或者枚举）的显示中使用
<a href="unicode">非字母符号
</a>，你可以：
</p>
<ul>
<li>在类的定义中使用 
<code>as
</code> 关键字
</li>
<li>在类名旁边加上 
<code>&quot;&quot;
</code>
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
<h2>隐藏属性、函数等
</h2>
<p>通过使用命令“
<code>hide/show
</code>”，你可以用参数表示类的显示方式。
</p>
<p>基础命令是: 
<code>hide empty members
</code>. 这个命令会隐藏空白的方法和属性。
</p>
<p>除 
<code>empty members
</code> 外，你可以用:
</p>
<ul>
<li>
<code>empty fields
</code> 或者 
<code>empty attributes
</code> 空属性,
</li>
<li>
<code>empty methods
</code> 空函数，
</li>
<li>
<code>fields
</code> 或 
<code>attributes
</code> 隐藏字段或属性，即使是被定义了
</li>
<li>
<code>methods
</code> 隐藏方法，即使是被定义了
</li>
<li>
<code>members
</code> 隐藏字段 
<u>和
</u> 方法，即使是被定义了
</li>
<li>
<code>circle
</code> 类名前带圈的，
</li>
<li>
<code>stereotype
</code> 原型。
</li>
</ul>同样可以使用 
<code>hide
</code> 或 
<code>show
</code> 关键词，对以下内容进行设置：
<ul>
<li>
<code>class
</code> 所有类，
</li>
<li>
<code>interface
</code> 所有接口，
</li>
<li>
<code>enum
</code> 所有枚举，
</li>
<li>
<code>&lt;&lt;foo1&gt;&gt;
</code> 实现 
<em>foo1
</em> 的类，
</li>
<li>一个既定的类名。
</li>
</ul>
<p>你可以使用 
<code>show/hide
</code> 命令来定义相关规则和例外。
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
<h2>隐藏类
</h2>
<p>
</p>
<p>你也可以使用 
<code>show/hide
</code> 命令来隐藏类
</p>
<p>如果你定义了一个大的
<a href="preprocessing">!included
</a> 文件，且想在文件包含之后隐藏部分类，该功能会很有帮助。
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
<h2>泛型（generics）
</h2>
<p>
</p>
<p>你可以用 
<code>&lt;
</code> 和 
<code>&gt;
</code> 来定义类的泛型。
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
<h2>指定标记（Spot）
</h2>
<p>通常标记字符 (C, I, E or A) 用于标记 类(classes), 接口（interface）, 枚举（enum）和 抽象类（abstract classes）.
</p>
<p>但是当你想定义原型时，可以增加对应的单个字符及颜色，来定义自己的标记（spot），就像下面一样：
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
<h3>= 包 =
</h3>
<p>你可以通过关键词 
<code>package
</code> 声明包，同时可选的来声明对应的背景色（通过使用html色彩代码或名称）。
</p>
<p>注意：包可以被定义为嵌套。
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
<h2>包样式
</h2>
<p>包可以定义不同的样式。
</p>
<p>你可以通过以下的命令来设置默认样式 : 
<code>skinparam packageStyle
</code>,或者对包使用对应的模板:
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
<p>你也可以参考下面的示例来定义包之间的连线:
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
<h2>命名空间（Namespaces）
</h2>
<p>在使用包（package）时（区别于命名空间），类名是类的唯一标识。 也就意味着，在不同的包（package）中的类，不能使用相同的类名。
</p>
<p>
</p>
<blockquote>In packages, the name of a class is the unique identifier of this class. It means that you cannot have two classes with the very same name in different packages.
</blockquote>
<p>在那种情况下（译注：同名、不同全限定名类），你应该使用
<a href="https://zh.wikipedia.org/wiki/%E5%91%BD%E5%90%8D%E7%A9%BA%E9%97%B4">命名空间
</a>来取而代之。
</p>
<blockquote>In that case, you should use 
<a href="http://en.wikipedia.org/wiki/Namespace_%28computer_science%29">namespaces
</a> instead of packages.
</blockquote>
<p>你可以从其他命名空间，使用全限定名来引用类， 默认命名空间（译注：无名的命名空间）下的类，以一个“."开头（的类名）来引用（译注：示例中的
<code>BaseClass
</code>).
</p>
<p>
</p>
<blockquote>You can refer to classes from other namespaces by fully qualify them. Classes from the default namespace are qualified with a starting dot.
</blockquote>
<p>注意：你不用显示地创建命名空间：一个使用全限定名的类会自动被放置到对应的命名空间。
</p>
<blockquote>Note that you don't have to explicitly create namespace : a fully qualified class is automatically put in the right namespace.
</blockquote>
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
</p>
<blockquote>- 
<code>.BaseClass
</code>为默认命名空间下的类 - 
<code>net.unused.
</code>为自动生成的命名空间
</blockquote>
<a id="20">
</a>
<p> 
</p>
<p> 
</p>
<h2>自动创建命名空间
</h2>
<p>
</p>
<p>
</p>
<p>使用命令 
<code>set namespaceSeparator ???
</code> 你可以自定义命名空间分隔符（为 “.” 以外的字符）.
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
<p>禁止自动创建包则可以使用 
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
<h2>棒棒糖 接口
</h2>
<p>
</p>
<p>需要定义棒棒糖样式的接口时可以遵循以下语法:
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
<h2>改变箭头方向
</h2>
<p>类之间默认采用两个破折号 
<code>--
</code> 显示出垂直 方向的线. 要得到水平方向的可以像这样使用单破折号 (或者点):
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
<p>你也可以通过改变倒置链接来改变方向
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
<p>也可通过在箭头内部使用关键字， 例如
<code>left
</code>, 
<code>right
</code>, 
<code>up
</code> 或者 
<code>down
</code>，来改变方向
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
<h2>“关系”类
</h2>
<p>你可以在定义了两个类之间的关系后定义一个 
<em>关系类 association class
</em> 例如:
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
<p>也可以用另一种方式:
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
<h2>皮肤参数
</h2>
<p>
</p>
<p>用
<code>
&lt;a href=&quot;skinparam&quot;&gt;skinparam
&lt;/a&gt;
</code>改变字体和颜色。
</p>
<p>可以在如下场景中使用：
</p>
<ul>
<li>在图示的定义中，
</li>
<li>
<a href="preprocessing">在引入的文件中
</a>，
</li>
<li>在
<a href="command-line">命令行
</a>或者
<a href="ant-task">ANT任务
</a>提供的配置文件中。
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
<h2>辅助布局
</h2>
<p>有时候，默认布局并不完美...
</p>
<p>你可以使用 
<code>together
</code> 关键词将某些类进行分组： 布局引擎会尝试将它们捆绑在一起（如同在一个包(package)内)
</p>
<p>你也可以使用建立 
<code>隐藏
</code> 链接的方式来强制布局
</p>
<p>
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
<h2>拆分大文件
</h2>
<p>有些情况下，会有一些很大的图片文件。
</p>
<p>可以用 
<code>page (hpages)x(vpages)
</code> 这个命令把生成的图片文件拆分成若干个文件。
</p>
<p>
<code>hpages
</code> 用来表示水平方向页面数， and 
<code>vpages
</code> 用来表示垂直方面页面数。
</p>
<p>你也可以使用特定的皮肤设定来给分页添加边框（见例子）
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
