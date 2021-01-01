{block name="title" prepend}{$LNG.fcm_info}{/block}
{block name="content"}
<main role="main" class="l-main">
	<section class="l-section">
		<div class="c-card c-card--center">
			<div class="c-card__header">
				<h1>{$LNG.fcm_info}</h1>
				<span class="c-card__border"></span>
			</div>
			<div class="c-card__content">
				<span class="c-card__contentBorder"></span>
				<p class="u-text-center">
                    {$message} 
                    {if !empty($redirectButtons)} 
                        {foreach $redirectButtons as $button}
                            <a class="c-btn" href="{$button.url}">
                                {$button.label}
                            </a>
                        {/foreach}
                    {/if}
                </p>	
			</div>
		</div>
	</section>
</main>
{/block}