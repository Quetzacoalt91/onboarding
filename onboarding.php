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
		$controller = Tools::getValue('controller');

		switch ($controller)
		{
			case 'AdminThemes':
				Configuration::updateValue('PS_ONBOARDING_STEP_1_COMPLETED', 1);
				break;

			case 'AdminProducts':
				if (Tools::getIsset('addproduct'))
					Configuration::updateValue('PS_ONBOARDING_STEP_2_COMPLETED', 1);
				break;

			case 'AdminPayment':
				Configuration::updateValue('PS_ONBOARDING_STEP_3_COMPLETED', 1);
				break;

			case 'AdminCarriers':
				Configuration::updateValue('PS_ONBOARDING_STEP_4_COMPLETED', 1);
				break;
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

		$this->context->smarty->assign(array(
			'link' => $this->context->link,
			'steps' => $steps,
			'current_step' => Configuration::get('PS_ONBOARDING_CURRENT_STEP'),
			'employee' => $this->context->employee,
		));

		return $this->display(__FILE__, 'backoffice_top.tpl');
	}
}
