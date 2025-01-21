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
<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}" {if Configuration::get('TVCMSCUSTOMSETTING_ADD_CONTAINER')} style='{hook h="displayBackgroundBody"}' {/if}
  data-mouse-hover-img='{Configuration::get("TVCMSCUSTOMSETTING_HOVER_IMG")}'
  data-menu-sticky='{Configuration::get("TVCMSCUSTOMSETTING_MAIN_MENU_STICKY")}'>

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    {* Start Theme Option *}
    {hook h='displayThemeOptions'}
    {* End Theme Option *}

    <main>
      {* Start page loader *}
      {include file='_partials/tvcms-page-loader.tpl'}
      {* End page loader *}

      <div class="{if Configuration::get('TVCMSCUSTOMSETTING_ADD_CONTAINER')}tv-box-layout container {/if}tv-main-div">

        {block name='product_activation'}
          {include file='catalog/_partials/product-activation.tpl'}
        {/block}

        <header id="header">
          {block name='header'}
            {include file='_partials/header.tpl'}
          {/block}
        </header>

        {block name='notifications'}
          {include file='_partials/notifications.tpl'}
        {/block}

        <section id="wrapper">
          {block name='breadcrumb'}
              {include file='_partials/breadcrumb.tpl'}
            {/block}
          {hook h="displayWrapperTop"}
          <div class="{if $page.page_name != 'index' || isset($page.body_classes['layout-left-column'])}container tv-left-layout{else}tv-full-layout {if isset($page.body_classes['layout-full-width'])}tvcms-full-layout{elseif isset($page.body_classes['layout-both-columns'])}tvcms-left-right-layout{elseif isset($page.body_classes['layout-left-column'])}tvcms-left-layout{elseif isset($page.body_classes['layout-right-column'])}tvcms-right-layout{/if}{/if}">
            


            {block name="left_column"}
              <div id="left-column" class="col-xl-3 col-lg-4 col-md-3 col-sm-3 col-xs-12">
                <div class='tvleft-column-remove'>
                  <div class="tvleft-column-close-btn"></div>
                </div>
                {if $page.page_name == 'product'}
                  {hook h='displayLeftColumnProduct'}
                {else}
                  {hook h="displayLeftColumn"}
                {/if}
              </div>
            {/block}

            {block name="content_wrapper"}
              <div id="content-wrapper" class="left-column right-column col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-12{* {if isset($page.body_classes['layout-both-columns'])}col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-12{elseif isset($page.body_classes['layout-left-column']) || isset($page.body_classes['layout-right-column'])}col-xl-9 col-lg-9 col-md-9 col-sm-9 col-xs-12{/if} *}">
                {hook h="displayContentWrapperTop"}
                {block name="content"}
                  <p>Hello world! This is HTML5 Boilerplate.</p>
                {/block}
                {hook h="displayContentWrapperBottom"}
              </div>
            {/block}

            {block name="right_column"}
              <div id="right-column" class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class='tvright-column-remove'>
                  <div class="tvright-column-close-btn"></div>
                </div>
                {if $page.page_name == 'product'}
                  {hook h='displayRightColumnProduct'}
                {else}
                  {hook h="displayRightColumn"}
                {/if}
              </div>
            {/block}
          </div>
          {hook h="displayWrapperBottom"}          
        </section>

        <footer id="footer">
          {if $page.page_name == 'index'}
            {hook h="displayNewsLetterPopup"}
          {/if}
          
          {block name="footer"}
            {include file="_partials/footer.tpl"}
          {/block}
        </footer>
      
      </div>

    </main>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {* Start TVCMS file of javascript *}
      {include file="_partials/tvcms-javascript-files.tpl"}
    {* End TVCMS file of javascript *}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

</html>
{/strip}
