$(function() {
	$('select.dynamic-select').each(function(i) {
		var children_id = $(this).data("children");
		var children = null;
		var option_null = "<option value=''></option>";
		if (children_id != null) {
			children = $.map(children_id.split("|"), function(id) {
				return $('#' + id);
			});
			
			var data = [];

			$.each(children, function(id){
				data.push($(this).html());
				$(this).parent().hide();
			});
			$(this).on('change', function() {
				var value = $(this).children(':selected').text();
				var escaped = value.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
				var parent = $(this);
				$.each(children, function(n, id){
					
					$(this).parent().hide();
					options = $(data[n]).filter("optgroup[label='"+escaped+"']").html();
					if (options) {
						$(this).html(option_null+options);
						$(this).parent().show();
					} else {
						$(this).empty();
						$(this).parent().hide();
					}
				});
				
			});
		}
	});
});