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
<div class="tvproduct-wrapper catelog">

	<div class="tvproduct-catalog-wrapper">
		{block name='product_thumbnail'}
			<div class="tvproduct-image col-sm-12 col-md-3">
				{if $product.cover}
					<a href="{$product.url}" class="thumbnail product-thumbnail">
						<img src = "{$product.cover.bySize.home_default.url}" alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name}{/if}" data-full-size-image-url = "{$product.cover.large.url}">

						{if isset($product.images.0.bySize.home_default.url) && empty($product.images.0.cover)}
							<img class="tvproduct-hover-img" src="{$product.images.0.bySize.home_default.url}" alt="{$product.name}">
						{elseif isset($product.images.1.bySize.home_default.url) && empty($product.images.1.cover)}
							<img class="tvproduct-hover-img" src="{$product.images.1.bySize.home_default.url}" alt="{$product.name}">
						{/if}
					</a>
				{else}
					<a href="{$product.url}" class="thumbnail product-thumbnail">
						<img src = "{$urls.no_picture_image.bySize.home_default.url}" />
					</a>
				{/if}
				{block name='product_flags'}
				<ul class="product-flags tvproduct-online-new-wrapper">
					{foreach from=$product.flags item=flag}
					{if $flag.type == 'online-only' || $flag.type == 'new'}
						<li class="product-flag {$flag.type}">{$flag.label}</li>
					{/if}
					{/foreach}
				</ul>

				<ul class="product-flags tvproduct-sale-pack-wrapper">
					{foreach from=$product.flags item=flag}
					{if $flag.type == 'on-sale' || $flag.type == 'pack'}
						<li class="product-flag {$flag.type}">{$flag.label}</li>
					{/if}
					{/foreach}
				</ul>
			{/block}
			</div>
		{/block}

		<div class="col-sm-12 col-md-3 tvcms-product-name-star">
			{block name='product_name'}
				<div class="tvproduct-name">
					<div class="product-title" itemprop="name">
						<a href="{$product.url}">{$product.name}</a>
					</div>
					<div class="tvproduct-cat-name">{$product.category_name}</div>
				</div>
				<div class='tv-product-desc'>
					{$product.description_short|truncate:400|strip_tags:true}
				</div>
			{/block}

			{* Start Product Stock Indicator *}
			{hook h='displayProductListStockIndicator' product=$product}
			{* End Product Stock Indicator *}
		</div>
		
		<div class="col-sm-12 col-md-3 tvproduct-catalog-price">
			{* Start Product Comment *}
				{hook h='displayReviewProductList' product=$product}
			{* End Product Comment *}

			{if Configuration::get('TVCMSCUSTOMSETTING_PRODUCT_COLOR') == '1'}
				{block name='product_variants'}
					{if $product.main_variants}
						<div class="tvproduct-color">
						  	{foreach from=$product.main_variants item=color_info}
							<div class='tvproduct-color-wrapper'>
							  	<a href="{$color_info.url}">
								    <div class="tvproduct-color-box-border">
								          <div class='tvporoduct-color-box' style='{if $color_info.html_color_code != ""}background-color: {$color_info.html_color_code};{else}background-image: url({$color_info.texture});{/if}'></div>
							        </div>
								</a>
							</div>
						  	{/foreach}
						</div>
					{/if}
				{/block}
			{/if}

			{block name='product_price_and_shipping'}
				{if $product.show_price}
					<div class="product-price-and-shipping">
						<span itemprop="price" class="price">{$product.price}</span>
						{if $product.has_discount}
							{hook h='displayProductPriceBlock' product=$product type="old_price"}
							<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
							{if $product.discount_type === 'percentage'}
								<span class="discount-percentage discount-product tvproduct-discount-price">{$product.discount_percentage}</span>
							{elseif $product.discount_type === 'amount'}
								<span class="discount-amount discount-product tvproduct-discount-price">{$product.discount_amount_to_display}</span>
							{/if}
							<span class="regular-price">{$product.regular_price}</span>
						{/if}

						{hook h='displayProductPriceBlock' product=$product type="before_price"}

						<span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
						
						{hook h='displayProductPriceBlock' product=$product type='unit_price'}
						{hook h='displayProductPriceBlock' product=$product type='weight'}
					</div>
				{/if}
			{/block}

			{if !empty($product.specific_prices.from) && !empty($product.specific_prices.to) && $product.specific_prices.from != '0000-00-00 00:00:00' && $product.specific_prices.to != '0000-00-00 00:00:00'}
		      	{include file='catalog/_partials/miniatures/product-timer.tpl' timer=$product.specific_prices.to}
		    {/if}
		    
		</div>

		<div class="col-sm-12 col-md-3 tv-product-catalog-btn">
			<div class='tvproduct-catalog-btn-wrapper'>
				<div class='tv-product-cart-quentity-inner'>
					<button class='tvproduct-cart-quentity-decrement'>-</button>
					<input type='text' class='tvproduct-cart-quentity' value='1'>
					<button class='tvproduct-cart-quentity-increment'>+</button>
					
				</div>
				<div class="tvcatlog-button-wrapper">
					<div class="tvproduct-cart-catalog-btn">
						<form action="{$urls.pages.cart}" method="post">
							<input type="hidden" name="id_product" value="{$product.id_product}">
							<input type="hidden" name="qty" value="1">
							{if !empty($product.is_customizable) && count($product.customizations.fields)}
							<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
							{/if}
							<input type="hidden" name="token" value="{$static_token}">
							<button data-button-action="add-to-cart" type="submit" class="btn btn-primary add-to-cart tvproduct-add-to-cart {if !$product.add_to_cart_url}tvproduct-out-of-stock disable{/if}" title="{if !$product.add_to_cart_url}{l s='Out Of Stock' d='Shop.Theme.Actions'}{else}{l s='Add To Cart' d='Shop.Theme.Actions'}{/if}" {if !$product.add_to_cart_url}disabled{/if} data-toggle="tvtooltip" data-placement="top" data-html="true" data-original-title="{if !$product.add_to_cart_url}{l s='Out Of Stock' d='Shop.Theme.Actions'}{else}{l s='Add To Cart' d='Shop.Theme.Actions'}{/if}">
								<i class='material-icons'>&#xe8cc;</i>
								<span class="tvproduct-add-to-cart-label">{if !$product.add_to_cart_url}{l s='Out Of Stock' d='Shop.Theme.Actions'}{else}{l s='Add To Cart' d='Shop.Theme.Actions'}{/if} </span>
							</button>
						</form>
					</div>
					<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} tvproduct-quick-btn">
						{block name='quick_view'}
							<a class="quick-view" href="#" data-link-action="quickview" data-toggle="tvtooltip" data-placement="top" data-html="true" title="{l s='Quick View' d='Shop.Theme.Actions'}" data-original-title="{l s='Quick View' d='Shop.Theme.Actions'}">
								<div class="tvproduct-quick-icon">
									<i class="material-icons search">&#xE8B6;</i>
								</div>
								<div class="tvproduct-quick-lable">
									{l s='Quick View' d='Shop.Theme.Actions'}
								</div>
							</a>
						{/block}
					</div>
			</div>
			</div>
		</div>
	</div>
</div>
{/strip}
