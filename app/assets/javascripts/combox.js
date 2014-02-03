jQuery(document).ready(function() {
	$('select').each(function(i) {
		//var current = $(this);
		var children = $.map( $(this).data('children').split("|"), function(id) { return '#' + id; } );
		var initial_val = $(this).data('option-initial-value');
		var url_mask = $(this).data('option-url');
		var key_method = $(this).data('option-key-method');
		var value_method = $(this).data('option-value-method');
		var prompt = $(this).has('option[value=]').size() ? $(this).find('option[value=]') : $('<option value=\"\">').text('Select a value');
		var regexp = /:[0-9a-zA-Z_]+:/g;
		
		
		if ($(this).children('option').length <= 1) {
			$(this).attr('disabled', true);
		} else {
			
			url = url_mask.replace(regexp, $(this).val());
			$.getJSON(url, function(data) {
				$.each(data, function(i, object) {
					observer.append($('<option>').attr('value', object[key_method]).text(object[value_method]));
					observer.attr('disabled', false);
				});
				
				if (initial_val != null){
					$(this).val(initial_val);
					initial_val = null;
				}
				observer.change();
			});
			
			$.map(children, function(id){
				var child = $(id);
				child.on('change', function() {
					
				});
			});
		}
		
	});
});