{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

{strip}
<div id="_desktop_cart" class="tvcms-header-cart">
    <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if} tv-header-cart" data-refresh-url="{$refresh_url}">
        <div class="tvheader-cart-wrapper">
            <div class='tvheader-cart-btn-wrapper'>
                <a rel="nofollow" href="JavaScript:void(0);" data-url='{$cart_url}' title='{l s="Cart" d="Shop.Theme.Checkout"}'>
                     <div class="tv-cart-icon">
                        <i class="material-icons shopping-cart">&#xe8f8;</i>
                    </div> 
                     {* <span class="hidden-sm-down">{l s='Cart' d='Shop.Theme.Checkout'}</span> *}
                    <div class="tv-cart-cart-inner">
                        {* <span class="cart-products-count">{$cart.products_count}</span> *}
                        <span class="cart-products-count">{count($cart.products)}</span>

                    </div>
                </a>
            </div>

            <div class="tvcmscart-show-dropdown">
                {if $cart.products_count > 0}
                <div class="tvcart-product-list">
                    <div class="tvcart-product-content-box tvscroll-container">
                        {foreach from=$cart.products item=product}
                        <div class="tvcart-product-wrapper items">
                            {include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}
                        </div>
                        {/foreach}
                    </div>
                    <div class="tvcart-product-list-total-info">
                        <div class="tvcart-product-list-subtotal-prod">
                            <span class="tvshoping-cart-subtotal">{l s='Subtotal' d='Shop.Theme.Checkout'}</span>
                            <span class="tvcart-product-price">{$cart.subtotals.products.value}</span>
                        </div>
                        <div class="tvcart-product-list-subtotal-shipping">
                            <span class="tvshoping-cart-shipping">{l s='Shipping' d='Shop.Theme.Checkout'}</span>
                            <span class="tvcart-product-price">{$cart.subtotals.shipping.value}</span>
                        </div>
                        <div class="tvcart-product-list-subtotal-tax">
                            <span class="tvshoping-cart-tax">{l s='Tax' d='Shop.Theme.Checkout'}</span>
                            <span class="tvcart-product-price">{$cart.subtotals.tax.value}</span>
                        </div>
                        <div class="tvcart-product-list-subtotal-excluding-text">
                            <span class="ttshoping-cart-total">{l s='Total' d='Shop.Theme.Checkout'}</span>
                            <span class="tvcart-product-price">{$cart.totals.total_excluding_tax.value}</span>
                        </div>
                        <div class="tvcart-product-list-checkout">
                            <a href="{$cart_url}">{l s='Process To CheckOut' d='Shop.Theme.Checkout'}</a>
                        </div>
                    </div>
                </div>
                {else}
                <div class="tvcart-no-product">
                    <div class='tvcart-no-product-label'>{l s='No Product Add in Cart' d='Shop.Theme.Checkout'}</div>
                </div>
                {/if}
            </div>

        </div>
    </div>
</div>
{/strip}
