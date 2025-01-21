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
{if Configuration::get('TVCMSFRONTSIDE_THEME_SETTING_SHOW')}
    <!-- START THEME_CONTROL -->
    <link rel="stylesheet" type="text/css" href="{$urls.css_url}jquery.minicolors.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{$urls.css_url}bootstrap-toggle.min.css" rel="stylesheet">
    <script type="text/javascript" src="{$urls.js_url}themevolty/jquery.minicolors.js"></script>
    <script type="text/javascript" src="{$urls.js_url}themevolty/bootstrap-toggle.min.js"></script>
    <div class="tvcms-custom-theme"></div>
    <!-- END THEME_CONTROL -->
{/if}
{if Configuration::get('TVCMSCUSTOMSETTING_THEME_OPTION')}
    <!-- START THEME_CONTROL CUSTOM COLOR CSS -->
    {if Configuration::get('TVCMSCUSTOMSETTING_THEME_OPTION') == 'theme_custom'}
      <link rel="stylesheet" type="text/css" href="{$urls.css_url}{Configuration::get('TVCMSCUSTOMSETTING_THEME_CSS_PATH')}">
    {else}
      <link rel="stylesheet" type="text/css" href="{$urls.css_url}theme/{Configuration::get('TVCMSCUSTOMSETTING_THEME_OPTION')}.css">
    {/if}
      <!-- END THEME_CONTROL CUSTOM COLOR CSS -->
{/if}


<script type="text/javascript" src="{$urls.js_url}themevolty/owl.js"></script>
<!-- <script type="text/javascript" src="{$urls.js_url}themevolty/nivo.js"></script> -->
<script type="text/javascript" src="{$urls.js_url}themevolty/jquery.balance.js"></script>
<script type="text/javascript" src="{$urls.js_url}themevolty/jquery.lazy.min.js"></script>
<script type="text/javascript" src="{$urls.js_url}themevolty/jquery.lazy.plugins.min.js"></script>
<script type="text/javascript" src="{$urls.js_url}themevolty/jquery.elevatezoom.min.js"></script>

<script type="text/javascript" src="{$urls.js_url}themevolty/custom.js"></script>
{/strip}
