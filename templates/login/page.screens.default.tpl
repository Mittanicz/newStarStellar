{block name="title" prepend}{$LNG.nav_screens}{/block}
{block name="content"}
<main role="main" class="l-main">
    <section class="l-section">
        <div class="c-card c-card--center c-card--alignCenter">
            <header class="c-card__header">
                <h1>{$LNG.nav_screens}</h1>
                <span class="c-card__border"></span>
            </header>
            <div class="c-card__content">
                <span class="c-card__contentBorder"></span>
				<ul class="c-gallery">
				{foreach $screenshots as $screenshot}
					<li class="c-gallery__item">
						<a href="{$screenshot.path}" target="_blank" class="c-gallery__link" rel="gallery">
							<img src="{$screenshot.thumbnail}" alt="" width="120" height="120">
						</a>
					</li>
					{/foreach}
				</ul>
            </div>
        </div>  
    </section> 	
</main>
{/block}
{block name="afterScript"}
<script type="text/javascript" src="scripts/base/jquery.fancybox.js"></script>
    <script>
    $(function() {
        $(".c-gallery__link").fancybox();
    });
    </script>
{/block}
{block name="styleHeader"}
    <link rel="stylesheet" type="text/css" href="assets/css/base/jquery.fancybox.css">
{/block}
