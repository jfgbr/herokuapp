/**
 * @author 09314096750
 */
$(function() {

	$.widget("JGFaces.calendar", $.JGFaces.base, {
		
		validator : null,

		_create : function() {
			this._super("_create");
			var elem = this.element;
			
			this.action = elem.data("action");
			this.defaultFormat = elem.data("default-format");
			this.altField = elem.data("alt-field");
			this.altFormat = elem.data("alt-format");
			this.defaultDate = $(this.altField).newDate();//elem.data("defaultDate");
			this.minDate = elem.data("min-date");
			this.maxDate = elem.data("max-date");
			this.element.bind("beforeShowDay." + this.widgetName, $.proxy(this,"_beforeShowDay"));
			
			var values = [];
    		var params = $("param[for='"+elem.attr("id")+"']");
    		$.each(params, function(i, id) {
				var value = $("#"+$(id).val());					
				values.push(value);
			});
			this.yearMonth = $("<span></span>").val("0");
			values.push(this.yearMonth);
			this.spanMonth = $("<span></span>").val("0");
			values.push(this.spanMonth);
			this.paramValues = values;
			this._update();
			
		},
		
		_destroy : function() {
			this.element.removeData('call');
    		$.Widget.prototype._destroy.apply(this, arguments);
		},
		
		_update : function() {
			this._super("_update");
			if (this.paramValues != null && this.paramValues.length > 0) {
				var currentDate = new Date;
				if (this.calendar != null) currentDate = this.calendar.datepicker( "getDate" ); 
				this._action(currentDate.getFullYear(),currentDate.getMonth()+1);
				this._createCalendar();
				if (this.options.rendered ? this.options.rendered.apply(this.calendar, []) : true)
					this.element.parent().show();
				else
					this.element.parent().hide();
			} 
		},
		
		_action : function (year, month) {
			this.actionResult = [];
			this.yearMonth.val(year);
			this.spanMonth.val(month);
			this.actionResult.ajax(this.action, this.paramValues);
		},
		
		_beforeShowDay : function(date) {
			var string = $.datepicker.formatDate('yy-mm-dd', date);
    		var day = date.getDay();
    		var inArray = false;
    		
			if (this.actionResult != null && this.actionResult.length > 0) {
				inArray = (this.actionResult.indexOf(string) != -1);
			}
			// day 0 equal Sunday
			return [!((day == 0) ||  inArray)];
		},
		
		_createCalendar : function() {
			var t = this;
			var elem = t.element;
			
			if (this.calendar != null) this.calendar.remove();
			this.calendar = $("<div id='cal_"+ elem.attr("id") +"'></div>");
			this.element.parent().hide();
			this.calendar.datepicker({
				defaultFormat : this.defaultFormat,
				defaultDate : this.defaultDate,
				minDate : this.minDate,
				maxDate : this.maxDate,
				altField : this.altField,
				altFormat : this.altFormat,
				onChangeMonthYear: function(year, month, inst){
					t._action(year, month);
				},
				beforeShowDay : function(date) {
					return t._beforeShowDay(date);
				}});
			
			elem.append(this.calendar);
		}
		
	});
	
	//$(".calendar").calendar();
}); 