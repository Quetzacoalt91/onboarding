$( document ).ready(function() {
	$('#onboarding-progress-bar').popover('show');
	$('#onboarding-launch').click(function() {
		$('.gwd-page-container').addClass('gwd-gen-oxd9');
		onBoarding.sleep(5400, function() {
			$('.onboarding .steps').hide('normal', function() {
				validateStep(7);
				$('.onboarding .final').show('nomal');
				$('.quick-start-button').hide();
			});
		});
	});

	$('.steps a').click(function() {
		$('.steps').animate({top: '-560px'}, 300);
	});

	$('<div class="alert alert-onboarding"></div>').html($('#onboarding-starter')).detach().prependTo('#content');
	$('#onboarding-starter').removeClass('hide');

	$('.close-button, .continue_editing').click(function() {
		toggleOnboardingModal();
	});


	$('#final-button').click(function() {
		$('.final').animate({top: '-560px'}, 300);
		$('.overlay').hide();
	});

	$('.skip').click(function() {
		validateStep(7);
		$('.overlay, .alert-onboarding').hide();
	});

	if (display_onboarding_modal)
		toggleOnboardingModal();
});

var onBoarding = {
	sleep : function (time, callback)
	{
		setTimeout(function() {
			callback();
		} , time);
	}
} ;

function toggleOnboardingModal()
{
	if ($('.steps').css('top') === '-560px')
		$('.steps').animate({top: '-3px'}, 300);
	else
		$('.steps').animate({top: '-560px'}, 300);

	$('.onboarding').toggleClass('minimized');
}

function validateStep(current_step, href)
{
	$.ajax({
		type: 'POST',
		headers: { "cache-control": "no-cache" },
		url: onboarding_ajax_url,
		async: true,
		cache: false,
		data: 'controller=AdminOnboarding&ajax=true&action=validate_step&current_step='+current_step,
		success: function(result)
		{
			if (href)
				window.location.href = href;
		}
	});
}

function share_twitter_click(message)
{
	window.open('https://twitter.com/intent/tweet?button_hashtag=PrestaShop&text=' + message, 'sharertwt', 'toolbar=0,status=0,width=640,height=445');
	location.reload();
}

function share_facebook_click()
{
	window.open('http://www.facebook.com/sharer.php?u=http://www.prestashop.com/', 'sharerfacebook', 'toolbar=0,status=0,width=660,height=445');
	location.reload();
}

function share_google_click()
{
	window.open('https://plus.google.com/share?url=http://www.prestashop.com/', 'sharergplus', 'toolbar=0,status=0,width=660,height=445');
	location.reload();
}

function share_linkedin_click()
{
	window.open('https://www.linkedin.com/shareArticle?title=PrestaShop&url=http://www.prestashop.com/download', 'sharerlinkedin', 'toolbar=0,status=0,width=600,height=450');
	location.reload();
}
