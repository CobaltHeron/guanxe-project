{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='product_miniature_item'}
    <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
        <div class="thumbnail-container">
            <div class="block-product-thumbnail">
                {block name='product_thumbnail'}
                    <a href="{$product.url}" class="thumbnail product-thumbnail">
                        {if isset($product.image_url) && $product.image_url}
                            <img src="{$product.image_url}" alt="{$product.name|escape}" data-full-size-image-url="{$product.cover.large.url}">
                        {else}
                            <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name|escape}" data-full-size-image-url="{$product.cover.large.url}">
                        {/if}
                    </a>
                {/block}

                {block name='product_flags'}
                    <ul class="product-flags">
                        {foreach from=$product.flags item=flag}
                            {if $flag.type !== 'discount'}
                                <li class="{$flag.type}">{$flag.label}</li>
                            {/if}
                        {/foreach}
                        {if $product.show_price && $product.has_discount && $product.discount_type === 'percentage'}
                            <li class="discount_percentage"> {$product.discount_percentage} </li>
                        {/if}
                    </ul>
                {/block}
                {hook h='displayRatingProduct' id_product={$product.id_product} type='category'}
            </div>

            <div class="product-description">
                {block name='product_name'}
                    <h2 class="h3 product-title" ><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h2>
                {/block}

                {block name='product_price_and_shipping'}
                    {if $product.show_price}
                        <div class="product-price-and-shipping">


                            {hook h='displayProductPriceBlock' product=$product type="before_price"}

                            <span  class="price">{$product.price}</span>

                            {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                            {hook h='displayProductPriceBlock' product=$product type='weight'}


                            {if $product.has_discount}
                                {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                <span class="regular-price">{$product.regular_price}</span>
                            {/if}
                        </div>
                    {/if}
                {/block}
                {block name='product_reviews'}
                    {hook h='displayProductListReviews' product=$product}
                {/block}

                {block name='product_description'}

                    <div class="product_description">{$product.description nofilter}</div>

                {/block}

                <div class="product-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
                    {block name='product_variants'}
                        {if $product.main_variants}
                            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                        {/if}
                    {/block}
                </div>

                {block name='add_to_cart'}
                    <div class="product-add-to-cart">
                        <form action="{Context::getContext()->link->getPageLink('cart',true)|escape:'htmlall':'UTF-8'}" method="post" class="add-to-cart-or-refresh">
                            <input type="hidden" name="token" value="{Tools::getToken(false)|escape:'htmlall':'UTF-8'}">
                            <input type="hidden" name="id_product" value="{$product.id_product|escape:'htmlall':'UTF-8'}" class="product_page_product_id">
                            <input type="hidden" name="id_customization" value="0" class="product_customization_id">
                            <button class="btn add-to-cart add_cart_brandfashion" {if  $product.available_for_order && $product.minimal_quantity>$product.quantity}disabled{/if} data-button-action="add-to-cart" type="submit" >
                                <span class="add_to_cart_icon"> <i class="material-icons shopping-cart">shopping_cart</i> </span>
                                <span class="add_to_cart_tittle"> {l s='Add to cart' mod='motivationsale'} </span>
                            </button>
                        </form>
                    </div>
                {/block}


                {block name='quick_view'}
                    <a class="quick-view" href="#" data-link-action="quickview">
                        <span class="view_icon"><i class="material-icons">visibility</i></span>
                        <span class="view_title">{l s='View' d='Shop.Theme.Actions'}</span>
                    </a>
                {/block}
            </div>




        </div>

    </article>
{/block}
