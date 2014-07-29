<script>
var display_onboarding_modal= {$display_onboarding_modal|escape:'int'};
var current_step_onboarding = {$current_step|escape:'int'};
var onboarding_ajax_url = '{$link->getAdminLink('AdminOnboarding')}';
</script>
{capture name="onboardingStepTitle"}
	{if $current_step_banner == 1}
	{l s='Hey %s, welcome on your own online shop' sprintf=[$employee->firstname] mod='onboarding'}
	{else if $current_step_banner == 2}
	{l s="Next: let's add products to your shop" mod="onboarding"}
	{else if $current_step_banner == 3}
	{l s="Next: let's set up payment methods" mod="onboarding"}
	{else if $current_step_banner == 4}
	{l s="Next: let's set up shipping methods" mod="onboarding"}
	{else if $current_step_banner == 5}
	{l s="Next: let's launch!" mod="onboarding"}
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
	0
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
<div class="onboarding minimized">
	<div class="overlay"></div>
	<div class="panel steps">
		<div id="onboarding-starter" class="hide">
			<div class="row">
				<div class="col-md-6">
					<h4>{l s='Getting Started with PrestaShop'}</h4>
				</div>
				<div class="col-md-6">
					<div class="progress progress-striped">
						<div class="progress-bar" role="progressbar" style="width: {$smarty.capture.onboardingCompletePercentage};">
							<span>{$smarty.capture.onboardingComplete}</span>
						</div>
					</div>
				</div>
			</div>
			<a href="{$next_step_link}" class="btn btn-primary quick-start-button">
				{$smarty.capture.onboardingStepTitle}&nbsp;&nbsp;
				<i class="icon icon-angle-right icon-lg"></i>
			</a>
		</div>
		
		<div class="onboarding-intro">
			<h3 class="text-center">
			{$smarty.capture.onboardingStepTitle}
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
							{l s="Give your shop its own identity based on your brand. You can change your theme or install a new one, and make sure to upload your own logo to make your shop truly unique." mod="onboarding"}
							<br><br>
							<a class="btn btn-primary continue_editing" href="#">
							<i class="icon icon-pencil icon-lg"></i> 
							{l s="Customize your theme and logo" mod="onboarding"}</a>
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
							{l s="Your catalog is where you manage your products and their details. You can add a product using PrestaShop's intuitive interface." mod="onboarding"}
							<br>
							{assign "onboardingstep2importcsv" value=$continue_editing_links.import var="onboardingstep2importcsv"}
							{l s='You can also [1]import products using a .CSV file[/1].' tags=["<a href='$onboardingstep2importcsv&amp;addproduct'>"] mod='onboarding' }
							<br><br>
							<a class="btn btn-primary continue_editing" href="#">
							<i class="icon icon-book icon-lg"></i>
							{l s="Add products" mod="onboarding"}</a>
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
							{l s="You can use many different payment methods with PrestaShop using modules: bank wire, check or any of our partner's modules." mod="onboarding"}
							<br><br>
							<a class="btn btn-primary continue_editing" href="#">
								<i class="icon icon-credit-card icon-lg"></i> 
								{l s="Select payment methods" mod="onboarding"}
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
						{l s="Unless you are only selling downloadable products, you must register shipping partners into PrestaShop. This is done through modules." mod="onboarding"}
						<br>
						<br>
						<a class="btn btn-primary continue_editing" href="#">
							<i class="icon icon-truck icon-lg"></i> 
							{l s="Select shipping methods" mod="onboarding"}
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
		<h3 class="text-center">{l s="Welcome to the community" mod="onboarding"}</h3>
		<h4 class="text-center">{l s="Share the great news!" mod="onboarding"}</h4>
		<div>
			{l s="Share" mod="onboarding"}
			<ul class="list-unstyled">
				<li>
					<i class="icon icon-facebook"></i>
					Facebook
				</li>
				<li>
					<i class="icon icon-twitter"></i>
					Twitter
				</li>
			</ul>
			
			<input type="text" name="" value="{l s="I just launched my online shop with @PrestaShop. Check it out!" mod="onboarding"}" />
		</div>
	</div>
</div>

