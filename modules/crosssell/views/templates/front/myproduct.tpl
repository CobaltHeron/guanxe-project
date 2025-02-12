<div class="block_featured_slider">
    <div class="header_featured_slider"><span>Sugerencias personalizadas para ti</span></div>
    <div class="content_featured_slider grid" id="products">
        <div class="featured-list products">
            {foreach $products as $product}
                {include file='/var/www/html/guanxe/modules/crosssell/views/templates/front/product.tpl' product=$product}
            {/foreach}
        </div>
    </div>
</div>