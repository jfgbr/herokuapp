$(function() {
	$('select.dynamic-select').each(function(i) {
		var children_id = $(this).data("children");
		var children = null;
		var initial_value = $(this).data("option-initial-value");
		var option_null = "<option value=''></option>";
		
		if (children_id != null) {
			children = $.map(children_id.split("|"), function(id) {
				return $('#' + id);
			});
			
			var data = [];
			//data.push($(this).html());
			$.each(children, function(id){
				data.push($(this).html());
				$(this).parent().hide();
			});
		}
					
		$(this).on('change', function() {
			var value = $(this).children(':selected').text();
			var escaped = value.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
			var parent = $(this);
			$.each(children, function(n, id){
				$(this).parent().hide();
				options = $(data[n]).filter("optgroup[label='"+escaped+"']").html();
				if (options) {
					options = options.replace('selected="selected"','');
					$(this).html(option_null+options);
					$(this).parent().show();
					$('label[for="'+$(this).attr('id')+'"]').parent().show();
					
					if ($(this).hasClass('dynamic-select')) {
						$(this).change();
					}
				} else {
					$(this).empty();
					$(this).parent().hide();
					$('label[for="'+$(this).attr('id')+'"]').parent().hide();
				}
			});
			
		});
		if (initial_value) {
			$(this).val(initial_value);
			initial_value = null;
			$(this).change();
		}
	});
});