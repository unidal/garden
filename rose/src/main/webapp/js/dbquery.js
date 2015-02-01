var dbQuery={
   changeSql:function(target){
      var value=target.options[target.options.selectedIndex].value;

      if (value) {
         var array = eval(value);
        
         this.selectOption($("#ds option"),array[0]);
         $("#explain")[0].checked=(array[1]==1?true:false);
         $("#sql")[0].value=array[2];
      }
   },

   selectOption:function(options, selected) {
	  options.each(function(option) {
	         if (option.value==selected || option.text==selected) {
	             option.selected=true;
	          }
	  });
   },
   
   changeStyle:function(){
      var style="width:"+$('#sql')[0].style.width+";height:"+$('#sql')[0].style.height;

      $("#style")[0].value=style;
   }
};

window.addEvent("domready",function(){
   $("#sql")[0].addEvent("mouseup",dbQuery.changeStyle);
});