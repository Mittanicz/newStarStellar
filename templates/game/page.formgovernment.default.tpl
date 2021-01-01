{block name="title" prepend}{$LNG.lm_formgovernment}{/block}
{block name="content"}
{strip}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.tech.{$name}}</h1>
        </div>
        <div class="l-card__content">
            <div class="l-grid l-grid--mansory u-mb-30">
                {foreach $FormgovernmentList as $ID => $Element}
                    <div class="c-card" id="ofic_{$ID}" data-collapse="#{$ID}">
                        <div class="c-card__header">
                            {$LNG.tech.{$ID}}
                        </div>
                        <div class="c-card__content">
                            <div onclick="return Dialog.info({$ID})">
                                <img class="c-card__img" src="{$dpath}img/game/gebaeude/{$ID}.png" alt="{$ID}" />
                            </div>
                        </div>
                        <div class="c-card__contentInfo" id="{$ID}">
                            <div class="c-card__contentInfo__wrapper">
                                <div class="c-card__req">
                                    <h4 class="c-card__title">{$LNG.tech.{$ID}}</h4>
                                    <ul class="ul-list">
                                        <li class="ul-list__item">
                                            {foreach $Element.elementBonus as $BonusName => $Bonus}
                                                {if $Bonus[0] < 0}
                                                    -
                                                {else}
                                                    +
                                                {/if}
                                                {if $Bonus[1] == 0}
                                                    {abs($Bonus[0] * 100)}%
                                                {else}
                                                    {floatval($Bonus[0])}
                                                {/if} 
                                                    {$LNG.bonus.$BonusName}
                                            {/foreach}
                                        </li>
                                        {foreach $Element.costResources as $RessID => $RessAmount}
                                            <li 
                                                class="ul-list__item" 
                                                id="price{$ID}" 
                                                style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}"
                                            >
                                                <img height="15" width="15" src="{$dpath}img/game/resources/{$RessID}f.png">
                                                {$RessAmount|number}
                                            </li>
                                        {/foreach}
                                    </ul>
                                    <form action="game.php?page=officier" method="post" class="build_form" id="Gov">
                                        {if $Element.maxLevel <= $Element.level}
                                            <s-button disabled>{$LNG.bd_maxlevel}</s-button>
                                        {elseif $Element.buyable}
                                            <form action="game.php?page=officier" method="post" class="build_form">
                                                <input name="id" value="{$ID}" type="hidden">      
                                                {foreach $Element.costResources as $RessID => $RessAmount}
                                                    <input id="amount{$ID}" class="u-vhide" onchange="Price{$RessID}('{$ID}', {$RessAmount});" name="amount" max="{$Element.maxLevel}" min="1" value="1" type="number">
                                                {/foreach}
                                                <s-button type="submit" disabled>
                                                    {$LNG.bd_buy}
                                                </s-button>
                                            </form>
                                        {else}
                                            <s-button block disabled>
                                                {$LNG.bd_notres}
                                            </s-button>
                                        {/if}
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="l-card__sideBar">
                <aside class="l-cardBox l-cardBox--mobileHide" id="buildInfoDesktop">
                    <div class="c-card__contentInfo c-card__contentInfo--desktop">
                        <h4 class="l-queueBox__title">Form goverment</h4>
                        {foreach $FormgovernmentList as $ID => $Element}
                            <div class="c-card__contentInfo__wrapper" id="{$ID}Desktop" style="display: none;">
                                <div class="c-card__req">
                                    <h4 class="c-card__title">{$LNG.tech.{$ID}}</h4>
                                    <ul class="ul-list">
                                        <li class="ul-list__item">
                                            {foreach $Element.elementBonus as $BonusName => $Bonus}
                                                {if $Bonus[0] < 0}
                                                    -
                                                {else}
                                                    +
                                                {/if}
                                                {if $Bonus[1] == 0}
                                                    {abs($Bonus[0] * 100)}%
                                                {else}
                                                    {floatval($Bonus[0])}
                                                {/if} 
                                                    {$LNG.bonus.$BonusName}
                                            {/foreach}
                                        </li>
                                        {foreach $Element.costResources as $RessID => $RessAmount}
                                            <li 
                                                class="ul-list__item" 
                                                id="price{$ID}" 
                                                style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}"
                                            >
                                                <img height="15" width="15" src="{$dpath}img/game/resources/{$RessID}f.png">
                                                {$RessAmount|number}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                <div class="c-card__footer">
                                    <form action="game.php?page=officier" method="post" class="build_form" id="Gov">
                                        {if $Element.maxLevel <= $Element.level}
                                            <s-button disabled block>{$LNG.bd_maxlevel}</s-button>
                                        {elseif $Element.buyable}
                                            <form action="game.php?page=officier" method="post" class="build_form">
                                                <input name="id" value="{$ID}" type="hidden">      
                                                {foreach $Element.costResources as $RessID => $RessAmount}
                                                    <input 
                                                        id="amount{$ID}" 
                                                        class="u-vhide" 
                                                        onchange="Price{$RessID}('{$ID}', {$RessAmount});" 
                                                        name="amount" 
                                                        max="{$Element.maxLevel}"
                                                        min="1"
                                                        value="1" 
                                                        type="number"
                                                    />
                                                {/foreach}
                                                <s-button type="submit" block disabled>
                                                    {$LNG.bd_buy}
                                                </s-button>
                                            </form>
                                        {else}
                                            <s-button block disabled>
                                                {$LNG.bd_notres}
                                            </s-button>
                                        {/if}
                                    </form>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </aside>
            </div>
        </div>        
    </div>
</section>
{/strip}
{/block}