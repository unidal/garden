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
<h1>= 简介 =
</h1>
<p>您可以在PlantUML中用
<a href="http://asciimath.org">AsciiMath
</a> 或
<a href="https://github.com/opencollab/jlatexmath">JLaTeXMath
</a> 符号:
</p>
<p>

</p>
<pre>@startuml
:&lt;math&gt;int_0^1f(x)dx&lt;/math&gt;;
:&lt;math&gt;x^2+y_1+z_12^34&lt;/math&gt;;
note right
Try also
&lt;math&gt;d/dxf(x)=lim_(h-&gt;0)(f(x+h)-f(x))/h&lt;/math&gt;
&lt;latex&gt;P(y|\mathbf{x}) \mbox{ or } f(\mathbf{x})+\epsilon&lt;/latex&gt;
end note
@enduml
</pre>
<p>
<img src="/uml/help/ascii-math/ascii-math-00.uml">
</p>
<p>或:
</p>
<p>
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startuml
Bob -&gt; Alice : Can you solve: &lt;math&gt;ax^2+bx+c=0&lt;/math&gt;
Alice --&gt; Bob: &lt;math&gt;x = (-b+-sqrt(b^2-4ac))/(2a)&lt;/math&gt;
@enduml
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ascii-math/ascii-math-01.uml">
</div>
</div>
<p>
<a id="2">
</a>
</p>
<p> 
</p>
<p> 
</p>
<h2>独立图
</h2>
<p>
</p>
<p>您也可以用 
<code>@startmath
</code>/
<code>@endmath
</code> 来创建独立的 
<a href="http://asciimath.org">AsciiMath
</a> 公式。
</p>
<p>

</p>
<pre>@startmath
f(t)=(a_0)/2 + sum_(n=1)^ooa_ncos((npit)/L)+sum_(n=1)^oo b_n\ sin((npit)/L)
@endmath
</pre>
<p>
<img src="/uml/help/ascii-math/ascii-math-02.uml">
</p>
<p>
</p>
<p>或用 
<code>@startlatex
</code>/
<code>@endlatex
</code> 来创建独立的 
<a href="https://github.com/opencollab/jlatexmath">JLaTeXMath
</a> 公式。
</p>
<p>
</p>
<div>
<div class="mycell">

<pre>@startlatex
\sum_{i=0}^{n-1} (a_i + b_i^2)
@endlatex
</pre>
</div>
<div class="mycell">
<img src="/uml/help/ascii-math/ascii-math-03.uml">
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
<h2>这是如何工作的 ?
</h2>
<p>要绘制这此公式, PlantUML 使用了两个开源项目：
</p>
<p>
</p>
<ul>
<li>
<a href="https://github.com/asciimath/asciimathml/tree/master/asciimath-based">AsciiMath
</a> 转换 AsciiMath 符号为 LaTeX 表达式。
</li>
<li>
<a href="https://github.com/opencollab/jlatexmath">JLatexMath
</a> 来显示LaTex 数学公式。 JLaTeXMath 是最好的显示LaTeX代码的 Java 类库。
</li>
</ul>
<p>
<a href="https://github.com/asciimath/asciimathml/blob/master/asciimath-based/ASCIIMathTeXImg.js">ASCIIMathTeXImg.js
</a> 是一个小到足以集成到 PlantUML 标准发版的。
</p>
<p>由于 
<a href="https://github.com/opencollab/jlatexmath">JLatexMath
</a> 太大, 您要单独到 
<a href="http://beta.plantuml.net/plantuml-jlatexmath.zip">下载它
</a>, 然后解压 4 jar 文件 (
<em>batik-all-1.7.jar
</em>, 
<em>jlatexmath-minimal-1.0.3.jar
</em>, 
<em>jlm_cyrillic.jar
</em> 和 
<em>jlm_greek.jar
</em>) 到 PlantUML.jar同一目录下。
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
