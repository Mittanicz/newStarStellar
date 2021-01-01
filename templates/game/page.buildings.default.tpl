{strip}
{block name="title" prepend}{$LNG.lm_buildings}{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_buildings}</h1>
        </div>   
        <div class="l-card__content">
            <div class="l-grid l-grid--mansory u-mb-30">
                {foreach $BuildInfoList as $ID => $Element}
                    <div class="c-card" data-collapse="#{$ID}">
                        <div class="c-card__header">
                            {$LNG.tech.{$ID}}
                            {if $Element.level > 0} 
                                ({$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}
                                {/if})
                            {/if}
                        </div>
                        <div class="c-card__content">
                            <div onclick="return Dialog.info({$ID})">
                                <img class="c-card__img" src="{$dpath}img/game/gebaeude/buildings/{$ID}.png" alt="{$ID}" />
                            </div>
                            {if !$Element.techacc}{elseif $Element.maxLevel == $Element.levelToBuild}
                            {elseif ($isBusy.research && ($ID == in_array($ID, $reslist.lab))) || ($isBusy.shipyard && ($ID == in_array($ID, $reslist.shipyard)))}
                            {else}
                                {if $RoomIsOk}
                                    {if $CanBuildElement && $Element.buyable}
                                    <form method="post" action="game.php?page=buildings">
                                        <input type="hidden" value="insert" name="cmd"></input>
                                        <input type="hidden" value="{$ID}" name="building"></input>
                                        <input type="hidden" value="{$Element.level}" name="lvlup1"></input>
                                        <input type="hidden" value="{$Element.levelToBuild}" name="levelToBuildInFo"></input>	
                                        <input id="b_input_{$ID}" class="u-vhide" type="number" value="{$Element.levelToBuild + 1}" min="{$Element.levelToBuild + 1}" maxlength="3" size="3" name="lvlup" onchange="counting('{$ID}');"></input>
                                        <button class="c-card__btnIcon is-build" type="submit">
                                            <img src="{$dpath}img/icons/ui/arrowUp.svg" width="10" alt="" />
                                        </button>
                                        </form>
                                    {/if}
                                {/if}
                                {if $Element.level > 0 && (($ID == 44 && 0==$HaveMissiles) ||  $ID != 44)}
                                    <div class="c-card__btnIcon is-cancel" data-collapse="#{$ID}Cancel">
                                        <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="{$ID}Cancel" />
                                    </div>
                                {/if}                                
                            {/if} 
                        </div>
                        <div class="c-card__contentInfo" id="{$ID}Cancel">
                            <div class="c-card__contentInfo__wrapper">
                                <div class="c-card__req">
                                    <h4 class="c-card__title">{$LNG.bd_dismantle} {$LNG.tech.{$ID}}</h4>
                                    <ul class="ul-list">
                                        {foreach $Element.destroyResources as $ResType => $ResCount}
                                            <li class="ul-list__item">
                                                {$LNG.tech.{$ResType}}: 
                                                {$ResCount|number}
                                            </li>
                                        {/foreach}
                                        <li class="ul-list__item">
                                            {$LNG.bd_destroy_time}: {$Element.destroyTime|time}
                                        </li>
                                    </ul>
                                    <form action='game.php?page=buildings' method='post'>
                                        <input type='hidden' name='cmd' value='destroy'>
                                        <input type='hidden' name='building' value='{$ID}' />
                                        <button type='submit' class='c-btn c-btn--block'>
                                            <span class="top-corner"></span>
                                            <span class="bottom-corner"></span>
                                            {$LNG.bd_dismantle}
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="c-card__contentInfo" id="{$ID}">
                            <div class="c-card__contentInfo__wrapper">
                                <div class="c-card__req">
                                    <h4 class="c-card__title">{$LNG.tech.{$ID}} build info</h4>
                                    <ul class="ul-list {if $Element.techacc} ul-list--inRow {/if}">
                                        {foreach $Element.costResources as $RessID => $RessAmount}
                                            <li class="ul-list__item {if $Element.costOverflow[$RessID] == 0}{else}required{/if}">
                                                <img src="{$dpath}img/resources/{$RessID}f.png" alt="" width="15">
                                                <span class="tooltip" data-tooltip-content="<span>{$RessAmount}</span>">{$RessAmount|shortly_number}</span>                                        
                                            </li>
                                        {/foreach} 
                                        {foreach $Element.ressources as $res}
                                            {if !empty($Element.{$res + $Element.class_production})}
                                                <li class="ul-list__item">
                                                    {if $res == 911}
                                                        <a class="tooltip" data-tooltip-content="">
                                                            <img height="15" width="15" src="{$dpath}img/resources/{$res}f.png">
                                                            <span>{$Element.{$res + $Element.class_production}|number}</span>
                                                        </a>
                                                    {else}
                                                        <a class="tooltip" data-tooltip-content="">
                                                            <img height="15" width="15" src="{$dpath}img/resources/{$res}f.png">
                                                            <span>+{$Element.{$res + $Element.class_production}|number}</span>
                                                        </a>
                                                    {/if}
                                                </li>
                                            {/if}
                                        {/foreach}
                                        {if !$Element.techacc}{elseif $Element.elementTime == 0}{else}
                                            <li class="ul-list__item">
                                                <img src="{$dpath}img/icons/ui/clock.svg" width="10" alt="" />
                                                <span >{$Element.elementTime|time}</span>
                                            </li>
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
                            <footer class="c-card__footer">
                                {if !$Element.techacc}{elseif $Element.maxLevel == $Element.levelToBuild}
                                    <button class="c-btn c-btn--block" disabled>
                                        <span class="top-corner"></span>
                                        <span class="bottom-corner"></span>
                                        {$LNG.bd_maxlevel}
                                    </button>
                                {elseif ($isBusy.research && ($ID == in_array($ID, $reslist.lab))) || ($isBusy.shipyard && ($ID == in_array($ID, $reslist.shipyard)))}
                                <button class="c-btn c-btn--block" disabled>
                                    <span class="top-corner"></span>
                                    <span class="bottom-corner"></span>
                                    {$LNG.bd_working}
                                </button>
                                {else}
                                    {if $RoomIsOk}
                                        {if $CanBuildElement && $Element.buyable}
                                            <form method="post" action="game.php?page=buildings">
                                                <input type="hidden" value="insert" name="cmd"></input>
                                                <input type="hidden" value="{$ID}" name="building"></input>
                                                <input type="hidden" value="{$Element.level}" name="lvlup1"></input>
                                                <input id="b_input_{$ID}" class="u-vhide" type="number" value="{$Element.levelToBuild + 1}" min="{$Element.levelToBuild + 1}" maxlength="3" size="3" name="lvlup" onchange="counting('{$ID}');"></input>
                                                <input type="hidden" value="{$Element.levelToBuild}" name="levelToBuildInFo"></input>
                                                <button class="c-btn c-btn--block" type="submit">
                                                    <span class="top-corner"></span>
                                                    <span class="bottom-corner"></span>
                                                    {$LNG.bd_build}
                                                </button>
                                            </form>
                                        {else}
                                            <button class="c-btn c-btn--block" disabled>
                                                <span class="top-corner"></span>
                                                <span class="bottom-corner"></span>
                                                {if $Element.level == 0}
                                                    {$LNG.bd_build}
                                                {else}
                                                    {$LNG.bd_build_next_level}{$Element.levelToBuild + 1}
                                                {/if}
                                            </button>
                                        {/if}
                                    {else}
                                        <button class="c-btn c-btn--block" disabled>
                                            <span class="top-corner"></span>
                                            <span class="bottom-corner"></span>
                                            {$LNG.bd_no_more_fields}
                                        </button>
                                    {/if}
                                {/if}
                            </footer>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div class="l-card__sideBar">
                <aside class="l-cardBox l-cardBox--row u-mb-10">
                    <div class="c-visualProgress">
                        {$LNG.bd_em_field} <span>{$field_used}</span> {$LNG.bd_of_field} <span>{$field_max}</span>
                        {$LNG.bd_free_field} <span>{$field_left}</span>
                    </div>
                    {if isModuleAvailable($smarty.const.MODULE_BUY_BUILD) || isModuleAvailable($smarty.const.MODULE_BUY_BUILD)}
                        <ul class="ul-list">
                            <li class="ul-list__item">
                                {if isModuleAvailable($smarty.const.MODULE_BUY_BUILD)}
                                    <a href="game.php?page=buybuild" class="c-btn">
                                        <span class="top-corner"></span>
                                        <span class="bottom-corner"></span>
                                        {$LNG.lm_buybuild}
                                    </a>
                                {/if}
                            </li>
                            <li class="ul-list__item">
                                {if isModuleAvailable($smarty.const.MODULE_BUY_BUILD)}
                                    <a href="game.php?page=planet" class="c-btn tooltip" data-tooltip-content="{$LNG.lm_planet}">
                                        <span class="top-corner"></span>
                                        <span class="bottom-corner"></span>
                                        Edit planet
                                    </a>
                                {/if}
                            </li>
                        </ul>
                    {/if}
                </aside> 
                {if !empty($Queue)}
                    <aside class="l-queueBox u-mb-10" id="buildQueue">
                        <h4 class="l-queueBox__title">Build queue</h4>
                        <div class="l-queueBox__content" style="display: none;" id="buildContent">
                            <ul class="ul-list">
                                {foreach $Queue as $List}
                                    {$ID = $List.element}
                                    {if !$List@first}
                                    <li class="ul-list__item">
                                        <div class="c-queue">
                                            <div class="c-queue__data">
                                                <h4 class="u-text-center u-mb-10">{$LNG.tech.{$ID}}</h4>
                                                <img src="{$dpath}img/game/gebaeude/buildings/{$ID}.png" alt="" width="50">
                                            </div>
                                            <div class="c-queue__action">
                                                <form action="game.php?page=buildings" method="post">
                                                    <input type="hidden" name="cmd" value="cancel">
                                                    <button type="submit">
                                                        <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="" />
                                                    </button>
                                                </form>
                                                <form action="game.php?page=buildings" method="post">
                                                    <input type="hidden" name="cmd" value="remove">
                                                    <input type="hidden" name="listid" value="{$List@iteration}">
                                                    <button type="submit">
                                                        <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="" />
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        {/if}
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                        <div id="buildProgressMobile" class="c-queue c-queue--first">
                            {foreach $Queue as $List}
                                {$ID = $List.element}
                                {if $List@first}
                                    <div class="c-queue__data">
                                        <img src="{$dpath}img/game/gebaeude/buildings/{$ID}.png" alt="" width="50">
                                        <div class="u-mb-10 u-text-center" id="time" data-time="{$List.time}"></div>
                                        <div class="c-progressBar progressbarValueActive" {if $List@first} id="progressbar" data-time="{$List.resttime}"{/if} ></div>
                                    </div>
                                    <div>
                                        {if $List@first}
                                            <form action="game.php?page=buildings" method="post">
                                                <input type="hidden" name="cmd" value="cancel">
                                                <button type="submit">
                                                    <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="" />
                                                </button>
                                            </form>
                                            <form action="game.php?page=buildings" method="post">
                                                <input type="hidden" name="queuetype" value="1">
                                                <input type="hidden" name="cmd" value="fast">
                                                <button type="submit" class="tooltip" data-tooltip-content="{$LNG.cost} {if $need_dm<10}{10}{else}{pretty_number($need_dm)}{/if} {$LNG.tech.921}">
                                                    <img src="{$dpath}img/icons/ui/arrowUp.svg" width="10" alt="" />
                                                </button>
                                            </form>
                                        {else}
                                            <form action="game.php?page=buildings" method="post">
                                                <input type="hidden" name="cmd" value="remove">
                                                <input type="hidden" name="listid" value="{$List@iteration}">
                                                <button type="submit">
                                                    <img src="{$dpath}img/icons/ui/cross.svg" width="10" alt="" />
                                                </button>
                                            </form>
                                        {/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    </aside>
                {/if}
                <aside class="l-cardBox l-cardBox--mobileHide" id="buildInfoDesktop">
                    <div class="c-card__contentInfo c-card__contentInfo--desktop">
                        <h4 class="l-queueBox__title">Construct building</h4>
                        {foreach $BuildInfoList as $ID => $Element}
                        <div class="c-card__contentInfo__wrapper" id="{$ID}Desktop" style="display: none;">
                            <div class="c-card__req">
                                <h4 class="c-card__title">{$LNG.tech.{$ID}} build info</h4>
                                <ul class="ul-list {if $Element.techacc} ul-list--inRow {/if}">
                                    {foreach $Element.costResources as $RessID => $RessAmount}
                                        <li class="ul-list__item {if $Element.costOverflow[$RessID] == 0}{else}required{/if}">
                                            <img src="{$dpath}img/resources/{$RessID}f.png" alt="" width="15">
                                            <span class="tooltip" data-tooltip-content="<span>{$RessAmount}</span>">{$RessAmount|shortly_number}</span>                                        
                                        </li>
                                    {/foreach} 
                                    {foreach $Element.ressources as $res}
                                        {if !empty($Element.{$res + $Element.class_production})}
                                            <li class="ul-list__item">
                                                {if $res == 911}
                                                    <a class="tooltip" data-tooltip-content="">
                                                        <img height="15" width="15" src="{$dpath}img/resources/{$res}f.png">
                                                        <span>{$Element.{$res + $Element.class_production}|number}</span>
                                                    </a>
                                                {else}
                                                    <a class="tooltip" data-tooltip-content="">
                                                        <img height="15" width="15" src="{$dpath}img/resources/{$res}f.png">
                                                        <span>+{$Element.{$res + $Element.class_production}|number}</span>
                                                    </a>
                                                {/if}
                                            </li>
                                        {/if}
                                    {/foreach}
                                    {if !$Element.techacc}{elseif $Element.elementTime == 0}{else}
                                        <li class="ul-list__item">
                                            <img src="{$dpath}img/icons/ui/clock.svg" width="10" alt="" />
                                            <span >{$Element.elementTime|time}</span>
                                        </li>
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
                                {if !$Element.techacc}{elseif $Element.maxLevel == $Element.levelToBuild}
                                    <button class="c-btn c-btn--block" disabled>
                                        <span class="top-corner"></span>
                                        <span class="bottom-corner"></span>
                                        {$LNG.bd_maxlevel}
                                    </button>
                                {elseif ($isBusy.research && ($ID == in_array($ID, $reslist.lab))) || ($isBusy.shipyard && ($ID == in_array($ID, $reslist.shipyard)))}
                                <button class="c-btn c-btn--block" disabled>
                                    <span class="top-corner"></span>
                                    <span class="bottom-corner"></span>
                                    {$LNG.bd_working}
                                </button>
                                {else}
                                    {if $RoomIsOk}
                                        {if $CanBuildElement && $Element.buyable}
                                            <form class="build_form" method="post" action="game.php?page=buildings">
                                                <input type="hidden" value="insert" name="cmd"></input>
                                                <input type="hidden" value="{$ID}" name="building"></input>
                                                <input type="hidden" value="{$Element.level}" name="lvlup1"></input>
                                                <input id="b_input_{$ID}" class="u-vhide" type="number" value="{$Element.levelToBuild + 1}" min="{$Element.levelToBuild + 1}" maxlength="3" size="3" name="lvlup" onchange="counting('{$ID}');"></input>
                                                <input type="hidden" value="{$Element.levelToBuild}" name="levelToBuildInFo"></input>
                                                <button class="c-btn c-btn--block" type="submit">
                                                    <span class="top-corner"></span>
                                                    <span class="bottom-corner"></span>
                                                    {$LNG.bd_build}
                                                </button>
                                            </form>
                                        {else}
                                            <button class="c-btn c-btn--block" disabled>
                                                <span class="top-corner"></span>
                                                <span class="bottom-corner"></span>
                                                {if $Element.level == 0}
                                                    {$LNG.bd_build}
                                                {else}
                                                    {$LNG.bd_build_next_level}{$Element.levelToBuild + 1}
                                                {/if}
                                            </button>
                                        {/if}
                                    {else}
                                        <button class="c-btn c-btn--block" disabled>
                                            <span class="top-corner"></span>
                                            <span class="bottom-corner"></span>
                                            {$LNG.bd_no_more_fields}
                                        </button>
                                    {/if}
                                {/if}
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
            <li class="l-card__footerItem is-active">
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
</section>
<script async type="text/javascript">
    DatatList		= {literal}{{/literal}
    {foreach $BuildInfoList as $ID => $Element}
    {literal}

        "{/literal}{$ID}{literal}":{
        "level":"{/literal}{$Element.level}{literal}",
        "maxLevel":"{/literal}{$Element.maxLevel}{literal}",
        "factor":"{/literal}{$Element.factor}{literal}",
        "costResources":{{/literal}{foreach $Element.costResources as $RessID => $RessAmount}{literal}"{/literal}{$RessID}{literal}":{/literal}{$RessAmount}{literal},{/literal}{/foreach}{literal}},
        "costOverflow":{{/literal}{foreach $Element.costOverflow as $RessID => $RessAmount}{literal}"{/literal}{$RessID}{literal}":{/literal}{$RessAmount}{literal},{/literal}{/foreach}{literal}},
        "elementTime":{/literal}{$Element.elementTime}{literal},
        "destroyResources":{{/literal}{foreach $Element.destroyResources as $RessID => $RessAmount}{literal}"{/literal}{$RessID}{literal}":{/literal}{$RessAmount}{literal},{/literal}{/foreach}{literal}},
        "destroyTime":{/literal}{$Element.destroyTime}{literal},
        "buyable":true },
        {/literal}
        {/foreach}
        {literal}};{/literal}

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