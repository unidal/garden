var dbQuery={
	changeSql:function(target){
		$("sql").value=target.options[target.options.selectedIndex].text;
	},

	changeStyle:function(){
		var style="width:"+$('sql').style.width+";height:"+$('sql').style.height;
		$("style").value=style;
	}
}

window.addEvent("domready",function(){
	$("sql").addEvent("mouseup",dbQuery.changeStyle);
});