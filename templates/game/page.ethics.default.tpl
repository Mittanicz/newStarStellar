{block name="title" prepend}{$LNG.lm_ethics}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_overview}</h1>
        </div>   
        <div class="l-card__content">
            {if $EthicsList}
                <div class="l-grid l-grid--mansory u-mb-30">
                    {foreach $EthicsList as $ID => $Element}
                        <div id="ofic_{$ID}" class="c-card" data-collapse="#{$ID}">
                            <div class="c-card__header">
                                {$LNG.tech.{$ID}}
                            </div>                        
                            <div class="c-card__content">
                                <img 
                                    onclick="return Dialog.info({$ID})" 
                                    class="c-card__img" 
                                    src="{$dpath}img/game/gebaeude/{$ID}.png" 
                                    alt="{$ID}" 
                                />
                                <div class="c-card__contentInfo" id="{$ID}">
                                   {$LNG.in_bonus}<br>
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
                                        {$LNG.bonus.$BonusName}<br>
                                    {/foreach}
                                    {if $Element.maxLevel <= $Element.level}
                                        <s-button disabled block>{$LNG.et_yes}</s-button>
                                        {elseif $Element.buyable}
                                            <form action="game.php?page=ethics" method="post" class="build_form">
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
                                                <s-button type="submit" disabled>
                                                    {$LNG.et_one} 
                                                    {foreach $Element.costResources as $RessID => $RessAmount} {$LNG.tech.{$RessID}}
                                                        {$RessAmount|number}
                                                    {/foreach}
                                                </s-button>
                                            </form>
                                        {else}                                        
                                        <s-button disabled block>{$LNG.et_one} 
                                            {foreach $Element.costResources as $RessID => $RessAmount} 
                                                {$LNG.tech.{$RessID}} {$RessAmount|number}
                                            {/foreach}
                                        </s-button>
                                    {/if}
                                </div> 
                            </div>
                        </div>
                    {/foreach}
                </div>
            {/if}
            <div class="l-card__sideBar">
                <aside class="l-cardBox l-cardBox--mobileHide" id="buildInfoDesktop">
                    <div class="c-card__contentInfo c-card__contentInfo--desktop">
                        <h4 class="l-queueBox__title">ethics info</h4>
                        {foreach $EthicsList as $ID => $Element}
                            <div class="c-card__contentInfo__wrapper" id="{$ID}Desktop" style="display: none;">
                                <div class="c-card__req">
                                    <h4 class="c-card__title">{$LNG.tech.{$ID}}</h4>
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
                                                {/if}
                                                {$LNG.bonus.$BonusName}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                <div class="c-card__footer">
                                    <form action="game.php?page=ideologies" method="post" class="build_form" id="Gov">
                                        {if $Element.maxLevel <= $Element.level}
                                            <s-button disabled block>{$LNG.bd_maxlevel}</s-button>
                                        {elseif $Element.buyable}
                                            <form action="game.php?page=ideologies" method="post" class="build_form">
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
{/block}