/**
 * @author 09314096750
 */
$(function() {
	
	$.widget("JGFaces.ajax", {
		
		options : {
			client : null
		},
		
		action : "",
		update : null,
		event : "",
		
		_create : function(){
			// register the widget name
			this.element.data('call', this.widgetName);
			
			this.parent = $("#"+this.element.data("for"));
			this.event = this.element.data("event");
			this.parent.bind(this.event + "." + this.widgetName, $.proxy(this,"_action"));
			this.action = this.element.data("action");
			this.actionResult = null;
			this.update = this.element.data("update");
			this.urlRegEx = /([0-9a-zA-Z_]+)((\/:[0-9a-zA-Z_]+:)+)(\/[0-9a-zA-Z_]+)(\.json)/;
			this.paramRegEx = /(:[0-9a-zA-Z_]+:)/g;
			
			//update
			if (this.update != null && this.update != "") {
				this.update = this.update.splitIDs();
			} else {
				this.update = [];
			}
			
			this.element.detach();
		},
		
		_destroy : function() {
			this.element.removeData('call');
    		$.Widget.prototype._destroy.apply(this, arguments);
		},
		
		_update : function() {
			var elem = this;
			//this.parent.trigger("update", this.actionResult);
			$.each(this.update, function(i,item){
				if (item)
					item.trigger("update");
			});
		},
		
		_action : function(data) {
			if (this.action != null) {
				//var url = this.action;
				//var params = url.replace(this.urlRegEx, "$2").match(this.paramRegEx);
				var values = [];
				var children = this.element.children("param");
				$.each(children, function(i, id) {
					values.push($("#"+id).val());
				});
				
				/*$.each(params, function(i, val) {
					url = url.replace(val,values[i]);
				});
				
				this.actionResult = this._ajax(url);*/
				this.actionResult = [];
				this.actionResult.ajax(this.action, values);
			}
			this._update();
		}
		/*,
		
		_ajax : function(url) {
			var elem = this;
			var result;
			$.ajax({
				type : "json",
				async:   false,
				url : this.action,
				data : data,
				success : function(data) {
					result = data;
				},
				error : function(request, textStatus, errorThrown) {
					alert("error");
				},
				complete : function() {
					//alert("complete");
				}
			});
			
			return result;
		}*/
	});
	
	$("ajax").ajax();
});
	