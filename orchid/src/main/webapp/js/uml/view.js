var interval = 1000; // ms
var uri = '';
var checksum = '';

function refresh() {
	$.ajax({
		  url: uri + '?op=status&checksum=' + checksum,
		  type: 'POST',
		  async: true,
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
			console.log(e.message);
		  }
		});
	
	setTimeout(refresh, interval);
}

$(document).ready(function () {
	uri = $('#diagram').attr('data-uri');
	checksum = $('#diagram').attr('data-checksum');

	$(function(){ setTimeout(refresh, interval); });
});