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
<h1>对象图
</h1>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>对象的定义
</h2>
<p>.qsd{float:right;margin:15px 3px;width:336px;height:600px}@media(max-width:1300px){.qsd{width:300px}}@media(max-width:1250px){.qsd{width:160px}}
</p>
<p>使用关键字
<code>object
</code>定义实例。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
object firstObject
object &quot;My Second Object&quot; as o2
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-00.uml">
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
<h2>对象之间的关系
</h2>
<p>对象之间的关系用如下符号定义：
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
<b>Image 
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
<p>也可以用 
<code>..
</code> 来代替 
<code>--
</code> 以使用点线。
</p>
<p>知道了这些规则，就可以画下面的图：
</p>
<p>可以用冒号给关系添加标签，标签内容紧跟在冒号之后。
</p>
<p>用双引号在关系的两边添加基数。
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
object Object01
object Object02
object Object03
object Object04
object Object05
object Object06
object Object07
object Object08

Object01 &lt;|-- Object02
Object03 *-- Object04
Object05 o-- &quot;4&quot; Object06
Object07 .. Object08 : some labels
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-01.uml">
</div>
</div>
<a id="4">
</a>
<p> 
</p>
<p> 
</p>
<h2>添加属性
</h2>
<p>用冒号加属性名的形式声明属性。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

object user

user : name = &quot;Dummy&quot;
user : id = 123

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-02.uml">
</div>
</div>
<p>也可以用大括号批量声明属性。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml

object user {
  name = &quot;Dummy&quot;
  id = 123
}

@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/object-diagram/object-diagram-03.uml">
</div>
</div>
<a id="5">
</a>
<p> 
</p>
<p> 
</p>
<h2>类图中的通用特性
</h2>
<p>
</p>
<ul>
<li>
<a href="class-diagram#Visibility">可见性
</a>
</li>
<li>
<a href="class-diagram#Notes">定义注释
</a>
</li>
<li>
<a href="class-diagram#Using">使用包
</a>
</li>
<li>
<a href="class-diagram#Skinparam">美化输出内容
</a>
</li>
</ul>
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
