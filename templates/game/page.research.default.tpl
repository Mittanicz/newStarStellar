{strip}
{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_research}</h1>
        </div>
        <div class="l-card__content">
            <div class="l-grid l-grid--mansory">
                {foreach $ResearchList as $ID => $Element} 
                    <div class="c-card" data-collapse="#{$ID}">
                        <div class="c-card__header">
                            {$LNG.tech.{$ID}}
                            {if $Element.level > 0} 
                                ({$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}
                                {/if})
                            {/if}
                        </div>
                        <div class="c-card__content">
                            <div>
                                <img class="c-card__img" src="{$dpath}img/game/gebaeude/research/{$ID}.png" alt="" />
                            </div>
                            {if !$Element.techacc}{elseif $Element.maxLevel == $Element.levelToBuild}
                            {elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
                            {else}
                            <div>
                                <form method="post" action="game.php?page=research">
                                    <input type="hidden" value="insert" name="cmd"></input>
                                    <input type="hidden" value="{$ID}" name="tech"></input>
                                    <input type="hidden" value="{$Element.levelToBuild}" name="levelToBuildInFo"></input>	
                                    <input type="hidden" value="{$Element.level}" name="lvlup1"></input>
                                    <input id="b_input_{$ID}" class="u-vhide" type="number" value="{$Element.levelToBuild + 1}" min="{$Element.levelToBuild + 1}" maxlength="3" size="3" name="lvlup" onchange="counting('{$ID}');"></input>
                                    <button class="c-card__btnIcon is-build" type="submit"><img src="{$dpath}img/icons/ui/arrowUp.svg" width="10" alt="" /></button>
                                </form>
                            </div>
                            {/if}                      
                        </div>
                        <div class="c-card__contentInfo" id="{$ID}">
                            <div class="c-card__contentInfo__wrapper">
                                <div class="c-card__req">
                                    <h4 class="c-card__title">{$LNG.tech.{$ID}}</h4>
                                    <ul class="ul-list {if $Element.techacc} ul-list--inRow {/if}">
                                        {foreach $Element.costResources as $RessID => $RessAmount}
                                        <li class="ul-list__item tooltip {if $Element.costOverflow[$RessID] == 0}{else}required{/if}" data-tooltip-content="<span>{$RessAmount}</span>">
                                            <img src="{$dpath}img/resources/{$RessID}f.png" alt="" width="15">
                                            <span>{$RessAmount|shortly_number}</span>                                        
                                        </li>
                                        {/foreach}
                                        {if !empty($Element.elementBonus)}
                                            {foreach $Element.elementBonus as $BonusName => $Bonus}
                                            <li class="ul-list__item tooltip" data-tooltip-content="{$LNG.bonus.$BonusName}">
                                                <img src="{$dpath}img/game/gebaeude/bonus/{$BonusName}.gif" alt="" width="15">
                                                <span >
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
                                                </span> 
                                            </li>
                                            {/foreach}
                                            {if !$Element.techacc}{elseif $Element.elementTime == 0}{else}
                                                <li class="ul-list__item">
                                                    <img src="{$dpath}img/icons/ui/clock.svg" width="10" alt="" />
                                                    <span>{$Element.elementTime|time}</span>
                                                </li>
                                            {/if}
                                        {/if}
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
                            <div class="c-card__footer">
                                {if !$Element.techacc}{elseif $Element.maxLevel == $Element.levelToBuild}
                                    <button class="c-btn c-btn--block" disabled>
                                        <span class="top-corner"></span>
                                        <span class="bottom-corner"></span>
                                        {$LNG.bd_maxlevel}
                                    </button>
                                {elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
                                <button class="c-btn c-btn--block" disabled>
                                    <span class="top-corner"></span>
                                    <span class="bottom-corner"></span>
                                    {if $Element.level == 0}
                                        {$LNG.bd_tech}
                                    {else}
                                        {$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}
                                    {/if}
                                </button>
                                {else}
                                <div>
                                    <form method="post" action="game.php?page=research">
                                        <input type="hidden" value="insert" name="cmd"></input>
                                        <input type="hidden" value="{$ID}" name="tech"></input>
                                        <input type="hidden" value="{$Element.levelToBuild}" name="levelToBuildInFo"></input>	
                                        <input type="hidden" value="{$Element.level}" name="lvlup1"></input>
                                        <input id="b_input_{$ID}" class="u-vhide" type="number" value="{$Element.levelToBuild + 1}" min="{$Element.levelToBuild + 1}" maxlength="3" size="3" name="lvlup" onchange="counting('{$ID}');"></input>
                                        <button class="c-btn c-btn--block" type="submit">
                                            <span class="top-corner"></span>
                                            <span class="bottom-corner"></span>
                                            {$LNG.bd_research}
                                        </button>
                                    </form>
                                </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="l-card__sideBar">
                {if !empty($Queue)}
                    <aside class="l-queueBox" id="buildQueue">
                        <h4 class="l-queueBox__title">Research queue</h4>
                        <div class="l-queueBox__content" style="display: none;" id="buildContent">
                            <ul class="ul-list">
                                {foreach $Queue as $List}
                                    {$ID = $List.element}
                                        {if !$List@first}
                                            <li class="ul-lis__item">
                                                <div class="c-queue">
                                                    <div class="c-queue__data">
                                                        <h4 class="u-text-center u-mb-10">{$LNG.tech.{$ID}}</h4>
                                                        <img src="{$dpath}img/game/gebaeude/research/{$ID}.png" alt="" width="50">
                                                    </div>
                                                    <div class="c-queue__action">
                                                        <form action="game.php?page=research" method="post" class="build_form">
                                                            <input type="hidden" name="cmd" value="cancel">
                                                            <button type="submit" class="del">
                                                                <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="" />
                                                            </button>
                                                        </form>
                                                        <form action="game.php?page=research" method="post" class="build_form">
                                                            <input type="hidden" name="cmd" value="remove">
                                                            <input type="hidden" name="listid" value="{$List@iteration}">
                                                            <button type="submit" class="del">
                                                                <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="" />
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                                {/if}
                                            </li>
                                    {/foreach}
                                </ul>
                                <div id="buildProgressMobile" class="c-queue c-queue--first">
                                    {foreach $Queue as $List}
                                        {$ID = $List.element}
                                        {if $List@first}
                                            <div class="c-queue__data">
                                                <img src="{$dpath}img/game/gebaeude/research/{$ID}.png" alt="" width="50">
                                                <div class="u-mb-10 u-text-center" id="time" data-time="{$List.time}"></div>
                                                <div class="c-progressBar progressbarValueActive" {if $List@first} id="progressbar" data-time="{$List.resttime}"{/if} ></div>
                                            </div>
                                            <div>
                                                {if $List@first}
                                                    <form action="game.php?page=research" method="post" class="build_form">
                                                        <input type="hidden" name="queuetype" value="1">
                                                        <input type="hidden" name="cmd" value="fast">
                                                        <button type="submit" class="tooltip" data-tooltip-content="{$LNG.cost} {if $need_dm<10}{10}{else}{pretty_number($need_dm)}{/if} {$LNG.tech.921}">
                                                            <img src="{$dpath}img/icons/ui/arrowUp.svg" width="10" alt="" />
                                                        </button>
                                                    </form>
                                                {else}    
                                                    <form action="game.php?page=research" method="post" class="build_form">
                                                        <input type="hidden" name="cmd" value="remove">
                                                        <input type="hidden" name="listid" value="{$List@iteration}">
                                                        <button type="submit" class="tooltip" data-tooltip-content="{$LNG.cost} {if $need_dm<10}{10}{else}{pretty_number($need_dm)}{/if} {$LNG.tech.921}">
                                                            <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="" />
                                                        </button>
                                                    </form>
                                                {/if}
                                            </div>
                                        {/if}
                                    {/foreach}
                                </div>

                            </ul>
                        </div>
                    </aside>
                {/if}
                    <aside class="l-cardBox" id="buildInfoDesktop">
                        <div class="c-card__contentInfo c-card__contentInfo--desktop">
                            <h4 class="l-queueBox__title">Research technology</h4>
                            {foreach $ResearchList as $ID => $Element} 
                            <div class="c-card__contentInfo__wrapper" id="{$ID}Desktop" style="display: none;">
                                <div class="c-card__req">
                                        <h4 class="c-card__title">{$LNG.tech.{$ID}} build info</h4>
                                        <ul class="ul-list {if $Element.techacc} ul-list--inRow {/if}">
                                            {foreach $Element.costResources as $RessID => $RessAmount}
                                            <li class="ul-list__item tooltip {if $Element.costOverflow[$RessID] == 0}{else}required{/if}" data-tooltip-content="<span>{$RessAmount}</span>">
                                                <img src="{$dpath}img/resources/{$RessID}f.png" alt="" width="15">
                                                <span>{$RessAmount|shortly_number}</span>                                        
                                            </li>
                                            {/foreach}
                                            {if !empty($Element.elementBonus)}
                                                {foreach $Element.elementBonus as $BonusName => $Bonus}
                                                <li class="ul-list__item tooltip" data-tooltip-content="{$LNG.bonus.$BonusName}">
                                                    <img src="{$dpath}img/game/gebaeude/bonus/{$BonusName}.gif" alt="" width="15">
                                                    <span >
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
                                                    </span> 
                                                </li>
                                                {/foreach}
                                                {if !$Element.techacc}{elseif $Element.elementTime == 0}{else}
                                                    <li class="ul-list__item">
                                                        <img src="{$dpath}img/icons/ui/clock.svg" width="10" alt="" />
                                                        <span>{$Element.elementTime|time}</span>
                                                    </li>
                                                {/if}
                                            {/if}
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
                                <div class="c-card__footer">
                                    {if !$Element.techacc}{elseif $Element.maxLevel == $Element.levelToBuild}
                                        <button class="c-btn c-btn--block" disabled>
                                            <span class="top-corner"></span>
                                            <span class="bottom-corner"></span>
                                            {$LNG.bd_maxlevel}
                                        </button>
                                    {elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
                                    <button class="c-btn c-btn--block" disabled>
                                        <span class="top-corner"></span>
                                        <span class="bottom-corner"></span>
                                        {if $Element.level == 0}
                                            {$LNG.bd_tech}
                                        {else}
                                            {$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}
                                        {/if}
                                    </button>
                                    {else}
                                    <div>
                                        <form method="post" action="game.php?page=research">
                                            <input type="hidden" value="insert" name="cmd"></input>
                                            <input type="hidden" value="{$ID}" name="tech"></input>
                                            <input type="hidden" value="{$Element.levelToBuild}" name="levelToBuildInFo"></input>	
                                            <input type="hidden" value="{$Element.level}" name="lvlup1"></input>
                                            <input id="b_input_{$ID}" class="u-vhide" type="number" value="{$Element.levelToBuild + 1}" min="{$Element.levelToBuild + 1}" maxlength="3" size="3" name="lvlup" onchange="counting('{$ID}');"></input>
                                            <button class="c-btn c-btn--block" type="submit">
                                                <span class="top-corner"></span>
                                                <span class="bottom-corner"></span>
                                                {$LNG.bd_research}
                                            </button>
                                        </form>
                                    </div>
                                    {/if}
                                </div>
                            </div>
                        {/foreach}
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
            <li class="l-card__footerItem is-active">
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
<script type="text/javascript">
    DatatList		= {
        {foreach $ResearchList as $ID => $Element}
        "{$ID}":{ "id":"{$ID}","elvl":"0 ","level":"{$Element.level}","maxLevel":"{$Element.maxLevel}","factor":"{$Element.factor}","costRessources":{ {foreach $Element.costResources as $RessID => $RessAmount}"{$RessID}":{$RessAmount}{if !$RessAmount@last},{/if}{/foreach} },"costOverflow":{ {foreach $Element.costOverflow as $RessID => $RessAmount}"{$RessID}":{$RessAmount}{if !$RessAmount@last},{/if}{/foreach} },"elementTime":{$Element.elementTime},"buyable":true }{if !$Element@last},{/if}
        {/foreach}
    };
   	bd_operating	= '(busy)';
   	LNGning			= '{$LNG.bd_remaining}';
   	LNGtech901		= '{$LNG.tech.901}';
   	LNGtech902		= '{$LNG.tech.902}';
   	LNGtech903		= '{$LNG.tech.903}';
   	LNGtech911		= '{$LNG.tech.911}';
   	LNGtech921		= '{$LNG.tech.921}';
   	short_day 		= '{$LNG.short_day}';
   	short_hour 		= '{$LNG.short_hour}';
   	short_minute 	= '{$LNG.short_minute}';
   	short_second 	= '{$LNG.short_second}';
</script>
{/block}
{/strip}