{strip}
{block name="title" prepend}{$LNG.lm_ars}{/block}
{block name="content"}
{* This page is not finished. What is this page about *}
<section class="l-section">
    {if $arsList}
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_ars}</h1>
        </div>
        <div class="l-card__content">
            <div class="l-grid l-grid--mansory u-mb-30">
                {foreach $arsList as $ID => $Element}
                    <div class="c-card">
                        <div class="c-card__header">
                            {$LNG.tech.{$ID}} ({$LNG.bd_lvl} {$Element.level|number})
                        </div>
                        <div class="c-card__content ">
                            <img class="c-card__img" src="{$dpath}img/game/gebaeude/{$ID}.gif" alt="{$ID}" />
                        </div>
                        <div class="c-card__contentInfo c-card__contentInfo--desktop">
                            <ul class="ul-list">
                                {foreach $Element.elementBonus as $BonusName => $Bonus}
                                    <li class="ul-list__item">
                                        {if $Bonus[0] < 0}
                                            -
                                        {else}
                                            +
                                        {/if}
                                        {if $Bonus[1] == 0}
                                            {abs($Bonus[0] * 100)}%
                                        {else}
                                            {floatval($Bonus[0])}
                                        {/if} {$LNG.bonus.$BonusName}
                                    </li>
                                {/foreach}
                            </ul>                        
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
    {/if}
</section>
{/block}
{/strip}