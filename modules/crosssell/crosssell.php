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
        $products = Product::getProducts($this->context->language->id, 0, 10,
            'id_product', 'DESC');
        $this->context->smarty->assign('products', $products);
        return $this->display(__FILE__, 'views/templates/front/myproduct.tpl');

    }

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






// ------------------------------ FUNCIONES ANTERIORES, daban error ----------------------------------------------

//  public function getCrossSellProducts($id_product)
//    {
//        $sql = 'SELECT p.id_product, p.name, p.price, pl.link_rewrite, i.id_image
//            FROM ' . _DB_PREFIX_ . 'product p
//            INNER JOIN ' . _DB_PREFIX_ . 'product_lang pl ON p.id_product = pl.id_product
//            LEFT JOIN ' . _DB_PREFIX_ . 'image i ON p.id_product = i.id_product AND i.cover = 1
//            WHERE p.active = 1
//            LIMIT 10';
//
//        $products = Db::getInstance()->executeS($sql);
//
//        foreach ($products as &$product) {
//            $product['link'] = $this->context->link->getProductLink(
//                $product['id_product'],
//                $product['link_rewrite']
//            );
//
//            $product['cover'] = $this->context->link->getImageLink(
//                $product['link_rewrite'],
//                $product['id_image'],
//                'home_default'
//            );
//        }
//
//        return $products;
//    }
//
//
//    public function hookDisplayFooterProduct($params)
//    {
//        $this->context->controller->addCSS($this->_path . 'views/css/crosssell.css', 'all');
//
//        $id_product = (int)Tools::getValue('id_product');
//
//        $products = $this->getCrossSellProducts($id_product);
//
//        foreach ($products as &$product) {
//            $product['rating'] = $this->getProductRating($product['id_product']);
//        }
//
//        $this->context->smarty->assign('products', $products);
//
//        return $this->display(__FILE__, 'views/templates/front/myproduct.tpl');
//    }
//
//
//    public function getProductRating($id_product)
//    {
//        $sql = 'SELECT AVG(pc.grade) as rating
//            FROM ' . _DB_PREFIX_ . 'product_comment pc
//            WHERE pc.id_product = ' . (int)$id_product . ' AND pc.validate = 1';
//
//        return Db::getInstance()->getValue($sql) ?: 0;
//    }