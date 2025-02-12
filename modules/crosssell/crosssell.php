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
        $this->context->controller->addCSS($this->_path . 'views/css/crosssell.css', 'all');

        $apiUrl = 'https://ventascruzadasdeploy.onrender.com/recommendations/';

        $customerId = Context::getContext()->cookie->id_customer;

        $data = [
            'user_id' => $customerId,
            'n' => 7,
            'max_per_category' => 5
        ];

        $jsonData = json_encode($data);

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
        ]);

        $response = curl_exec($ch);

        curl_close($ch);

        if($response === false) {
            $this->context->smarty->assign('error', 'Error fetching data from API.');
            return $this->display(__FILE__, 'views/templates/front/myproduct.tpl');
        }

        $productsFromApi = json_decode($response, true);

        $recommendedProductIds = $productsFromApi['recommendations'];

        $products = [];

        foreach ($recommendedProductIds as $productId) {
            $product = new Product($productId, true, $this->context->language->id);
            if (Validate::isLoadedObject($product)) {
                $cover = $product->getCover($product->id);
                if (isset($cover['id_image'])) {
                    $imageUrl = _PS_BASE_URL_ . '/img/p/' . substr($cover['id_image'], 0, 1) . '/' . substr($cover['id_image'], 1, 1) . '/' . substr($cover['id_image'], 2, 1) . '/' . $cover['id_image'] . '-medium_default.jpg';
                } else {
                    $imageUrl = _PS_BASE_URL_ . _THEME_PROD_DIR_ . 'default-medium_default.jpg';
                }

                $products[] = [
                    'id_product' => $product->id,
                    'name' => $product->name,
                    'image_url' => $imageUrl,
                    'price' => $product->getPrice(),
                ];
            }
        }

        $this->context->smarty->assign('products', $products);

        return $this->display(__FILE__, 'views/templates/front/myproduct.tpl');

    }

}
