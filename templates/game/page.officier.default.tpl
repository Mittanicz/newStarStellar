{block name="title" prepend}{$LNG.lm_officiers}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="script"}
<script type="text/javascript" src="./scripts/game/price.js?v=6"></script>
{/block}
{block name="content"}
{strip}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_officiers}</h1>
        </div>
        <div class="l-card__content">
            <div class="l-grid l-grid--mansory u-mb-30">
                {foreach $officierList as $ID => $Element}
                    <div class="c-card" id="ofic_{$ID}" data-collapse="#{$ID}">
                        <div class="c-card__header">
                            {$LNG.tech.{$ID}}
                            ({$LNG.bd_lvl} {$Element.level}/{$Element.maxLevel})
                        </div>
                        <div class="c-card__content">
                            <div onclick="return Dialog.info({$ID})">
                                <img class="c-card__img" src="{$dpath}img/game/gebaeude/{$ID}.gif" alt="{$ID}" />
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
                                {if !$Element.techacc}
                                    <div class="c-card__req">
                                        <h4 class="c-card__title">{$LNG.bd_needed_tech}</h4>
                                        <ul class="ul-list ul-list--inRow">
                                            {foreach $Element.AllTech as $elementID => $requireList}
                                                {foreach $requireList as $requireID => $NeedLevel}
                                                <li class="ul-list__item">
                                                    <a 
                                                        href="#" 
                                                        onclick="return Dialog.info({$requireID})" 
                                                        class="c-requirerment tooltip" data-tooltip-content="<span style='color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};'>{$LNG.tech.$requireID} {$LNG.tt_lvl}  {$NeedLevel.count} ({$NeedLevel.own}/{$NeedLevel.count})</span>"
                                                        >
                                                        <img src="{$dpath}img/game/gebaeude/{$requireID}.gif" alt="{$LNG.tech.$requireID}" width="40" />
                                                        <span class="c-requirerment__text" style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">
                                                            {$NeedLevel.own}/{$NeedLevel.count}
                                                        </span>
                                                    </a>            
                                                </li>
                                                {/foreach}
                                            {/foreach}
                                        </ul>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="l-card__sideBar">
                <aside class="l-cardBox l-cardBox--mobileHide" id="buildInfoDesktop">
                    <div class="c-card__contentInfo c-card__contentInfo--desktop">
                        <h4 class="l-queueBox__title">officier info</h4>
                        {foreach $officierList as $ID => $Element}
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
                                {if !$Element.techacc}
                                    <div class="c-card__req">
                                        <h4 class="c-card__title">{$LNG.bd_needed_tech}</h4>
                                        <ul class="ul-list ul-list--inRow">
                                            {foreach $Element.AllTech as $elementID => $requireList}
                                                {foreach $requireList as $requireID => $NeedLevel}
                                                <li class="ul-list__item">
                                                    <a 
                                                        href="#" 
                                                        onclick="return Dialog.info({$requireID})" 
                                                        class="c-requirerment tooltip" 
                                                        data-tooltip-content="<span style='color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};'>{$LNG.tech.$requireID} {$LNG.tt_lvl}  {$NeedLevel.count} ({$NeedLevel.own}/{$NeedLevel.count})</span>"
                                                    >
                                                        <img src="{$dpath}img/game/gebaeude/{$requireID}.gif" alt="{$LNG.tech.$requireID}" width="40" />
                                                        <span class="c-requirerment__text" style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">
                                                            {$NeedLevel.own}/{$NeedLevel.count}
                                                        </span>
                                                    </a>            
                                                </li>
                                                {/foreach}
                                            {/foreach}
                                        </ul>
                                    </div>
                                {/if}
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
        <footer class="l-card__footer">
            <ul class="l-card__footerNav">
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=overview">{$LNG.lm_overview}</a>
                </li>
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=buildings">{$LNG.lm_buildings}</a>
                </li>
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=research">{$LNG.lm_research}</a>
                </li>
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=shipyard&amp;mode=fleet">{$LNG.lm_shipshard}</a>
                </li>
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=shipyard&amp;mode=defense">{$LNG.lm_defenses}</a>
                </li>
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=resources">{$LNG.lm_resources}</a>
                </li>
            </ul>
        </footer> 
    </div>
</section>
{/block}
{/strip}