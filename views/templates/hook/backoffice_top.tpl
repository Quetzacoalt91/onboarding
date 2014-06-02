<div class="onboarding">
	<div class="panel steps{if $steps[1] == 1} minimized{/if}">
		<div class="col-xs-12">
			<h3 class="text-center">
			{if $current_step == 1}
				{l s='Welcome on your PrestaShop shop, %s' sprintf=[$employee->firstname] mod='onboarding'}
			{else if $current_step == 2}
				{l s='Next: let\'s add product to your shop' mod='onboarding'}
			{else if $current_step == 3}
				{l s='Next: let\'s set up payment methods' mod='onboarding'}
			{else if $current_step == 4}
				{l s='Next: let\'s set up shipping methods' mod='onboarding'}
			{else if $current_step == 5}
				{l s='Next: let\'s launch' mod='onboarding'}
			{/if}
			</h3>
			<h4 class="text-center">
				{if $current_step == 4}
					{l s='Last step before launch!' mod='onboarding'}
				{else if $current_step == 5}
					{l s='You are all set' mod='onboarding'}
				{else}
					{l s='You are only %s steps away from launch!' sprintf=[5-(int)$current_step] mod='onboarding'}
				{/if}
			</h4>
			<hr />
		</div>
		<div class="col-xs-12 col-lg-9">
			<ul>
				<li>
					<span>{l s='Customize the look on your shop' mod='onboarding'}</span>
					{if $steps[1] == 0 && $current_step == 1}
					<div class="desc">
						{l s='Give your shop an identity with your own brand. Customize or change your theme and upload a logo to make it unique' mod='onboarding'}
						<a class="btn btn-default" href="{$link->getAdminLink('AdminThemes')|escape:'html':'UTF-8'}">{l s='Customize your theme and logo' mod='onboarding'}</a>
					</div>
					{else if $steps[1] == 1}
						<a class="btn" href="{$link->getAdminLink('AdminThemes')|escape:'html':'UTF-8'}">{l s='Continue editing' mod='onboarding'}</a>
					{/if}
					{if $steps[1] == 1}
					<span class="checked">checked</span>
					{/if}
				</li>
				<li>
					<span>{l s='Add your first products'}</span>
					{if $steps[2] == 0 && $current_step == 2}
					<div class="desc">
						{l s='Create a new product. Start adding product to see it in your store' mod='onboarding'}
						<a class="btn" href="{$link->getAdminLink('AdminImport')|escape:'html':'UTF-8'}&amp;addproduct">{l s='Import your product' mod='onboarding'}</a>
						<a class="btn btn-default" href="{$link->getAdminLink('AdminProducts')|escape:'html':'UTF-8'}&amp;addproduct">{l s='Add products' mod='onboarding'}</a>
					</div>
					{else if $steps[2] == 1}
						<a class="btn" href="{$link->getAdminLink('AdminProducts')|escape:'html':'UTF-8'}&amp;addproduct">{l s='Continue adding products' mod='onboarding'}</a>
					{/if}
					{if $steps[2] == 1}
					<span class="checked">checked</span>
					{/if}
				</li>
				<li>
					<span>{l s='Accept online payments'}</span>
					{if $steps[3] == 0 && $current_step == 3}
					<div class="desc">
						{l s='Lorem ipsum' mod='onboarding'}
						<a class="btn btn-default" href="{$link->getAdminLink('AdminPayment')|escape:'html':'UTF-8'}">{l s='Select payment methods' mod='onboarding'}</a>
					</div>
					{else if $steps[3] == 1}
						<a class="btn" href="{$link->getAdminLink('AdminPayment')|escape:'html':'UTF-8'}">{l s='Continue selecting payment methods' mod='onboarding'}</a>
					{/if}
					{if $steps[3] == 1}
					<span class="checked">checked</span>
					{/if}
				</li>
				<li>
					<span>{l s='Set up shipping methods'}</span>
					{if $steps[4] == 0 && $current_step == 4}
					<div class="desc">
						{l s='Lorem ipsum' mod='onboarding'}
						<a class="btn btn-default" href="{$link->getAdminLink('AdminCarriers')|escape:'html':'UTF-8'}&amp;onboarding_carrier">{l s='Select shipping methods' mod='onboarding'}</a>
					</div>
					{else if $steps[4] == 1}
						<a class="btn" href="{$link->getAdminLink('AdminCarriers')|escape:'html':'UTF-8'}&amp;onboarding_carrier">{l s='Continue selecting shipping methods' mod='onboarding'}</a>
					{/if}
					{if $steps[4] == 1}
					<span class="checked">checked</span>
					{/if}
				</li>
			</ul>
		</div>
		<div class="col-xs-12 col-lg-3">
			<a class="btn btn-default{if $current_step != 5} disabled{/if}" href="#" id="onboarding-launch">{l s='Launch' mod='onboarding'}</a>
		</div>
	</div>
	<div class="panel final" style="display: none;">
		<h3 class="text-center">{l s='Welcome to the community' mod='onboarding'}</h3>
		<h4 class="text-center">{l s='Share the great news!' mod='onboarding'}</h4>
		<div class="col-xs-12">
			<input type="text" name="" value="{l s='I Juste launched an online store with @PrestaShop. Check out ' mod='onboarding'}" />
		</div>
	</div>
	<div class="col-xs-12 quick-start-button{if $steps[1] == 1} minimized{/if}">
		<span><a href="#" id="quick-start-button">{l s='Quick start guide' mod='onboarding'}</a></span>
	</div>
</div>