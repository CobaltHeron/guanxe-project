< class="cross-sell">
    <h2> Productos relacionados </h2>
    {if isset($recommended_products) && $recommended_products|@count>0}
    <ul class?="recommended-products">
        {foreach from=$recommended_products item=product}
            <li class="product">
                <a href="{$product.link}">
                {*<img src="{product.image}" alt="{$product.name}"/> *}
                    <p>{$product.name}</p>
                </a>
            </li>
        {/foreach}
    </ul>
    {else}
        <p>No hay productos recomendados</p>
    {/if}
    <p>{$recommended_products}</p>
    <p>Texto de ejemplo. De momento todo bien :)</p>
</div>