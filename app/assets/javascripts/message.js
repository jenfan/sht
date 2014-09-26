function write_msg() {
	var body = $("#body").val();
	var request = $.ajax({
	  url: "/create_msg",
	  type: "POST",
	  data: { body : body }
	});

	request.done(function( msg ) {
	  $("#body").val();
	  $("#body").fadeTo(200, 0.1).val('').fadeTo(300, 1.0)
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  alert( "Request failed: " + textStatus );
	});
}

function save_gps() {
	var gps = $("#gps").val();
	var request = $.ajax({
	  url: "/save_gps",
	  type: "POST",
	  data: { gps : gps }
	});

	request.done(function( msg ) {
	  $("#gps").fadeTo(200, 0.1).fadeTo(300, 1.0)
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  alert( "Request failed: " + textStatus );
	});
}





$(document).ready(function(){
	$('#submit').click(write_msg);
	$('#submit_gps').click(save_gps);
	$("#body").keypress(function(e){
		if(e.keyCode==13){		     	
			write_msg();
		}
	});
});