{block name="title" prepend}{$LNG.nav_rules}{/block}
{block name="content"}
<main role="main" class="l-main">
    <section class="l-section">
        <div class="c-card c-card--center c-card--alignCenter">
            <header class="c-card__header">
                <h1>{$LNG.nav_rules}</h1>
                <span class="c-card__border"></span>
            </header>
            <div class="c-card__content">
                <span class="c-card__contentBorder"></span>
                <div class="c-card__innerContent">
                    {$rules}
                </div>
            </div>
        </div>  
    </section>   
</main>
{/block}