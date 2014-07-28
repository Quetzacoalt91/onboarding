<?php
if (!defined('_PS_VERSION_'))
	exit;

class OnBoarding extends Module
{
	public function __construct()
	{
		$this->name = 'onboarding';
        $this->bootstrap = true;
		$this->tab = 'administration';
		$this->version = '0.1';
		$this->author = 'PrestaShop';
		$this->displayName = $this->l('OnBoarding');
		$this->description = $this->l('PrestaShop OnBoarding');

		parent::__construct();
	}

	public function install()
	{
		Configuration::updateValue('PS_ONBOARDING_CURRENT_STEP', 1);
		Configuration::updateValue('PS_ONBOARDING_STEP_1_COMPLETED', 0);
		Configuration::updateValue('PS_ONBOARDING_STEP_2_COMPLETED', 0);
		Configuration::updateValue('PS_ONBOARDING_STEP_3_COMPLETED', 0);
		Configuration::updateValue('PS_ONBOARDING_STEP_4_COMPLETED', 0);

		if (parent::install() && $this->registerHook('displayBackOfficeHeader')
			&& $this->registerHook('displayBackOfficeTop'))
			return true;

		return false;
	}
	
	public function uninstall()
	{
		if (!parent::uninstall())
			return false;

		return true;
	}

	public function hookDisplayBackOfficeHeader()
	{
		if (!$this->active)
			return;
		$controller = Tools::getValue('controller');
				
		if (Tools::isSubmit('onboarding'))
		{
			switch ($controller)
			{
				case 'AdminProducts':
					Configuration::updateValue('PS_ONBOARDING_STEP_1_COMPLETED', 1);
					break;
				case 'AdminPayment':
					Configuration::updateValue('PS_ONBOARDING_STEP_2_COMPLETED', 1);
					break;
				case 'AdminCarriers':
					Configuration::updateValue('PS_ONBOARDING_STEP_3_COMPLETED', 1);
					break;
				case 'AdminDashboard':
					Configuration::updateValue('PS_ONBOARDING_STEP_4_COMPLETED', 1);
					break;
			}
		}
		
		$this->context->controller->addCSS($this->_path.'css/onboarding.css');
		$this->context->controller->addJS($this->_path.'js/onboarding.js');
	}

	public function hookDisplayBackOfficeTop()
	{
		$steps = array();
		for ($i=1; $i<5; $i++)
		{
			$steps[$i] = Configuration::get('PS_ONBOARDING_STEP_'.$i.'_COMPLETED');

			if ($steps[$i] == 1)
				Configuration::updateValue('PS_ONBOARDING_CURRENT_STEP', $i+1);
		}
		$current_step = (int)Configuration::get('PS_ONBOARDING_CURRENT_STEP');
		$this->context->smarty->assign(array(
			'display_onboarding_modal' => (int)Tools::isSubmit('onboarding'),
			'next_step_link' => $this->getCurrentStepLink(Tools::isSubmit('onboarding') ? $current_step+1 : $current_step),
			'steps' => $steps,
			'current_step_banner' => Tools::isSubmit('onboarding') ? $current_step+1 : $current_step,
			'current_step' => $current_step,
			'employee' => $this->context->employee,
			'continue_editing_links' => array(
				'theme' => $this->context->link->getAdminLink('AdminThemes'),
				'product' => $this->context->link->getAdminLink('AdminProducts'),
				'import' => $this->context->link->getAdminLink('AdminImport'),
				'payment' => $this->context->link->getAdminLink('AdminPayment'),
				'carrier' => $this->context->link->getAdminLink('AdminCarriers'),
				)
		));

		return $this->display(__FILE__, 'backoffice_top.tpl');
	}
	
	public function getCurrentStepLink($id_step)
	{
		$links = array(
			1 => $this->context->link->getAdminLink('AdminThemes').'&onboarding',
			2 => $this->context->link->getAdminLink('AdminProducts').'&onboarding&addproduct',
			3 => $this->context->link->getAdminLink('AdminPayment').'&onboarding',
			4 => $this->context->link->getAdminLink('AdminCarriers').'&onboarding&onboarding_carrier',
			);
		return isset($links[$id_step]) ? $links[$id_step] : Context::getContext()->link->getAdminLink('AdminDashboard').'&onboarding';
	}
}
