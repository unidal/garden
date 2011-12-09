var dbQuery={
   changeSql:function(target){
      var value=target.options[target.options.selectedIndex].value;

      if (value) {
         var array = eval(value);
        
         this.selectOption($("ds").options,array[0]);
         ${"explain"}.checked=true;
         this.selectOption($("maxRow").options,array[2]);
         $("sql").value=array[3];
      }
   },

   selectOption:function(options,selected) {
      for (var i = 0; i < options.length; i++) {
         if (options[i].value==selected || options[i].text==selected) {
            options[i].selected=true;
         }
      }
   },
   
   changeStyle:function(){
      var style="width:"+$('sql').style.width+";height:"+$('sql').style.height;

      $("style").value=style;
   }
};

window.addEvent("domready",function(){
   $("sql").addEvent("mouseup",dbQuery.changeStyle);
});