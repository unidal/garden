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
<h1>时序图
</h1>
<a id="2">
</a>
<p> 
</p>
<p> 
</p>
<h2>简单示例
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>你可以用
<code>-&gt;
</code>来绘制参与者之间传递的消息， 而不必显式地声明参与者。
<p>你也可以使用 
<code>--&gt;
</code> 绘制一个虚线箭头。
</p>
<p>另外，你还能用 
<code>&lt;-
</code> 和 
<code>&lt;--
</code>，这不影响绘图，但可以提高可读性。 注意：仅适用于时序图，对于其它示意图，规则是不同的。
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

Alice -&gt; Bob: Another authentication Request
Alice &lt;-- Bob: another authentication Response
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-00.uml">
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
<h2>声明参与者
</h2>
<p>关键字 
<code>participant
</code> 用于改变参与者的先后顺序。
</p>
<p>
</p>
<p>你也可以使用其它关键字来声明参与者：
</p>
<ul>
<li>
<code>actor
</code>
</li>
<li>
<code>boundary
</code>
</li>
<li>
<code>control
</code>
</li>
<li>
<code>entity
</code>
</li>
<li>
<code>database
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
actor Foo1
boundary Foo2
control Foo3
entity Foo4
database Foo5
collections Foo6
Foo1 -&gt; Foo2 : To boundary
Foo1 -&gt; Foo3 : To control
Foo1 -&gt; Foo4 : To entity
Foo1 -&gt; Foo5 : To database
Foo1 -&gt; Foo6 : To collections

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-01.uml">
</div>
</div>
<p>
</p>
<p>关键字 
<code>as
</code> 用于重命名参与者
</p>
<p>你可以使用
<a href="color">RGB
</a>值或者颜色名修改 actor 或参与者的背景颜色。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
actor Bob #red
' The only difference between actor
'and participant is the drawing
participant Alice
participant &quot;I have a really\nlong name&quot; as L #99FF99
/' You can also declare:
   participant L as &quot;I have a really\nlong name&quot;  #99FF99
  '/

Alice-&gt;Bob: Authentication Request
Bob-&gt;Alice: Authentication Response
Bob-&gt;L: Log transaction
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-02.uml">
</div>
</div>
<p>您可以使用关键字 
<code>order
</code>自定义顺序来打印参与者。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
participant Last order 30
participant Middle order 20
participant First order 10
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-03.uml">
</div>
</div>
<p>
</p>
<p>
<a id="4">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>在参与者中使用非字母符号
</h2>
<p>
</p>
<p>你可以使用引号定义参与者，还可以用关键字 
<code>as
</code> 给参与者定义别名。
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice -&gt; &quot;Bob()&quot; : Hello
&quot;Bob()&quot; -&gt; &quot;This is very\nlong&quot; as Long
' You can also declare:
' &quot;Bob()&quot; -&gt; Long as &quot;This is very\nlong&quot;
Long --&gt; &quot;Bob()&quot; : ok
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-04.uml">
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
<h2>给自己发消息
</h2>
<p>参与者可以给自己发信息，
</p>
<p>消息文字可以用
<code>\n
</code>来换行。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice-&gt;Alice: This is a signal to self.\nIt also demonstrates\nmultiline \ntext
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-05.uml">
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
<h2>修改箭头样式
</h2>
<p>修改箭头样式的方式有以下几种:
</p>
<ul>
<li>表示一条丢失的消息：末尾加 
<code>x
</code>
</li>
<li>让箭头只有上半部分或者下半部分：将
<code>&lt;
</code>和
<code>&gt;
</code>替换成
<code>\
</code>或者 
<code>/
</code>
</li>
<li>细箭头：将箭头标记写两次 (如 
<code>&gt;&gt;
</code> 或 
<code>//
</code>)
</li>
<li>虚线箭头：用 
<code>--
</code> 替代 
<code>-
</code>
</li>
<li>箭头末尾加圈：
<code>-&gt;o
</code>
</li>
<li>双向箭头：
<code>&lt;-&gt;
</code>
</li>
</ul>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -&gt;x Alice
Bob -&gt; Alice
Bob -&gt;&gt; Alice
Bob -\ Alice
Bob \\- Alice
Bob //-- Alice

Bob -&gt;o Alice
Bob o\\-- Alice

Bob &lt;-&gt; Alice
Bob &lt;-&gt;o Alice
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-06.uml">
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
<h2>修改箭头颜色
</h2>
<p>你可以用以下记号修改箭头的颜色：
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -[#red]&gt; Alice : hello
Alice -[#0000FF]-&gt;Bob : ok
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-07.uml">
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
<h2>对消息序列编号
</h2>
<p>
</p>
<p>关键字 
<code>autonumber
</code> 用于自动对消息编号。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-08.uml">
</div>
</div>
<p>语句 
<code>autonumber 
&lt;em&gt;start
&lt;/em&gt;
</code> 用于指定编号的初始值，而 
<code>autonumber 
&lt;em&gt;start
&lt;/em&gt;
&lt;em&gt;increment
&lt;/em&gt;
</code> 可以同时指定编号的初始值和每次增加的值。
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response

autonumber 15
Bob -&gt; Alice : Another authentication Request
Bob &lt;- Alice : Another authentication Response

autonumber 40 10
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-09.uml">
</div>
</div>
<p>
</p>
<p>你可以在双引号内指定编号的格式。
</p>
<p>格式是由 Java 的
<code>DecimalFormat
</code>类实现的： (
<code>0
</code> 表示数字；
<code>#
</code> 也表示数字，但默认为0)。
</p>
<p>你也可以用 HTML 标签来制定格式。
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber &quot;&lt;b&gt;[000]&quot;
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response

autonumber 15 &quot;&lt;b&gt;(&lt;u&gt;##&lt;/u&gt;)&quot;
Bob -&gt; Alice : Another authentication Request
Bob &lt;- Alice : Another authentication Response

autonumber 40 10 &quot;&lt;font color=red&gt;&lt;b&gt;Message 0  &quot;
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-10.uml">
</div>
</div>
<p>你还可以用语句 
<code>autonumber stop
</code> 和 
<code>autonumber resume 
&lt;em&gt;increment
&lt;/em&gt;
&lt;em&gt;format
&lt;/em&gt;
</code> 来表示暂停或继续使用自动编号。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
autonumber 10 10 &quot;&lt;b&gt;[000]&quot;
Bob -&gt; Alice : Authentication Request
Bob &lt;- Alice : Authentication Response

autonumber stop
Bob -&gt; Alice : dummy

autonumber resume &quot;&lt;font color=red&gt;&lt;b&gt;Message 0  &quot;
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response

autonumber stop
Bob -&gt; Alice : dummy

autonumber resume 1 &quot;&lt;font color=blue&gt;&lt;b&gt;Message 0  &quot;
Bob -&gt; Alice : Yet another authentication Request
Bob &lt;- Alice : Yet another authentication Response
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-11.uml">
</div>
</div>
<p>
</p>
<p>
<a id="9">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>Page Title, Header and Footer
</h2>
<p>The 
<code>title
</code> keyword is used to add a title to the page.
</p>
<p>Pages can display headers and footers using 
<code>header
</code> and 
<code>footer
</code>.
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

header Page Header
footer Page %page% of %lastpage%

title Example Title

Alice -&gt; Bob : message 1
Alice -&gt; Bob : message 2

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-12.uml">
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
<h2>分割示意图
</h2>
<p>
</p>
<p>关键字 
<code>newpage
</code> 用于把一张图分割成多张。
</p>
<p>在 
<code>newpage
</code> 之后添加文字，作为新的示意图的标题。
</p>
<p>这样就能很方便地在 
<em>Word
</em> 中将长图分几页打印。
</p>
<div>
<div class="mycell">

<pre>@startuml

Alice -&gt; Bob : message 1
Alice -&gt; Bob : message 2

newpage

Alice -&gt; Bob : message 3
Alice -&gt; Bob : message 4

newpage A title for the\nlast page

Alice -&gt; Bob : message 5
Alice -&gt; Bob : message 6
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-13.uml">
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
<h2>组合消息
</h2>
<p>
</p>
<p>我们可以通过以下关键词将组合消息：
</p>
<ul>
<li>
<code>alt/else
</code>
</li>
<li>
<code>opt
</code>
</li>
<li>
<code>loop
</code>
</li>
<li>
<code>par
</code>
</li>
<li>
<code>break
</code>
</li>
<li>
<code>critical
</code>
</li>
<li>
<code>group
</code>, 后面紧跟着消息内容
</li>
</ul>
<p>
</p>
<p>可以在标头(header)添加需要显示的文字(
<code>group
</code>除外)。
</p>
<p>关键词 
<code>end
</code> 用来结束分组。
</p>
<p>注意，分组可以嵌套使用。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice -&gt; Bob: Authentication Request

alt successful case

	Bob -&gt; Alice: Authentication Accepted
	
else some kind of failure

	Bob -&gt; Alice: Authentication Failure
	group My own label
		Alice -&gt; Log : Log attack start
	    loop 1000 times
	        Alice -&gt; Bob: DNS Attack
	    end
		Alice -&gt; Log : Log attack end
	end
	
else Another type of failure

   Bob -&gt; Alice: Please repeat
   
end
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-14.uml">
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
<h2>给消息添加注释
</h2>
<p>我们可以通过在消息后面添加 
<code>note left
</code> 或者 
<code>note right
</code> 关键词来给消息添加注释。
</p>
<p>你也可以通过使用 
<code>end note
</code> 来添加多行注释。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Alice-&gt;Bob : hello
note left: this is a first note

Bob-&gt;Alice : ok
note right: this is another note

Bob-&gt;Bob : I am thinking
note left
	a note
	can also be defined
	on several lines
end note
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-15.uml">
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
<h2>其他的注释
</h2>
<p>
</p>
<p>可以使用
<code>note left of
</code>，
<code>note right of
</code>或
<code>note over
</code>在节点(participant)的相对位置放置注释。
</p>
<p>还可以通过修改
<a href="color">背景色
</a>来高亮显示注释。
</p>
<p>以及使用关键字
<code>end note
</code>来添加多行注释。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
participant Alice
participant Bob
note left of Alice #aqua
	This is displayed 
	left of Alice. 
end note
 
note right of Alice: This is displayed right of Alice.

note over Alice: This is displayed over Alice.

note over Alice, Bob #FFAAAA: This is displayed\n over Bob and Alice.

note over Bob, Alice
	This is yet another
	example of
	a long note.
end note
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-16.uml">
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
<h2>改变备注框的形状
</h2>
<p>你可以使用 
<code>hnote
</code> 和 
<code>rnote
</code> 这两个关键字来修改备注框的形状。
</p>
<div>
<div class="mycell">

<pre>@startuml
caller -&gt; server : conReq
hnote over caller : idle
caller &lt;- server : conConf
rnote over server
 &quot;r&quot; as rectangle
 &quot;h&quot; as hexagon
endrnote
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-17.uml">
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
<h2>Creole和HTML
</h2>
<p>
<a href="creole">可以使用creole格式。
</a>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
participant Alice
participant &quot;The **Famous** Bob&quot; as Bob

Alice -&gt; Bob : hello --there--
... Some ~~long delay~~ ...
Bob -&gt; Alice : ok
note left
  This is **bold**
  This is //italics//
  This is &quot;&quot;monospaced&quot;&quot;
  This is --stroked--
  This is __underlined__
  This is ~~waved~~
end note

Alice -&gt; Bob : A //well formatted// message
note right of Alice 
 This is &lt;back:cadetblue&gt;&lt;size:18&gt;displayed&lt;/size&gt;&lt;/back&gt; 
 __left of__ Alice. 
end note
note left of Bob 
 &lt;u:red&gt;This&lt;/u&gt; is &lt;color #118888&gt;displayed&lt;/color&gt; 
 **&lt;color purple&gt;left of&lt;/color&gt; &lt;s:red&gt;Alice&lt;/strike&gt; Bob**. 
end note
note over Alice, Bob
 &lt;w:#FF33FF&gt;This is hosted&lt;/w&gt; by &lt;img sourceforge.jpg&gt;
end note 
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-18.uml">
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
<h2>分隔符
</h2>
<p>
</p>
<p>你可以通过使用 
<code>==
</code> 关键词来将你的图表分割多个步骤。
</p>
<div>
<div class="mycell">

<pre>@startuml

== Initialization ==

Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

== Repetition ==

Alice -&gt; Bob: Another authentication Request
Alice &lt;-- Bob: another authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-19.uml">
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
<h3>= 引用 =
</h3>
<p>你可以在图中通过使用
<code>ref over
</code>关键词来实现引用
</p>
<div>
<div class="mycell">

<pre>@startuml
participant Alice
actor Bob

ref over Alice, Bob : init

Alice -&gt; Bob : hello

ref over Bob
  This can be on
  several lines
end ref
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-20.uml">
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
<h3>= 延迟 =
</h3>
<p>你可以使用
<code>...
</code>来表示延迟，并且还可以给延迟添加注释。
</p>
<div>
<div class="mycell">

<pre>@startuml

Alice -&gt; Bob: Authentication Request
...
Bob --&gt; Alice: Authentication Response
...5 minutes latter...
Bob --&gt; Alice: Bye !

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-21.uml">
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
<h3>= 空间 =
</h3>
<p>
</p>
<p>你可以使用
<code>|||
</code>来增加空间。
</p>
<p>还可以使用数字指定增加的像素的数量。
</p>
<div>
<div class="mycell">

<pre>@startuml

Alice -&gt; Bob: message 1
Bob --&gt; Alice: ok
|||
Alice -&gt; Bob: message 2
Bob --&gt; Alice: ok
||45||
Alice -&gt; Bob: message 3
Bob --&gt; Alice: ok

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-22.uml">
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
<h2>生命线的激活与撤销
</h2>
<p>关键字
<code>activate
</code>和
<code>deactivate
</code>用来表示参与者的生命活动。
</p>
<p>一旦参与者被激活，它的生命线就会显示出来。
</p>
<p>
<code>activate
</code>和
<code>deactivate
</code>适用于以上情形。
</p>
<p>
<code>destroy
</code>表示一个参与者的生命线的终结。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
participant User

User -&gt; A: DoWork
activate A

A -&gt; B: &lt;&lt; createRequest &gt;&gt;
activate B

B -&gt; C: DoWork
activate C
C --&gt; B: WorkDone
destroy C

B --&gt; A: RequestCreated
deactivate B

A -&gt; User: Done
deactivate A

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-23.uml">
</div>
</div>
<p>
</p>
<p>还可以使用嵌套的生命线，并且运行给生命线添加颜色。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
participant User

User -&gt; A: DoWork
activate A #FFBBBB

A -&gt; A: Internal call
activate A #DarkSalmon

A -&gt; B: &lt;&lt; createRequest &gt;&gt;
activate B

B --&gt; A: RequestCreated
deactivate B
deactivate A
A -&gt; User: Done
deactivate A

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-24.uml">
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
<h2>Return
</h2>
<p>A new command 
<code>return
</code> for generating a return message with optional text label. The point returned to is the point that cause the most recently activated life-line. The syntax is simply return label where label, if provided, can be any string acceptable on conventional messages.
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -&gt; Alice : hello
activate Alice
Alice -&gt; Alice : some action
return bye
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-25.uml">
</div>
</div>
<p>
</p>
<p>
<a id="22">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>创建参与者
</h2>
<p>
</p>
<p>你可以把关键字
<code>create
</code>放在第一次接收到消息之前，以强调本次消息实际上是在
<em>创建
</em>新的对象。
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -&gt; Alice : hello

create Other
Alice -&gt; Other : new

create control String
Alice -&gt; String
note right : You can also put notes!

Alice --&gt; Bob : ok

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-26.uml">
</div>
</div>
<p>
<a id="23">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>进入和发出消息
</h2>
<p>如果只想关注部分图示，你可以使用进入和发出箭头。
</p>
<p>使用方括号
<code>[
</code>和
<code>]
</code>表示图示的左、右两侧。
</p>
<div>
<div class="mycell">

<pre>@startuml
[-&gt; A: DoWork

activate A

A -&gt; A: Internal call
activate A

A -&gt;] : &lt;&lt; createRequest &gt;&gt;

A&lt;--] : RequestCreated
deactivate A
[&lt;- A: Done
deactivate A
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-27.uml">
</div>
</div>
<p>
</p>
<p>还可以使用下面的语法:
</p>
<div>
<div class="mycell">

<pre>@startuml
[-&gt; Bob
[o-&gt; Bob
[o-&gt;o Bob
[x-&gt; Bob

[&lt;- Bob
[x&lt;- Bob

Bob -&gt;]
Bob -&gt;o]
Bob o-&gt;o]
Bob -&gt;x]

Bob &lt;-]
Bob x&lt;-]
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-28.uml">
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
<h2>构造类型和圈点
</h2>
<p>
</p>
<p>
</p>
<p>可以使用
<code>&lt;&lt;
</code>和
<code>&gt;&gt;
</code>给参与者添加构造类型。
</p>
<p>在构造类型中，你可以使用
<code>(X,color)
</code>格式的语法添加一个圆圈圈起来的字符。
</p>
<div>
<div class="mycell">

<pre>@startuml

participant &quot;Famous Bob&quot; as Bob &lt;&lt; Generated &gt;&gt;
participant Alice &lt;&lt; (C,#ADD1B2) Testable &gt;&gt;

Bob-&gt;Alice: First message

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-29.uml">
</div>
</div>
<p>默认使用 
<em>guillemet
</em> 字符来显示构造类型。 你可以使用外观参数 
<code>guillemet
</code> 来修改显示行为。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

skinparam guillemet false
participant &quot;Famous Bob&quot; as Bob &lt;&lt; Generated &gt;&gt;
participant Alice &lt;&lt; (C,#ADD1B2) Testable &gt;&gt;

Bob-&gt;Alice: First message

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-30.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

participant Bob &lt;&lt; (C,#ADD1B2) &gt;&gt;
participant Alice &lt;&lt; (C,#ADD1B2) &gt;&gt;

Bob-&gt;Alice: First message

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-31.uml">
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
<h2>更多标题信息
</h2>
<p>你可以在标题中使用
<a href="creole">creole
</a>格式。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

title __Simple__ **communication** example

Alice -&gt; Bob: Authentication Request
Bob -&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-32.uml">
</div>
</div>在标题描述中使用
<code>\n
</code>表示换行。
<div>
<div class="mycell">

<pre>@startuml

title __Simple__ communication example\non several lines

Alice -&gt; Bob: Authentication Request
Bob -&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-33.uml">
</div>
</div>还可以使用关键字
<code>title
</code>和
<code>end title
</code>定义多行标题。
<div>
<div class="mycell">

<pre>@startuml

title
 &lt;u&gt;Simple&lt;/u&gt; communication example
 on &lt;i&gt;several&lt;/i&gt; lines and using &lt;font color=red&gt;html&lt;/font&gt;
 This is hosted by &lt;img:sourceforge.jpg&gt;
end title

Alice -&gt; Bob: Authentication Request
Bob -&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-34.uml">
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
<h2>包裹参与者
</h2>
<p>
</p>
<p>
</p>
<p>可以使用
<code>box
</code>和
<code>end box
</code>画一个盒子将参与者包裹起来。
</p>
<p>还可以在
<code>box
</code>关键字之后添加标题或者背景颜色。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

box &quot;Internal Service&quot; #LightBlue
	participant Bob
	participant Alice
end box
participant Other

Bob -&gt; Alice : hello
Alice -&gt; Other : hello

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-35.uml">
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
<h2>移除脚注
</h2>
<p>使用
<code>hide footbox
</code>关键字移除脚注。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

hide footbox
title Footer removed

Alice -&gt; Bob: Authentication Request
Bob --&gt; Alice: Authentication Response

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-36.uml">
</div>
</div>
<p>
<a id="28">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>外观参数(skinparam)
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
<p>你也可以修改其他渲染元素，如以下示例：
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam sequenceArrowThickness 2
skinparam roundcorner 20
skinparam maxmessagesize 60
skinparam sequenceParticipant underline

actor User
participant &quot;First Class&quot; as A
participant &quot;Second Class&quot; as B
participant &quot;Last Class&quot; as C

User -&gt; A: DoWork
activate A

A -&gt; B: Create Request
activate B

B -&gt; C: DoWork
activate C
C --&gt; B: WorkDone
destroy C

B --&gt; A: Request Created
deactivate B

A --&gt; User: Done
deactivate A

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-37.uml">
</div>
</div>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam backgroundColor #EEEBDC
skinparam handwritten true

skinparam sequence {
	ArrowColor DeepSkyBlue
	ActorBorderColor DeepSkyBlue
	LifeLineBorderColor blue
	LifeLineBackgroundColor #A9DCDF
	
	ParticipantBorderColor DeepSkyBlue
	ParticipantBackgroundColor DodgerBlue
	ParticipantFontName Impact
	ParticipantFontSize 17
	ParticipantFontColor #A9DCDF
	
	ActorBackgroundColor aqua
	ActorFontColor DeepSkyBlue
	ActorFontSize 17
	ActorFontName Aapex
}

actor User
participant &quot;First Class&quot; as A
participant &quot;Second Class&quot; as B
participant &quot;Last Class&quot; as C

User -&gt; A: DoWork
activate A

A -&gt; B: Create Request
activate B

B -&gt; C: DoWork
activate C
C --&gt; B: WorkDone
destroy C

B --&gt; A: Request Created
deactivate B

A --&gt; User: Done
deactivate A

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-38.uml">
</div>
</div>
<p>
</p>
<p>
<a id="29">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>填充区设置
</h2>
<p>
</p>
<p>可以设定填充区的参数配置。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam ParticipantPadding 20
skinparam BoxPadding 10

box &quot;Foo1&quot;
participant Alice1
participant Alice2
end box
box &quot;Foo2&quot;
participant Bob1
participant Bob2
end box
Alice1 -&gt; Bob1 : hello
Alice1 -&gt; Out : out
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/sequence-diagram/sequence-diagram-39.uml">
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
