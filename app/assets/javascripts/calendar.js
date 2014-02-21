//
//= require jquery-ui/jquery-ui.min.js
$(function(){
	$(".calendar").calendar({
		rendered: function(){
			var val = $("#appointment_employee_id").val();
			if (val != null && val != "" && val > 0) return true;
			return false;
		}
	});
});