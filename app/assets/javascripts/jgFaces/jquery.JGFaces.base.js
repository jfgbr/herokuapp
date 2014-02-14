/**
 * @author 09314096750
 */
$(function() {
	//String
	String.prototype.splitIDs = function() {
		var result = Array();
		$.each(this.split(","), function(i, val) {
			var elem = $("#"+val);
			result.push(elem);
		});				
		return result;
	};
	
	// Ajax
	Array.prototype.ajaxURLRegEx = function() {
		return /([0-9a-zA-Z_]+)((\/:[0-9a-zA-Z_]+:)+)(\/[0-9a-zA-Z_]+)(\.json)/;
	};
	Array.prototype.ajaxParamRegEx = function() {
		return /(:[0-9a-zA-Z_]+:)/g;
	};	
	Array.prototype.ajax = function(urlMask, values){
		var urlRegEx = this.ajaxURLRegEx();
		var paramRegEx = this.ajaxParamRegEx();
/*		this.ajax(urlMask, values, urlRegEx, paramRegEx);
	};
	Array.prototype.ajax = function(urlMask, values, urlRegEx, paramRegEx){*/
		var params = urlMask.replace(urlRegEx, "$2").match(paramRegEx);
		var array = this;
		var result;
		var url = urlMask;
		
		$.each(params, function(i, val) {
			var v = values[i].val();
			url = url.replace(val,(v != ""?v:"0"));
		});
		
		$.ajax({
			url : url,
			dataType : 'json',
			async : false,
			success : function(data) {
				if (data != null) {
					$.each(data, function(i, object) {
						array.push(object);
					});	
				}
			}
		});
		
		
	};
	
	$.widget("JGFaces.base", {
		children : null,

		_create : function() {
			// register the widget name
			this.element.data('call', this.widgetName);
			if (this.element.attr("id")==null) {
				var id = $.fn.id();
				this.element.attr("id", id);
				this.element.attr("name", id);
			}
			
			this.element.bind("update." + this.widgetName, $.proxy(this,"_update"));
			//this.action = this.element.attr("action");
			
			//update
			/*this.update = this.element.data("update");
			if (this.update != null && this.update != "") {
				this.update = this.update.splitIDs();
			} else {
				this.update = [];
			}*/

		},
		
		_init : function() {
			this._update();			
		},
		
		_destroy : function() {
			this.element.removeData('call');
    		$.Widget.prototype._destroy.apply(this, arguments);
		},
		
		_process : function() {
		},
		
		_update : function(event,data) {
			/*var elem = this;
			$.each(this.update, function(i,item){
				if (item)
					item.trigger("update");
			});*/
		}
	});
	
	$.fn.call = function(){
	  return this[this.data('call')].apply(this, arguments);
	};
	
	var countId = 0;
	
	$.fn.id = function(){
		return "id_" + (countId++);
	};
}); 