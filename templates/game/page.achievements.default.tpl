{block name="title" prepend}{$LNG.lm_achievements}{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_achievements}</h1>
        </div>   
        <div class="l-card__content">
            {if $achievementsList}
                <div class="l-grid l-grid--mansory u-mb-30">
                    {foreach $achievementsList as $ID => $Element}
                        <div id="ofic_{$ID}" class="c-card" data-collapse="#{$ID}">
                            <div class="c-card__header">
                                {$LNG.tech.{$ID}}
                                ({$LNG.bd_lvl} {$Element.level}/{$Element.maxLevel})
                            </div>                        
                            <div class="c-card__content">
                                <img onclick="return Dialog.info({$ID})" class="c-card__img" src="{$dpath}img/game/gebaeude/{$ID}.gif" alt="{$ID}" />
                                <div class="c-card__contentInfo c-card__contentInfo--info">
                                    {foreach $Element.AllTech as $elementID => $requireList}
                                        {foreach $requireList as $requireID => $NeedLevel}
                                            <font color="{if $NeedLevel.own < $NeedLevel.count}#808080{else}#096{/if}">
                                                {$LNG.tech.$requireID} {$NeedLevel.count|number}<br>
                                            </font>
                                        {/foreach}
                                    {/foreach}
                                </div> 
                            </div>
                            <div 
                                class="c-card__btnIcon is-info tooltip" 
                                data-tooltip-content="
                                <span style='color:#3CF; font-weight:bold;'>Left:</span> <br>
                                {foreach $Element.AllTech as $elementID => $requireList}
                                    {foreach $requireList as $requireID => $NeedLevel}
                                        {if $NeedLevel.own < $NeedLevel.count}{$LNG.tech.$requireID} {($NeedLevel.count - $NeedLevel.own)|number}<br>{/if}
                                    {/foreach}
                                {/foreach}
                                <br><span style='color:#F90; font-weight:bold;'>Bonus on the next level:</span><br>
                                {foreach $Element.elementBonus as $BonusName => $Bonus}{if $Bonus[0] < 0}-{else}+{/if}{if $Bonus[1] == 0}{abs($Bonus[0] * 100)}%{else}{floatval($Bonus[0])}{/if} {$LNG.bonus.$BonusName}<br>{/foreach}
                                "
                            >?</div>
                        </div>
                    {/foreach}                
                </div>
            {/if}
        </div>
    </div>
</section>
{/block}