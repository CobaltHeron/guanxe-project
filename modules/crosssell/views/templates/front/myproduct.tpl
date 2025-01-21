<div class="product-carousel">
    <p>"ESTO ES EL NUEVO HOOK"</p>
    {foreach from=$products item=product}
        <div class="product-item">
            <a href="{$product.link}">
                <img src="{$product.cover.bySize.home_default.url}" alt="
{$product.name}">
                <h3>{$product.name}</h3>
            </a>
        </div>
    {/foreach}
</div>