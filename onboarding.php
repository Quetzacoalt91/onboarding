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
		$this->context->controller->addCSS($this->_path.'css/onboarding.css');
	}

	public function hookDisplayBackOfficeTop()
	{
		$this->context->smarty->assign(array(
			'current_step' => Configuration::get('PS_ONBOARDING_CURRENT_STEP'),
			'employee' => $this->context->employee,
		));

		return $this->display(__FILE__, 'backoffice_top.tpl');
	}
}
