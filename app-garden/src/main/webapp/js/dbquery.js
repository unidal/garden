var dbQuery={
	changeSql:function(target){
		var text=target.options[target.options.selectedIndex].text;
		var pos=text.indexOf(' - ');

		if (pos>0) {
		  var sql=text.substring(pos+3);
		  var ds=text.substring(0,pos);
		  var options=$("ds").options; 

		  $("sql").value=sql;
		  
		  for (var i = 0; i < options.length; i++) {
			 if (options[i].text==ds) {
				 options[i].selected=true;
			 }
	      }
		}
	},

	changeStyle:function(){
		var style="width:"+$('sql').style.width+";height:"+$('sql').style.height;

		$("style").value=style;
	}
}

window.addEvent("domready",function(){
	$("sql").addEvent("mouseup",dbQuery.changeStyle);
});