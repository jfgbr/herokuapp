jQuery(document).ready(function() {
	$('select[data-option-dependent=true]').each(function(i) {
		var observer_dom_id = $(this).attr('id');
		var observed_dom_id = $(this).data('option-observed').split("|");
		var observer_initial_val = $(this).data('option-observer-initial-value');
		var url_mask = $(this).data('option-url');
		var key_method = $(this).data('option-key-method');
		var value_method = $(this).data('option-value-method');
		var prompt = $(this).has('option[value=]').size() ? $(this).find('option[value=]') : $('<option value=\"\">').text('Select a value');
		var regexp = /:[0-9a-zA-Z_]+:/g;
		var observer = $('select#' + observer_dom_id);
		var observed = $.map(observed_dom_id, function(id) { return '#' + id; });//$('#' + observed_dom_id);
		
		

		if (!observer.val() && observed.length > 1) {
			observer.attr('disabled', true);
		}
		$.map(observed, function(id){
			var observed = $(id);
			observed.on('change', function() {
				observer.empty().append(prompt);			
					
				if (observed.val()) {
					$.each(observer, function(){
						url = url_mask.replace(regexp, observed.val());
						$.getJSON(url, function(data) {
							$.each(data, function(i, object) {
								observer.append($('<option>').attr('value', object[key_method]).text(object[value_method]));
								observer.attr('disabled', false);
							});
							
							if (observer_initial_val != null){
								observer.val(observer_initial_val);
								observer_initial_val = null;
							}
						});
					});
					
				}
			});
		});
		
		if (observer.val()) {
			observer.change();
		}
	});
}); 