window.addEvent("domready",function(){
	$("history").addEvent("change",function(){
		var target=$("history");
		$("sql").value=target.options[target.options.selectedIndex].text;
	});
	
	$("sql").addEvent("mouseup",function(){
		var style="width:"+$('sql').style.width+";height:"+$('sql').style.height;
		$("style").value=style;
	});
});