var interval = 500; // 500 ms
var changed = false;
var checksum = '';

function refresh() {
	if (changed) {
		var product = $('#product').val();
		var diagram = $('#diagram').val();
		var content = $("#content").val();

	   $.ajax({
		  url: contextpath + '/uml/edit?update=1&product='+product+'&diagram='+diagram+'&content='+encodeURIComponent(content),
		  type: 'POST',
		  async: false
		});
		$.ajax({
			  url: contextpath + '/uml/view/'+product+'/'+diagram+'?op=status',
			  type: 'POST',
			  async: false,
			  success: function(data) {
				  if (!data) return;

				  // called when successful
				  if (data.hasOwnProperty('checksum')) {
					  checksum=data.checksum;
					  
					  if (data.hasOwnProperty('svg')) {
						  $('#svg').html(data.svg);
						  $('#img').attr('src', '');
					  }
					  
					  if (data.hasOwnProperty('src')) {
						  $('#svg').html('');
						  $('#img').attr('src', data.src);
					  }
				  }
			  },
			  error: function(e) {
				// called when there is an error
				// console.log(e.message);
			  }
			});
	    changed = false;
	}
	
	setTimeout(refresh, interval);
}

$(document).ready(function () {
	$('#content').bind('input propertychange', function() {
		changed = true;
	});
	
	$('#content').bind('mouseup mousemove', function() {
        $('#es').val('height: '+this.style.height+'; width: '+this.style.width);
	});
	
	$('#product').change(function() {
		var product = $(this).children('option:selected').val();
		
		window.location.href="?product=" + product;
	});
	
	$('#diagram').change(function() {
		var product = $('#product').val();
		var diagram = $(this).children('option:selected').val();
		
		window.location.href="?product=" + product + "&diagram=" + encodeURIComponent(diagram);
	});
	
	$('#saveAs').bind('click', function() {
		var diagram = window.prompt("Please enter new uml file name. i.e. 'module/scenario1.uml'","module/scenario1.uml");
		
		if (diagram) {
			$('#newfile').val(diagram);
			$('#newfile').form.submit();
		}
	});
	
    $(function(){setTimeout(refresh, interval);});
});
