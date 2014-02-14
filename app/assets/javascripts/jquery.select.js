$(function() {
	$('select.dynamic-select').each(function(i) {
		var children_id = $(this).data("children");
		var children = null;
		var initial_value = $(this).data("option-initial-value");
		var regexp = /:[0-9a-zA-Z_]+:/g;
		
		if (children_id != null) {
			children = $.map(children_id.split("|"), function(id) {
				return $('#' + id);
			});
			
			var data = [];
			
			$.each(children, function(id){
				data.push($(this).html());
				$(this).parent().hide();
				$('label[for="' + $(this).attr('id') + '"]').parent().hide();
			});			
		}
					
		
		$(this).on('change', function() {
			var selected = $(this).children(':selected');
			var escaped = selected.text().replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
			var parent = $(this);
			
			if (children != null)
				$.each(children, function(n, id) {
					var url_mask = $(this).data('option-url');
					var key_method = $(this).data('option-key-method');
					var value_method = $(this).data('option-value-method');
					var options = [];
					var option_null = "<option value=''></option>";
					var newValues = false;
					var parent_val = (parent.val() == ""?"0":parent.val());
					//url = url_mask.replace(regexp, parent_val);
					var data = [];
					data.json(url_mask, parent_val);
					/*$.ajax({
						url : url,
						dataType : 'json',
						async : false,
						success : function(data) {*/
							if (data != null)
								$.each(data, function(i, object) {
									if (options.length == 0) options.push($(option_null));
									
									options.push(($('<option>').attr('value', object[key_method]).text(object[value_method])));
								});
	
						/*}
					});*/
					
					$(this).empty();
					if (options.length > 0) {
						$(this).append(options);
						$(this).parent().show();
						$('label[for="' + $(this).attr('id') + '"]').parent().show();
					} else {
						$(this).parent().hide();
						$('label[for="' + $(this).attr('id') + '"]').parent().hide();
					}
					if ($(this).hasClass('dynamic-select')) {
						$(this).change();
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