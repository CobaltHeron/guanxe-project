<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class CrossSell extends Module
{
    public function __construct()
    {
        $this->name = 'crosssell';
        $this->version = '1.0.0';
        $this->author = 'Reboot Academy Team';
        $this->displayName = 'Venta Cruzada';
        $this->description = 'Modulo de Venta Cruzada para Guanxe.';
        $this->ps_versions_compliancy = ['min' => '1.7.0.0', 'max' => _PS_VERSION_];
        $this->bootstrap = true;
        parent::__construct();
    }

    public function install()
    {
        if (!parent::install() || !Configuration::updateValue('NEW_MODULE_CONFIG', 'value')) {
            return false;
        }

        $this->registerHook('displayHome');

        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall() || !Configuration::deleteByName('NEW_MODULE_CONFIG')) {
            return false;
        }

        return true;
    }

    public function hookDisplayHome($params)
    {
        $this->context->smarty->assign('example_var', 'THIS IS THE "DisplayHome" HOOK!');
        return $this->display(__FILE__, 'views/templates/front/home.tpl');
    }


}