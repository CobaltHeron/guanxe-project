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
{block name='header_banner'}
<div class="tvcmsheader-banner">
	{hook h='displayBanner'}
</div>
{/block}

{block name='header_nav'}

{/block}

{block name='header_top'}
<div class="tvcmsdesktop-top-header-wrapper">
	<div class="container">
		<div class="row tvcmsdesktop-top-header-box">

			<div class='col-md-3 tvcms-header-logo-wrapper'>
				{* <div class='tvcmsvertical-menu-wrapper-box'>
					{hook h='displayVerticalMenu'}
				</div> *}

				<div class="hidden-sm-down tvcms-header-logo" id="tvcmsdesktop-logo">
					<div class="tv-header-logo">
						<a href="{$urls.base_url}">
						  <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-7 col-sm-12 position-static tvcms-header-menu">
				{* <div class='tvcmsvertical-menu-wrapper'>
					{hook h='displayVerticalMenu'}
				</div> *}

				<div class='tvcmsmain-menu-wrapper'>
					{hook h='displayNavMainMenuBlock'}
				</div>
			</div>

			<div class="col-md-2 col-sm-12 tvcmsheader-nav-right">
				<div class="tv-search-account-cart-wrapper">
					<div class="tvcms-header-myaccount">
						<div class="tv-header-account">
							<div class="tv-account-wrapper">
								<button class="btn-unstyle tv-myaccount-btn">
									{* <span>{l s='My Account' d='Shop.Theme.Catalog'}</span> *}
									<i class='material-icons'>&#xe7ff;</i>
								</button>
								<ul class="dropdown-menu tv-account-dropdown tv-dropdown">
									{hook h='displayNavLanguageBlock'}
									{hook h='displayNavCurrencyBlock'}
									{hook h='displayNavCustomerSignInBlock'}
								</ul>
							</div>
						</div>
					</div>
					{hook h='displayNavShoppingCartBlock'}
					<div class='tvcmssearch-wrapper' id="_desktop_search">
						{hook h='displayNavSearchBlock'}
					</div>
				</div>
			</div>
		</div>
		{* <div id="mobile_top_menu_wrapper" class="row hidden-md-up">
			<div class="js-top-menu mobile" id="_mobile_top_menu"></div>
			<div class="js-top-menu-bottom">
				<div id="_mobile_currency_selector"></div>
				<div id="_mobile_language_selector"></div>
				<div id="_mobile_contact_link"></div>
			</div> 
		</div> *}
	</div>
</div>
{hook h='displayNavFullWidth'}
{/block}

{include file='_partials/mobile-header.tpl'}
{/strip}
