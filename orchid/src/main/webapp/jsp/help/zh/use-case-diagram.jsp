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
<h1>用例图
</h1>
<p>
</p>
<p>Let's have few examples :
</p>
<p>Note that you can disable the shadowing using the 
<code>skinparam shadowing false
</code> command. 
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h3>= 用例 =
</h3>
<p>
</p>用例用圆括号括起来。
<p>也可以用关键字
<code>usecase
</code>来定义用例。 还可以用关键字
<code>as
</code>定义一个别名，这个别名可以在以后定义关系的时候使用。
</p>
<div>
<div class="mycell">

<pre>@startuml

(First usecase)
(Another usecase) as (UC2)  
usecase UC3
usecase (Last\nusecase) as UC4

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-00.uml">
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
<h3>= 角色 =
</h3>
<p>角色用两个冒号包裹起来。
</p>
<p>也可以用
<code>actor
</code>关键字来定义角色。 还可以用关键字
<code>as
</code>来定义一个别名，这个别名可以在以后定义关系的时候使用。
</p>
<p>后面我们会看到角色的定义是可选的。
</p>
<div>
<div class="mycell">

<pre>@startuml

:First Actor:
:Another\nactor: as Men2  
actor Men3
actor :Last actor: as Men4

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-01.uml">
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
<h2>用例描述
</h2>
<p>
</p>
<p>如果想定义跨越多行的用例描述，可以用双引号将其裹起来。
</p>
<p>还可以使用这些分隔符：
<code>--
</code>
<code>..
</code>
<code>==
</code>
<code>__
</code>。 并且还可以在分隔符中间放置标题。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

usecase UC1 as &quot;You can use
several lines to define your usecase.
You can also use separators.
--
Several separators are possible.
==
And you can add titles:
..Conclusion..
This allows large description.&quot;

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-02.uml">
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
<h2>基础示例
</h2>
<p>
</p>
<p>用箭头
<code>--&gt;
</code>连接角色和用例。
</p>
<p>横杠
<code>-
</code>越多，箭头越长。 通过在箭头定义的后面加一个冒号及文字的方式来添加标签。
</p>
<p>在这个例子中，
<em>User
</em>并没有定义，而是直接拿来当做一个角色使用。
</p>
<div>
<div class="mycell">

<pre>@startuml

User -&gt; (Start)
User --&gt; (Use the application) : A small label

:Main Admin: ---&gt; (Use the application) : This is\nyet another\nlabel

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-03.uml">
</div>
</div>
<p>
</p>
<p>
<a id="6">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h3>= 继承 =
</h3>
<p>如果一个角色或者用例继承于另一个，那么可以用
<code>&lt;|--
</code>符号表示。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:Main Admin: as Admin
(Use the application) as (Use)

User &lt;|-- Admin
(Start) &lt;|-- (Use)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-04.uml">
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
<h2>使用注释
</h2>
<p>可以用
<code>note left of
</code> , 
<code>note right of
</code> , 
<code>note top of
</code> , 
<code>note bottom of
</code>等关键字给一个对象添加注释。
</p>
<p>注释还可以通过
<code>note
</code>关键字来定义，然后用
<code>..
</code>连接其他对象。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:Main Admin: as Admin
(Use the application) as (Use)

User -&gt; (Start)
User --&gt; (Use)

Admin ---&gt; (Use)

note right of Admin : This is an example.

note right of (Use)
  A note can also
  be on several lines
end note

note &quot;This note is connected\nto several objects.&quot; as N2
(Start) .. N2
N2 .. (Use)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-05.uml">
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
<h2>构造类型
</h2>
<p>用 
<code>&lt;&lt;
</code> 和 
<code>&gt;&gt;
</code> 来定义角色或者用例的构造类型。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
User &lt;&lt; Human &gt;&gt;
:Main Database: as MySql &lt;&lt; Application &gt;&gt;
(Start) &lt;&lt; One Shot &gt;&gt;
(Use the application) as (Use) &lt;&lt; Main &gt;&gt;

User -&gt; (Start)
User --&gt; (Use)

MySql --&gt; (Use)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-06.uml">
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
<h2>改变箭头方向
</h2>
<p>默认连接是竖直方向的，用
<code>--
</code>表示，可以用一个横杠或点来表示水平连接。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:user: --&gt; (Use case 1)
:user: -&gt; (Use case 2)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-07.uml">
</div>
</div>
<p>也可以通过翻转箭头来改变方向。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
(Use case 1) &lt;.. :user:
(Use case 2) &lt;- :user:
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-08.uml">
</div>
</div>
<p>还可以通过给箭头添加
<code>left
</code>, 
<code>right
</code>, 
<code>up
</code>或
<code>down
</code>等关键字来改变方向。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
:user: -left-&gt; (dummyLeft) 
:user: -right-&gt; (dummyRight) 
:user: -up-&gt; (dummyUp)
:user: -down-&gt; (dummyDown)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-09.uml">
</div>
</div>
<p>这些方向关键字也可以只是用首字母或者前两个字母的缩写来代替。
</p>
<p>但是请注意，这样的缩写不要乱用，Graphviz不喜欢这样。
</p>
<p>
<a id="10">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>分割图示
</h2>
<p>用
<code>newpage
</code>关键字将图示分解为多个页面。
</p>
<div>
<div class="mycell">

<pre>@startuml
:actor1: --&gt; (Usecase1)
newpage
:actor2: --&gt; (Usecase2)
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-10.uml">
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
<h2>从左向右方向
</h2>
<p>默认从上往下构建图示。
</p>
<div>
<div class="mycell">

<pre>@startuml
'default
top to bottom direction
user1 --&gt; (Usecase 1)
user2 --&gt; (Usecase 2)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-11.uml">
</div>
</div>你可以用
<code>left to right direction
</code>命令改变图示方向。
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

left to right direction
user1 --&gt; (Usecase 1)
user2 --&gt; (Usecase 2)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-12.uml">
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
<h2>显示参数
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
<p>你也可以给构造的角色和用例指定特殊颜色和字体。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
skinparam handwritten true

skinparam usecase {
	BackgroundColor DarkSeaGreen
	BorderColor DarkSlateGray

	BackgroundColor&lt;&lt; Main &gt;&gt; YellowGreen
	BorderColor&lt;&lt; Main &gt;&gt; YellowGreen
	
	ArrowColor Olive
	ActorBorderColor black
	ActorFontName Courier

	ActorBackgroundColor&lt;&lt; Human &gt;&gt; Gold
}

User &lt;&lt; Human &gt;&gt;
:Main Database: as MySql &lt;&lt; Application &gt;&gt;
(Start) &lt;&lt; One Shot &gt;&gt;
(Use the application) as (Use) &lt;&lt; Main &gt;&gt;

User -&gt; (Start)
User --&gt; (Use)

MySql --&gt; (Use)

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-13.uml">
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
<h2>一个完整的例子
</h2>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
left to right direction
skinparam packageStyle rectangle
actor customer
actor clerk
rectangle checkout {
  customer -- (checkout)
  (checkout) .&gt; (payment) : include
  (help) .&gt; (checkout) : extends
  (checkout) -- clerk
}
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/use-case-diagram/use-case-diagram-14.uml">
</div>
</div>
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
