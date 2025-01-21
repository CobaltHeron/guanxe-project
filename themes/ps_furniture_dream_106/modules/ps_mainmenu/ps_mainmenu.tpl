{strip}


{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
      <ul class="tv-header-menu" {if $depth == 0}id="tv-top-menu"{/if} data-depth="{$depth}">
        {if $depth == 0}
          <li class="{if $page.page_name=='index'}current {/if} tvmain-menu-wrapper ">
            <div class="tvmenu-link-wrapper">
              <a href="{$urls.pages.index}" data-depth="{$depth}">
                <span class="tvmain-menu-text-box">{l s='Home' d='Shop.Theme.Catalog'}</span>
              </a>
            </div>
          </li>
        {/if}
        {foreach from=$nodes item=node}
            <li class="{$node.type}{if $node.current} current {/if} tvmain-menu-wrapper {if $node.children|count}tv-has-child{/if}" id="{$node.page_identifier}" {if $node.children|count}{assign var=_expand_id value=10|mt_rand:100000}child-dropdown='top_sub_menu_{$_expand_id}'{/if}>
            {assign var=_counter value=$_counter+1}
            <div class="tvmenu-link-wrapper">
              <a
                class="{if $depth === 1} tvdropdown-submenu{/if} tvmenu-link"
                href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if}>                                
                <span class="tvmain-menu-text-box">
                   {$node.label}
                </span>
              </a>
              {if $node.children|count}
                <span class="tvmenu-toggle-icon">
                  <i class='material-icons tvhorizontal-menu-drop-down-icon'>&#xe313;</i>
                </span>
              {/if}
              </div>
              {if $node.children|count}
              <div {if $depth === 0 }  class="tvmain-menu-dropdown tvmain-menu-sub-menu tvmain-menu-mobile-dropdown " {elseif $depth === 1 } class="tvmain-menu-mobile-dropdown" {else} class="" {/if} >
                {menu nodes=$node.children depth=$node.depth parent=$node}
                {if $depth === 0 && $node.children.0.children}
                  {if $node.image_urls}
                    {foreach $node.image_urls as $image}
                      <div class="tvheader-top-menu-img">
                          <img src="{$image}" alt="{$node.label}">
                      </div>
                    {/foreach}
                  {/if}
                {/if}
              </div>
              {/if}
            </li>
        {/foreach}
      </ul>
    {/if}
{/function}

<div id='tvcmsdesktop-main-menu'>
  <div class='tvcmsmain-menu-wrapper' {* id="_desktop_top_menu" *}>
      {menu nodes=$menu.children}
      <div class="clearfix"></div>
      <div class="tvmenu-button-wrapper">
        <div class="tvmenu-button">
          <span>Menu</span>
        </div>
      </div>
  </div>
</div>

{/strip}
