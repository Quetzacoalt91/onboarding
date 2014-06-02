$( document ).ready(function() {
	$('#onboarding-launch').click(function() {
		$('.onboarding .steps').hide();
		$('.onboarding .final').show();
	});

	$('.steps a').click(function() {
		$('.steps').animate({top: '-400px'}, 300);
	});

	$('#quick-start-button').click(function() {
		if ($('.steps').css('top') == '-400px')
		{
			$('.steps').animate({top: '-3px'}, 300);
			$('.quick-start-button').animate({top: '397px'}, 300);
		}
		else
		{
			$('.steps').animate({top: '-400px'}, 300);
			$('.quick-start-button').animate({top: '0px'}, 300);
		}
	});
});