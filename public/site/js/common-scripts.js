var Script = function () {


//    tool tips

    $('.tooltips').tooltip();

//    popovers

    $('.popovers').popover();

//    bxslider

    // $('.bxslider').show();
    // $('.bxslider').bxSlider({
    //     minSlides: 4,
    //     maxSlides: 4,
    //     slideWidth: 276,
    //     slideMargin: 20
    // });

}();

(function() {

	$(window).scroll(function() {
		if($(this).scrollTop() != 0) {
			$('#back-to-top').fadeIn();	
		} else {
			$('#back-to-top').fadeOut();
		}

	});

})();

