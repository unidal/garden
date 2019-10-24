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
<h1>Maths
</h1>
<p>You can use 
<a href="http://asciimath.org">AsciiMath
</a> or 
<a href="https://github.com/opencollab/jlatexmath">JLaTeXMath
</a> notation within PlantUML:
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
<p>or:
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
<h2>Standalone diagram
</h2>
<p>.qsd{float:right;width:336px;height:280px}
</p>
<p>You can also use 
<code>@startmath
</code>/
<code>@endmath
</code> to create standalone 
<a href="http://asciimath.org">AsciiMath
</a> formula.
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
<p>Or use 
<code>@startlatex
</code>/
<code>@endlatex
</code> to create standalone 
<a href="https://github.com/opencollab/jlatexmath">JLaTeXMath
</a> formula.
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
<h2>How is this working ?
</h2>To draw those formulas, PlantUML uses two OpenSource projects:
<p>
</p>
<ul>
<li>
<a href="https://github.com/asciimath/asciimathml/tree/master/asciimath-based">AsciiMath
</a> that converts AsciiMath notation to LaTeX expression.
</li>
<li>
<a href="https://github.com/opencollab/jlatexmath">JLatexMath
</a> that displays mathematical formulas written in LaTeX. JLaTeXMath is the best Java library to display LaTeX code.
</li>
</ul>
<p>
<a href="https://github.com/asciimath/asciimathml/blob/master/asciimath-based/ASCIIMathTeXImg.js">ASCIIMathTeXImg.js
</a> is small enough to be integrated into PlantUML standard distribution.
</p>
<p>Since 
<a href="https://github.com/opencollab/jlatexmath">JLatexMath
</a> is bigger, you have to 
<a href="http://beta.plantuml.net/plantuml-jlatexmath.zip">download it
</a> separately, then unzip the 4 jar files (
<em>batik-all-1.7.jar
</em>, 
<em>jlatexmath-minimal-1.0.3.jar
</em>, 
<em>jlm_cyrillic.jar
</em> and 
<em>jlm_greek.jar
</em>) in the same folder as PlantUML.jar.
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
