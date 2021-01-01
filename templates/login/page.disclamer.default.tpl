{block name="title" prepend}{$LNG.nav_disclamer}{/block}
{block name="content"}
<main role="main" class="l-main">
    <section class="l-section">
        <div class="c-card c-card--center c-card--alignCenter">
            <header class="c-card__header">
                <h1>{$LNG.nav_disclamer}</h1>
                <span class="c-card__border"></span>
            </header>
            <div class="c-card__content">
                <span class="c-card__contentBorder"></span>
				<address class="c-card__innerContent">
					<strong>{$LNG.disclamerLabelAddress}</strong><br>
					{$disclamerAddress}
					<strong>{$LNG.disclamerLabelPhone}</strong><br>
					{$disclamerPhone}
					<strong>{$LNG.disclamerLabelMail}</strong><br>
					<a href="{$disclamerMail}">{$disclamerMail}</a>
					<strong>{$LNG.disclamerLabelNotice}</strong><br>
					{$disclamerNotice}
				</address>	
            </div>
        </div>  
    </section>   	
</main>
{/block}