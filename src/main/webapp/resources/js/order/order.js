var handle = $("#handle_value");

$("#handle").on("click", function() {
	if (handle.val() == 1) {
		handle.val(0);
		$(".sideInfo").css("transform", "translateX(-100%)");
		$("#handle").removeClass("expand");
		$("#handle").html("펼치기");
	} else {
		handle.val(1);
		$(".sideInfo").css("transform", "none");
		$("#handle").addClass("expand");
		$("#handle").html("접기");
	}
});
 

