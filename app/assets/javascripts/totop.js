var go_down = $('body');
var winHeight = $(window).height();
$(function() {
	$("#topjs").hide();
	if ($(window).scrollTop() >= winHeight) $("#topjs").fadeIn("slow")
	var scrollDiv = $("#topjs");
	$(window).scroll(function() {
		if ($(window).scrollTop() <= winHeight) $(scrollDiv).fadeOut("slow")
		else $(scrollDiv).fadeIn("slow")
	});
	$("#topjs").click(function() {
		$("html, body").animate({scrollTop: 0}, "slow")
	})
});
