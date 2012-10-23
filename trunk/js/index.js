$.isNull = function(str) {
	return ($(str).val() == null || $(str).val() == "") ? true : false;
}
//URL Get Parameters
$.urlParam = function(name) {
    var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results[1] || 0;
}
//Menu
$(document).ready(function() {
	var name = "#" + $.urlParam('page'); 
	$(name).css("color", "yellow");
});
//Check Members Area - User And Password
$.checkMembers = function() {
	if( $.isNull("#user") || $.isNull("#pass") ) {
		$("#loginErr").html("Enter UserName & Password.");
		return false;
	}
	$("#pass").val( $.md5($("#pass").val()) );
	return true;
}
//Check Transference Area - User And Password
$.checktransference = function() {
	if( $.isNull("#to") || $.isNull("#amount") ) {
		$("#transErr").html("Enter Id(To) & Amount To Send.");
		return false;
	}
	return true;
}