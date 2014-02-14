// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require bootstrap

// Date
Date.prototype.format = function (format) {
    var hours = this.getHours();
    var ttime = "AM";
    if(format.indexOf("t") > -1 && hours > 12) {
        hours = hours - 12;
        ttime = "PM";
     }

	var o = {
	    "M+": this.getMonth() + 1, //month
	    "d+": this.getDate(),    //day
	    "h+": hours,   //hour
	    "m+": this.getMinutes(), //minute
	    "s+": this.getSeconds(), //second
	    "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
	    "S": this.getMilliseconds(), //millisecond,
	    "t+": ttime
	};

	if (/(y+)/.test(format)) 
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		
	for (var k in o) 
		if (new RegExp("(" + k + ")").test(format))
	    	format = format.replace(RegExp.$1,
	      		RegExp.$1.length == 1 ? o[k] :
	        		("00" + o[k]).substr(("" + o[k]).length));
	return format;
};

jQuery.fn.newDate = function(format) {
	var sdate = this.val();
	var result = new Date();
	if (sdate != null && sdate != "") {
		var regmask = /(\d{4})\-(\d{2})-(\d{2})/g;
		var year = sdate.replace(regmask, "$1");
		var month = sdate.replace(regmask, "$2")-1;
		var day = sdate.replace(regmask, "$3");
		result = new Date(year, month, day);
	} 
	if (format != null && format != ""){
		return result.format(format);
	} else {
		return result;
	}
};


// Ajax
Array.prototype.json = function(url_mask, value){
	var regexp = /:[0-9a-zA-Z_]+:/g;
	if (url_mask != null) {
		var url = url_mask.replace(regexp, value);
		var array = this;
		
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
	}
};