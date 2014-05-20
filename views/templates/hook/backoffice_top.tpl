<div class="onboarding">
	<div class="overlay">
		<div class="panel">
			<div class="row">
				<div class="col-xs-12">
					<h3 class="text-center">
					{if $current_step == 1}
						{l s='Welcome on your PrestaShop shop, %s' sprintf=[$employee->firstname] mod='onboarding'}
					{else if $current_step == 2}
						{l s='Next: let\'s add product to your shop' mod='onboarding'}
					{/if}
					</h3>
					<h4 class="text-center">{l s='You are only %s steps away from launch!' sprintf=[5-(int)$current_step] mod='onboarding'}</h4>
					<hr />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<ul>
						<li>
							<span>{l s='Customize the look on your shop' mod='onboarding'}</span>
							{if $current_step == 1}
							<div class="desc">
								{l s='Give your shop an identity with your own brand. Customize or change your theme and upload a logo to make it unique' mod='onboarding'}
								<a class="btn btn-default" href="{$link->getAdminLink('AdminThemes')|escape:'html':'UTF-8'}">{l s='Customize your theme and logo' mod='onboarding'}</a>
							</div>
							{/if}
						</li>
						<li>
							<span>{l s='Add your first products'}</span>
							{if $current_step == 2}
							<p class="desc"></p>
							{/if}
						</li>
						<li><span>{l s='Accept online payments'}</span></li>
						<li><span>{l s='Set up shipping methods'}</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>