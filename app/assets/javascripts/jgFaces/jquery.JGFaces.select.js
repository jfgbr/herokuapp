/**
 * @author 09314096750
 */
$(function() {

	$.widget("JGFaces.select", $.JGFaces.base, {
		validator : null,

		_create : function() {
			this._super("_create");
			this.parent = this.element.parent();
			//this.parent = this.parent.hasClass("field-with-errors")?this.parent.parent():this.parent;
			this.parent = this.parent.is("span")?this.parent.parent():this.parent;
			this.action = this.element.data("action");
			this.keyMethod = this.element.data("option-key-method");
			this.valueMethod = this.element.data("option-value-method");
			this.initialOptionValue = this.element.data("option-initial-value");
			this.element.removeData();
			this.element.removeAttr("data-action");
			this.element.removeAttr("data-option-key-method");
			this.element.removeAttr("data-option-value-method");
			this.element.removeAttr("data-option-initial-value");
			
			var values = [];
    		var params = $("param[for='"+this.element.attr("id")+"']");
    		$.each(params, function(i, id) {
				var value = $("#"+$(id).val());					
				values.push(value);//(value != ""?value:"0"));
				$(this).detach();
			});
			this.paramValues = values;
		},
		
		_destroy : function() {
			this.element.removeData('call');
    		$.Widget.prototype._destroy.apply(this, arguments);
		},
		
		_update : function() {
			this._super("_update");
			if (this.action != null) {
				var elem = this.element;
				var options = [];
				
				if (this.paramValues != null && this.paramValues.length > 0) {
					this.actionResult = [];
					this.actionResult.ajax(this.action, this.paramValues);
					if (this.actionResult != null) {
						var option_null = "<option value=''></option>";
						var keyMethod = this.keyMethod;
						var valueMethod = this.valueMethod;
						
						$.each(this.actionResult, function(i, object) {
							if (options.length == 0) options.push($(option_null));
							options.push(($('<option>').attr('value', object[keyMethod]).text(object[valueMethod])));
						});
					}
				}
				
				elem.empty();
				if (options.length > 0) {
					elem.append(options);
					this.parent.show();
					//$('label[for="' + elem.attr('id') + '"]').parent().show();
				} else {
					this.parent.hide();
					//$('label[for="' + elem.attr('id') + '"]').parent().hide();
				}
				/*if (elem.hasClass('dynamic-select')) {
					elem.change();
				}*/
				
				if (this.initialOptionValue) {
					elem.val(this.initialOptionValue);
					this.initialOptionValue = null;
					elem.change();
				}
			}
			
		}
		
	});
	
	$("select.dynamic").select();
}); 