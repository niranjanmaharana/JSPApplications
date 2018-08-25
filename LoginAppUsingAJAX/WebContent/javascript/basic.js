$(document).ready(function() {
	$('#login').click(function() {
		$.ajax({
			url : 'LoginServlet',
			data : {
				userName : $('#userName').val()
			},
			success : function(responseText) {
				$('#ajaxGetUserServletResponse').text(responseText);
			}
		});
	});
});