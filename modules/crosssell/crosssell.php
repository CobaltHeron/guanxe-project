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

        // $this->registerHook('displayHome');
        $this->registerHook('displayFooterProduct');

        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall() || !Configuration::deleteByName('NEW_MODULE_CONFIG')) {
            return false;
        }

        return true;
    }


    public function hookDisplayFooterProduct($params)
    {
        $this->context->smarty->assign('product_example', 'AQUI ES DONDE EL HOOK displayFooterProduct SE MUESTRA');
        return $this->display(__FILE__, 'views/templates/front/myproduct.tpl');

    }





    // LLAMADA A LA API AQUÍ ABAJO. DESCOMENTAR CUANDO LA TENGAMOS  (LINEA 45):

    /* private function getRecommendedProducts() {
        $url = Aquí va la URL de la api de guanxe
        $product_id = $this->context->controller->getProduct()->id;
        $data = [
            'product_id' => $this->context->controller->getproduct()->id,
        ];
        $response = Tools::file_get_contents($url, null, json_encode($data));

        if ($response === false) {
        return [];
    }

    &products = json_decode($response, true);

    public function hookDisplayHome($params)
    {
        $recommended_products = $this->getRecommendedProducts();
        $this->context->smarty->assign('recommended_products', 'Recommended products');
        return $this->display(__FILE__, 'views/templates/front/home.tpl');

    if (isset($products['recommended']) && count ($products ['recommended']) > 0) {
        return array_slice($products['recommended'], 0, 5);
    }

    return [];

    }*/


}