//=require jquery.select.js

$(function() {
	$.fn.newDate = function(sdate) {

		var regmask = /(\d{4})\-(\d{2})-(\d{2})/g;
		var year = sdate.replace(regmask, "$1");
		var month = sdate.replace(regmask, "$2")-1;
		var day = sdate.replace(regmask, "$3");
		return new Date(year, month, day);
	};

	$("div.datepicker").datepicker({
		defaultFormat : "yy-mm-dd",
		defaultDate : $.fn.newDate($("#appointment_appointment_date").val()),
		minDate : 0,
		maxDate : "+1M +10D",
		altField : "#appointment_appointment_date",
		altFormat : "yy-mm-dd",
		beforeShowDay : function(date) {
			var day = date.getDay();
			// day 0 equal Sunday
			return [(day != 0)];
		}
	});
	//$("div.datepicker").datepicker( "setDate", $("#appointment_appointment_date").val() );
});
