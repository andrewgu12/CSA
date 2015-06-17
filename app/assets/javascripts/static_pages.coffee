# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> 
	# $("#welcome").slideDown(800);
	$("#welcome").delay(300).slideDown(500);
	$("#csa").delay(800).slideDown(500);

	$('body').vegas
		timer: false,

		# autoplay: false,
		slides: [
			{src: '/assets/home_background.jpg'}
			{src: '/assets/background_2.jpg'}
			{src: '/assets/background_3.jpg'}
		],
		# transition: 'slideLeft'
