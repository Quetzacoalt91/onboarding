<script>
var display_onboarding_modal= {$display_onboarding_modal|escape:'int'};
var current_step_onboarding = {$current_step|escape:'int'};
var onboarding_ajax_url = '{$link->getAdminLink('AdminOnboarding')}';
</script>
{capture name="onboardingStepParagraph"}
	{if $current_step_banner == 1}
		{l s='Hey %s, welcome on your own online shop' sprintf=[$employee->firstname] mod='onboarding'}<br/>
		{l s="Follow the guide and take the first steps with your online shop!" mod="onboarding"}
	{else if $current_step_banner == 2}
		{l s="Check out our catalog to get a new theme or customize the current default theme." mod="onboarding"}<br/>
		{l s="Add your logo, play on fonts and colors... Give this special look to your shop!" mod="onboarding"}
	{else if $current_step_banner == 3}
		{l s="Start your product catalog with a first product." mod="onboarding"}<br/>
		{l s="Make sure you cover the basics by setting its price, having a nice description and uploading a catchy image!" mod="onboarding"}<br/>
		{l s="If you already have your product base in a .CSV file, save time and make an import!" mod="onboarding"}
	{else if $current_step_banner == 4}
		{l s="Select which payment methods you want to offer to customers on your shop, and manage the various restrictions you can apply (per currency, country or group of customers)." mod="onboarding"}
	{else if $current_step_banner == 5}
		{l s="If you feel you need more information, you can still have a look at PrestaShop Documentation: click on \"Help\" in the top right corner of your back-office!" mod="onboarding"}
	{/if}
{/capture}
{capture name="onboardingStepButton"}
	{if $current_step_banner == 1}
		{l s="Let's start!" mod="onboarding"}
	{else if $current_step_banner == 2}
		{l s="Next: create your first products" mod="onboarding"}
	{else if $current_step_banner == 3}
		{l s="Next: set up your payment methods" mod="onboarding"}
	{else if $current_step_banner == 4}
		{l s="Next: let's see shipping methods" mod="onboarding"}
	{else if $current_step_banner == 5}
		{l s="I'm all good, let's launch!" mod="onboarding"}
	{/if}
{/capture}
{capture name="onboardingStepBannerTitle"}
	{if $current_step_banner == 1}
		{l s="Take a tour: get started with PrestaShop" mod="onboarding"}
	{else if $current_step_banner == 2}
		{l s="Customize your shop's look and feel" mod="onboarding"}
	{else if $current_step_banner == 3}
		{l s="Add you first products" mod="onboarding"}
	{else if $current_step_banner == 4}
		{l s="Get your shop ready for payments" mod="onboarding"}
	{else if $current_step_banner == 5}
		{l s="You are now ready to launch your shop." mod="onboarding"}
	{/if}
{/capture}

{capture name="onboardingStepModalTitle"}
	{if $current_step == 1}
		{l s="A few steps before launching!" mod="onboarding"}
	{else if $current_step == 2}
		{l s="Let's create your first products" mod="onboarding"}
	{else if $current_step == 3}
		{l s="Get your shop ready for payments" mod="onboarding"}
	{else if $current_step == 4}
		{l s="Choose your shipping options" mod="onboarding"}
	{else if $current_step == 5}
		{l s="Hurrah!" mod="onboarding"}
	{/if}
{/capture}
{capture name="onboardingComplete"}
	{if $current_step == 1}
	{else if $current_step == 2}
		{l s="1/4 complete" mod="onboarding"}
	{else if $current_step == 3}
		{l s="2/4 complete" mod="onboarding"}
	{else if $current_step == 4}
		{l s="3/4 complete" mod="onboarding"}
	{else if $current_step == 5}
		{l s="4/4 complete" mod="onboarding"}
	{/if}
{/capture}
{capture name="onboardingCompletePercentage"}
	{if $current_step == 1}
	10%%
	{else if $current_step == 2}
	25%%
	{else if $current_step == 3}
	50%%
	{else if $current_step == 4}
	75%%
	{else if $current_step == 5}
	100%%
	{/if}
{/capture}

{capture name="onboardingPendingPercentage"}
	{if $current_step == 1}
	90%%
	{else if $current_step == 2}
	75%%
	{else if $current_step == 3}
	50%%
	{else if $current_step == 4}
	25%%
	{else if $current_step == 5}
	0%%
	{/if}
{/capture}

<div class="onboarding minimized">
	<div class="overlay"></div>
	<div class="panel steps">
		<div id="onboarding-starter" class="hide">
			<div class="row">
				<div class="col-md-6">
					<h4>{$smarty.capture.onboardingStepBannerTitle}</h4>
				</div>
			</div>
			<p>{$smarty.capture.onboardingStepParagraph}</p>
			{if $current_step_banner == 1}
			<a href="{$next_step_link}" class="btn btn-primary quick-start-button">
				{$smarty.capture.onboardingStepButton}&nbsp;&nbsp;
				<i class="icon icon-angle-right icon-lg"></i>
			</a>
			{else}
			<div class="progress progress-striped">
				<div class="progress-bar progress-bar-success" role="progressbar" style="width: {$smarty.capture.onboardingCompletePercentage};">
					<span class="sr-only">{$smarty.capture.onboardingComplete}</span>
				</div>
				<div class="progress-bar progress-bar-warning progress-bar-striped" id="onboarding-progress-bar" style="width: {$smarty.capture.onboardingPendingPercentage}" data-placement="bottom" data-toggle="popover" data-html="true" data-content="<a href='{$next_step_link}' class='btn btn-primary quick-start-button'>{$smarty.capture.onboardingStepButton}&nbsp;&nbsp; <i class='icon icon-angle-right icon-lg'></i></a>">
					<span class="sr-only">20% Complete (warning)</span>
				</div>
			</div>
			{/if}
		</div>
		
		<div class="onboarding-intro">
			<h3 class="text-center">
			{$smarty.capture.onboardingStepModalTitle}
			</h3>
			<a class="close-button" href="#" id="quick-start-button">
				<i class="icon icon-times-circle"></i>
			</a>
		</div>

		<div class="steps-list-container">
			<ul class="steps-list">
				<li {if $steps[1] == 1}class="checked"{/if}{if $current_step == 1}class="active"{/if}{if $current_step < 1}class="inactive"{/if}>
					<span class="title">{l s="Customize your shop's look and feel" mod="onboarding"}</span>
					{if $steps[1] == 0 && $current_step == 1}
						<p class="desc">
						{l s="Give your shop its own identity based on your brand." mod="onboarding"}<br/>
						{l s="You can change your theme or install a new one, and make sure to upload your own logo to make your shop truly unique." mod="onboarding"}<br/><br/>
							<a class="btn btn-primary continue_editing" href="#">
							<i class="icon icon-pencil icon-lg"></i> 
							{l s="OK, take me to my theme" mod="onboarding"}</a>
						</p>
					{else if $steps[1] == 1}
						<p class="desc">
							<a class="continue_editing" href="{$continue_editing_links.theme}">{l s="Continue editing" mod="onboarding"}</a>
						</p>
					{/if}
				</li>
				<li {if $steps[2] == 1}class="checked"{/if}{if $current_step == 2}class="active"{/if}{if $current_step < 2}class="inactive"{/if}>
					<span class="title">{l s='Add products to your catalog'}</span>
					{if $steps[2] == 0 && $current_step == 2}
						<p class="desc">
							{l s="Start your product catalog with a first product." mod="onboarding"}
							<br/>
							{l s="Make sure you cover the basics by setting its price, having a nice description and uploading a catchy image!" mod="onboarding"}
							{assign "onboardingstep2importcsv" value=$continue_editing_links.import var="onboardingstep2importcsv"}
							{l s='If you already have your product base in a .CSV file, save time and make an import!' tags=["<a href='$onboardingstep2importcsv&amp;addproduct'>"] mod='onboarding' }
							<br/><br/>
							<a class="btn btn-primary continue_editing" href="#">
							<i class="icon icon-book icon-lg"></i>
							{l s="Ok, Go to my catalog" mod="onboarding"}</a>
						</p>
					{else if $steps[2] == 1}
						<p class="desc">
							<a class="" href="{$continue_editing_links.product}">{l s="Continue adding products" mod="onboarding"}</a>
						</p>
					{/if}
				</li>
				<li {if $steps[3] == 1}class="checked"{/if}{if $current_step == 3}class="active"{/if}{if $current_step < 3}class="inactive"{/if}>
					<span class="title">{l s='Set up your payment methods'}</span>
					{if $steps[3] == 0 && $current_step == 3}
						<p class="desc">
							{l s="Select which payment methods you want to offer to customers on your shop, and manage the various restrictions you can apply (per currency, country or group of customers)." mod="onboarding"}
							<br/><br/>
							<a class="btn btn-primary continue_editing" href="#">
								<i class="icon icon-credit-card icon-lg"></i> 
								{l s="Show me payment methods" mod="onboarding"}
							</a>
						</p>
					{else if $steps[3] == 1}
						<p class="desc">
							<a class="" href="{$continue_editing_links.payment}">{l s="Continue selecting payment methods" mod="onboarding"}</a>
						</p>
					{/if}
				</li>
				<li {if $steps[4] == 1}class="checked"{/if}{if $current_step == 4}class="active"{/if}{if $current_step < 4}class="inactive"{/if}>
					<span class="title" >{l s='Set up your shipping methods'}</span>
					{if $steps[4] == 0 && $current_step == 4}
					<p class="desc">	
						{l s="Unless you are only selling virtual products, you must register your shipping partners into PrestaShop." mod="onboarding"}<br/>
						{l s="Without this your customers won't be able to enjoy your products!" mod="onboarding"}
						<br/>
						<br/>
						<a class="btn btn-primary continue_editing" href="#">
							<i class="icon icon-truck icon-lg"></i> 
							{l s="Let's see about shipping" mod="onboarding"}
						</a>
					</p>
					{else if $steps[4] == 1}
						<p class="desc">
							<a class="" href="{$continue_editing_links.carrier}">{l s="Continue selecting shipping methods" mod="onboarding"}</a>
						</p>
					{/if}
				</li>
			</ul>
			{if $current_step == 5}
				<div class="step-launch">
					<button id="onboarding-launch" class="btn btn-block btn-lg btn-primary">
						<i class="icon icon-check icon-lg"></i> 
						{l s="Launch" mod="onboarding"}
					</button>
				</div>
			{/if}

			{if $current_step == 6}
				<p>{l s='You have completed all the essential first steps to configure your online shop. You can repeat those steps if you have more products, payment methods or shipping partners to add.'  mod='onboarding'}</p>

				<p>{l s="To dive deeper in the configuration of your shop, you should read the <a>'First steps with PrestaShop 1.6'</a> chapter of the PrestaShop User Guide." mod="onboarding"}</p>
				href="http://doc.prestashop.com/display/PS16/First+steps+with+PrestaShop+1.6

				<p>{l s="Once you are certain that your shop is ready to sell your products, click on the Launch button to make your shop public." mod="onboarding"}</p>
			{/if}
		</div>
		<div class="steps-animation-container">
			{if $current_step == 1}
				<img src="{$module_dir}img/step0.jpg" alt="Step 1">
			{/if}
			{if $current_step == 2}
				<img src="{$module_dir}img/step1.jpg" alt="Step 2">
			{/if}
			{if $current_step == 3}
				<img src="{$module_dir}img/step2.jpg" alt="Step 3">
			{/if}
			{if $current_step == 4}
				<img src="{$module_dir}img/step3.jpg" alt="Step 4">
			{/if}
			{if $current_step == 5}
				{include file="./launch_animation.tpl"}
			{/if}
			<div class="step-before-launch text-center">
				{if $current_step == 4}
					{l s="Last step before launch!" mod="onboarding"}
				{else if $current_step == 5}
					{l s="You are all set!" mod="onboarding"}
				{else}
					{l s='You are only %s steps away from launch!' sprintf=[5-(int)$current_step] mod='onboarding'}
				{/if}
			</div>
		</div>
	</div>
	<div class="panel final" style="display: none;">
		<div class="onboarding-intro">
			<h3 class="text-center">
			{$smarty.capture.onboardingStepModalTitle}
			</h3>
			<a class="close-button" href="#" id="final-button">
				<i class="icon icon-times-circle"></i>
			</a>
		</div>
		<div class="final-container">
			<span class="title">
				{l s='You are now ready to launch your shop. If you feel you need more information, you can still have a look at PrestaShop Documentation:' mod='onboarding'}
				<br />
				{l s='click on "Help" in the top right corner of your back-office!' mod='onboarding'}
			</span>
			<br />
			<textarea name="social-text" id="social-text">{l s="I just launched my online shop with @PrestaShop. Check it out!" mod="onboarding"}</textarea>
			<br />
			<div class="col-lg-3 text-center">
				<a href="#" class="btn btn-default" onclick="share_facebook_click();">
					<i class="icon icon-facebook icon-4x"></i>
				</a>
			</div>
			<div class="col-lg-3 text-center">
				<a href="#" class="btn btn-default" onclick="share_twitter_click($('#social-text').text());">
					<i class="icon icon-twitter icon-4x"></i>
				</a>
			</div>
			<div class="col-lg-3 text-center">
				<a href="#" class="btn btn-default" onclick="share_linkedin_click();">
					<i class="icon icon-linkedin icon-4x"></i>
				</a>
			</div>
			<div class="col-lg-3 text-center">
				<a href="#" class="btn btn-default" onclick="share_google_click();">
					<i class="icon icon-google-plus icon-4x"></i>
				</a>
			</div>
		</div>
	</div>
</div>

