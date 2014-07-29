$( document ).ready(function() {
	$('#onboarding-launch').click(function() {
		$('.gwd-page-container').addClass('gwd-gen-oxd9');
		//$('.onboarding .steps').hide();
		//$('.onboarding .final').show();
	});

	$('.steps a').click(function() {
		$('.steps').animate({top: '-560px'}, 300);
	});

	$('<div class="alert alert-onboarding"></div>').html($('#onboarding-starter')).detach().prependTo('#content');

	$('#onboarding-starter').removeClass('hide');

	$('.close-button, .continue_editing').click(function() {
		console.log('totot');
		toggleOnboardingModal();
		validateStep(current_step_onboarding);
	});

	if (display_onboarding_modal)
		toggleOnboardingModal();
		
});

function toggleOnboardingModal() 
{
	if ($('.steps').css('top') === '-560px')
		$('.steps').animate({top: '-3px'}, 300);
	else
		$('.steps').animate({top: '-560px'}, 300);
	$('.onboarding').toggleClass('minimized');
}

function validateStep(current_step)
{
	$.ajax({
		type: 'POST',
		headers: { "cache-control": "no-cache" },
		url: onboarding_ajax_url,
		async: true,
		cache: false,
		data: 'ajax=true&action=validate_step&current_step='+current_step
	});
}