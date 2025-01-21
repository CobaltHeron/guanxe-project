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
{block name='product_miniature_item'}
<article class="tvleft-right-product-slider">
	<div class="thumbnail-container">
		<div class="tvproduct-wrapper">

			{block name='product_thumbnail'}
				<div class="tvproduct-image col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3">
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
				</div>
			{/block}

			<div class="product-description col-xl-9 col-lg-9 col-md-9 col-sm-9 col-xs-9">
				{block name='product_name'}
					<div class="tvproduct-name">
						<div class="product-title" itemprop="name">
							<a href="{$product.url}">{$product.name}</a>
						</div>
					</div>
				{/block}

				{block name='product_price_and_shipping'}
					{if $product.show_price}
						<div class="product-price-and-shipping">
							
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
							<span itemprop="price" class="price">{$product.price}</span>
						</div>
					{/if}
				{/block}

				{hook h='displayReviewProductList' product=$product}

			</div>
		</div>
	</div>
</article>
{/block}
{/strip}
