<div class="product-carousel">
{*    {$products|@print_r}*}
    {foreach from=$products item=product}
        <div class="product-item">
            <a href="{$product.link}">
                <img src="{$product.cover.bySize.home_default.url}" alt="
{$product.name}">
                <h3>{$product.rate}</h3>
                <h3>{$product.name}</h3>
                <h3>{$product.price}</h3>
            </a>
        </div>
    {/foreach}
</div>





{*---------------------------------------*}

{*<div class="product-carousel">*}
{*    {foreach from=$products item=product}*}
{*        <div class="product-item">*}
{*            <a href="{$product.link}">*}
{*                <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name}">*}
{*                <h3>{$product.name}</h3>*}
{*                <h3>{$product.price}</h3>*}
{*            </a>*}
{*            <div class="product-rating">*}
{*                {if $product.rating > 0}*}
{*                    {for $i=1 to 5}*}
{*                        {if $i <= $product.rating}*}
{*                            <i class="fa fa-star"></i>*}
{*                        {else}*}
{*                            <i class="fa fa-star-o"></i>*}
{*                        {/if}*}
{*                    {/for}*}
{*                {else}*}
{*                    <span>No ratings yet</span>*}
{*                {/if}*}
{*            </div>*}
{*        </div>*}
{*    {/foreach}*}
{*</div>*}