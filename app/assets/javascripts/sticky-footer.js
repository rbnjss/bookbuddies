// When the window is loaded or resized
// Check if the content height is less than the window + footer height
// If yes, absolutely position the footer the bottom of the page


;(
	function() {
		'use strict';

		var footer = $('.js-sticky-footer');

		var windowHeight 		= window.innerHeight,
			footerHeight 		= $(footer).height(),
			headerHeight		= $('.header').height(),
			mainContentHeight	= $('.main__wrapper').height();
			
		// On load and on resize
		$(window).bind('load resize', function(){
			positionFooter();
			console.log(headerHeight)
		}); 


		function positionFooter() {
			var docW = window.innerWidth;
			if ((mainContentHeight + headerHeight) < (windowHeight - footerHeight) && docW > 768) {
				$(footer).addClass('sticky');
			} else {
				$(footer).removeClass('sticky');
			}
		}
	}
)();