{strip}
{block name="title" prepend}{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_buildings}</h1>
        </div>
        <div class="l-card__content">
            <form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
                <div class="l-grid l-grid--mansory u-mb-30">
                    {foreach $elementList as $ID => $Element}
                        <div class="c-card" data-collapse="#{$ID}" id="s_{$ID}">
                            <div class="c-card__header">
                                {$LNG.tech.{$ID}}
                            </div>
                            <div class="c-card__content">
                                <div>
                                    <img class="c-card__img" src="{$dpath}img/game/gebaeude/{$ID}.gif" alt="{$LNG.tech.{$ID}}" />
                                </div>
                            </div>
                            <div class="c-card__contentInfo" id="{$ID}">
                                <div class="c-card__contentInfo__wrapper">
                                    <div class="c-card__req">
                                        <h4 class="c-card__title">{$LNG.tech.{$ID}}</h4>
                                        <ul class="ul-list {if $Element.techacc} ul-list--inRow {/if}">
                                            {foreach $Element.costResources as $RessID => $RessAmount}
                                                <li class="ul-list__item res{$RessID} tooltip {if $Element.costOverflow[$RessID] == 0}{else}required{/if}">
                                                    <img src="{$dpath}img/resources/{$RessID}f.png" alt="" width="15">
                                                    <span class="text">{$RessAmount|number}</span>
                                                </li>
                                            {/foreach}
                                            <li class="ul-list__item">
                                                {if !$Element.techacc}{else}
                                                {if $Element.elementTime >= 1}
                                                    <img src="{$dpath}img/icons/ui/clock.svg" width="15" alt="" />
                                                    <span class="time_build_edit">{$Element.elementTime|time}</span>
                                                {else}
                                                    <img src="{$dpath}img/icons/ui/clock.svg" width="15" alt="" />
                                                    <span>{round(1 / $Element.elementTime)} {$LNG.sec_conv}</span>
                                                {/if} 
                                            </li>
                                        {/if}
                                        </ul>
                                        <ul class="ul-list ul-list--inRow">
                                            <li class="ul-list__item">
                                                {if !empty($Element.fleetgun)}
                                                    {if $Element.fleetgun == 'notype'}
                                                        <a class="tooltip" data-tooltip-content="
                                                            <table class='reducefleet_table'>
                                                                <tr>
                                                                    <td class='reducefleet_img_ship'><img src='{$dpath}img/information/notype.png'></td>
                                                                    <td class='reducefleet_name_ship'>{$LNG.in_attack_pt} <span class='reducefleet_count_ship'>{$Element.attack|number}</span></td>
                                                                </tr>
                                                            </table>">
                                                            <img height="15" width="15" src="{$dpath}img/information/notype.png">
                                                        </a>
                                                    {else}
                                                        <a class="tooltip" data-tooltip-content="
                                                            <table class='reducefleet_table'>
                                                                {if !empty($Element.fleetgun.laser.attack)}
                                                                <tr>
                                                                    <td class='reducefleet_img_ship'><img src='{$dpath}img/information/laser.jpg'></td>
                                                                    <td class='reducefleet_name_ship'>{$LNG.in_attack_laser} <span class='reducefleet_count_ship'>{$Element.fleetgun.laser.attack|number}</span></td>
                                                                </tr>
                                                                {/if}
                                                                {if !empty($Element.fleetgun.ion.attack)}
                                                                <tr>
                                                                    <td class='reducefleet_img_ship'><img src='{$dpath}img/information/ion.jpg'></td>
                                                                    <td class='reducefleet_name_ship'>{$LNG.in_attack_ionic} <span class='reducefleet_count_ship'>{$Element.fleetgun.ion.attack|number}</span></td>
                                                                </tr>
                                                                {/if}
                                                                {if !empty($Element.fleetgun.plasma.attack)}
                                                                <tr>
                                                                    <td class='reducefleet_img_ship'><img src='{$dpath}img/information/plasma.jpg'></td>
                                                                    <td class='reducefleet_name_ship'>{$LNG.in_attack_buster} <span class='reducefleet_count_ship'>{$Element.fleetgun.plasma.attack|number}</span></td>
                                                                </tr>
                                                                {/if}
                                                                {if !empty($Element.fleetgun.gravity.attack)}
                                                                <tr>
                                                                    <td class='reducefleet_img_ship'><img src='{$dpath}img/information/gravity.jpg'></td>
                                                                    <td class='reducefleet_name_ship'>{$LNG.in_attack_graviton} <span class='reducefleet_count_ship'>{$Element.fleetgun.gravity.attack|number}</span></td>
                                                                </tr>
                                                                {/if}
                                                            </table>">
                                                            <img height="15" width="15" src="{$dpath}img/information/type_at.png">
                                                        </a>
                                                    {/if}
                                                {/if}
                                            </li>
                                            <li class="ul-list__item">
                                                <a class="tooltip" data-tooltip-content="
                                                    <table class='reducefleet_table'>
                                                        <tr>
                                                            <td class='reducefleet_img_ship'><img src='{$dpath}img/information/d_{$Element.info.class_defend}.png'></td>
                                                            <td class='reducefleet_name_ship'>{$LNG["in_armor_{$Element.info.class_defend}"]} <span class='reducefleet_count_ship'>{$Element.defend|number}</span></td>
                                                        </tr>
                                                    </table>">
                                                    <img height="15" width="15" src="{$dpath}img/information/d_{$Element.info.class_defend}.png">
                                                </a>
                                            </li>
                                            {if $Element.info.class_shield != 's_none'}
                                                <li class="ul-list__item">
                                                    <a class="tooltip" data-tooltip-content="
                                                        <table class='reducefleet_table'>
                                                            <tr>
                                                                <td class='reducefleet_img_ship'><img src='{$dpath}img/information/s_{$Element.info.class_shield}.png'></td>
                                                                <td class='reducefleet_name_ship'>{$LNG["in_shield_{$Element.info.class_shield}"]} <span class='reducefleet_count_ship'>{$Element.shield|number}</span></td>
                                                            </tr>
                                                        </table>">
                                                        <img height="15" width="15" src="{$dpath}img/information/s_{$Element.info.class_shield}.png">
                                                    </a>
                                                </li>
                                            {/if}
                                            {if !empty($Element.tech) && !empty($Element.speed1)}
                                                <li class="ul-list__item">
                                                    <a class="tooltip" data-tooltip-content="
                                                        <table class='reducefleet_table'>
                                                            <tr>
                                                                {if $Element.tech == 1 || $Element.tech == 4}
                                                                <td class='reducefleet_img_ship'><img src='{$dpath}img/information/comb.png'></td>
                                                                <td class='reducefleet_name_ship'>{$LNG.tech.115} <span class='reducefleet_count_ship'>{$Element.speed1|number}</span></td>
                                                                {elseif $Element.tech == 2 || $Element.tech == 5}
                                                                <td class='reducefleet_img_ship'><img src='{$dpath}img/information/imp.png'></td>
                                                                <td class='reducefleet_name_ship'>{$LNG.tech.117} <span class='reducefleet_count_ship'>{$Element.speed1|number}</span></td>
                                                                {else}
                                                                <td class='reducefleet_img_ship'><img src='{$dpath}img/information/hyper.png'></td>
                                                                <td class='reducefleet_name_ship'>{$LNG.tech.118} <span class='reducefleet_count_ship'>{$Element.speed1|number}</span></td>
                                                                {/if}
                                                            </tr>
                                                            <tr>
                                                                {if !empty($Element.consumption1)}
                                                                <td class='reducefleet_img_ship'><img src='{$dpath}img/information/consumption.png'></td>
                                                                <td class='reducefleet_name_ship'>{$LNG.in_consumption} <span class='reducefleet_count_ship'>{$Element.consumption1|number}</span></td>
                                                            {/if}
                                                            </tr>
                                                            <tr>
                                                            {if !empty($Element.capacity)}
                                                                <td class='reducefleet_img_ship'><img src='{$dpath}img/information/capacity.png'></td>
                                                                <td class='reducefleet_name_ship'>{$LNG.in_capacity} <span class='reducefleet_count_ship'>{$Element.capacity|number}</span></td>
                                                            {/if}
                                                            </tr>
                                                        </table>">
                                                        {if $Element.tech == 1 || $Element.tech == 4}
                                                            <img height="15" width="15" src="{$dpath}img/information/comb.png">
                                                        {elseif $Element.tech == 2 || $Element.tech == 5}
                                                            <img height="15" width="15" src="{$dpath}img/information/imp.png">
                                                        {else}
                                                            <img height="15" width="15" src="{$dpath}img/information/hyper.png">
                                                        {/if}
                                                    </a>
                                                </li>
                                            {/if}
                                            {if $ID == in_array($ID, $reslist.defense)}
                                                <li cclass="ul-list__item">
                                                    <a class="tooltip" data-tooltip-content="
                                                        <table class='reducefleet_table'>
                                                            <tr>
                                                                <td class='reducefleet_img_ship'><img src='{$dpath}img/information/recovery.png'></td>
                                                                <td class='reducefleet_name_ship'>{$LNG.in_recovery}</td>
                                                            </tr>
                                                        </table>">
                                                        <img height="15" width="15" src="{$dpath}img/information/recovery.png">
                                                    </a>
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
                                                        <a href="#" onclick="return Dialog.info({$requireID})" class="c-requirerment tooltip" data-tooltip-content="<span style='color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};'>{$LNG.tech.$requireID} {$LNG.tt_lvl}  {$NeedLevel.count} ({$NeedLevel.own}/{$NeedLevel.count})</span>">
                                                            <img src="{$dpath}img/game/gebaeude/{$requireID}.gif" width="40" alt="{$LNG.tech.$requireID}" />
                                                            <span class="c-requirerment__text" style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">
                                                                {$NeedLevel.own}/{$NeedLevel.count}
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <div class="required_block required_smal_text">
                                                    </div>
                                                    {/foreach}
                                                {/foreach}
                                            </ul>
                                        </div>
                                    {/if}
                                </div>
                                <div class="c-card__footer">
                                    {if $NotBuilding && $Element.buyable && $Element.techacc && $Element.maxBuildable} 
                                        <div id="res_{$ID}">
                                            <div class="c-rangeSlider">
                                                <input class="c-rangeSlider__slider" oninput="counting('{$ID}');" name="fmenge[{$ID}]" id="input_{$ID}" type="range" min="0" step="1" max="{$Element.maxBuildable}" tabindex="{$smarty.foreach.FleetList.iteration}" data-cip-id="input_210">
                                                <output class="c-rangeSlider__bubble"></output>
                                            </div>
                                            <button class="c-btn c-btn--block" type="submit">
                                                <span class="top-corner"></span>
                                                <span class="bottom-corner"></span>
                                                {{$LNG.bd_build_ships}}
                                            </button>
                                        </div>
                                    {elseif !$Element.techacc}{else}
                                        <button class="c-btn c-btn--block" disabled>
                                            <span class="top-corner"></span>
                                            <span class="bottom-corner"></span>
                                            {$LNG.bd_notres}
                                        </button>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </form>
            <div class="l-card__sideBar">
                <aside class="l-queueBox u-mb-30" id="buildQueue">
                    <h4 class="l-queueBox__title">Build queue</h4>
                    <div id="buildProgressMobile">
                        <h4>Build queue</h4>
                        <img src="./assets/theme/stellar/img/icons/nav/hangar.svg" width="25" height="25" alt="Hangar">
                    </div>
                    <div class="l-queueBox__content" style="display: none;" id="buildContent">
                        <div class="u-mb-10">Build time total: <span id="timeleft"></span></div>
                        <div id="bx" class="z"></div>
                        <form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
                            <input type="hidden" name="action" value="delete">
                            <select class="l-queueBox__select u-mb-30" name="auftr[]" id="auftr" size="10" multiple>
                                <option>&nbsp;</option>
                            </select>
                            <button class="c-btn c-btn--block u-mb-30">
                                <span class="top-corner"></span>
                                <span class="bottom-corner"></span>
                                {$LNG.bd_cancel_send}
                            </button>
                            <input type="hidden" class="btn_del" value="{$LNG.bd_cancel_send}">
                            <div class="u-text-center u-mb-30">
                                <small >{$LNG.bd_cancel_warning}</small>
                            </div>
                        </form>
                    </div>
                </aside>
                <aside class="l-cardBox" id="buildInfoDesktop">
                    <div class="c-card__contentInfo c-card__contentInfo--desktop">
                        <h4 class="l-queueBox__title">Build ship</h4>
                        {foreach $elementList as $ID => $Element}
                        <div class="c-card__contentInfo__wrapper" id="{$ID}Desktop" style="display: none;">
                            <div class="c-card__req">
                                <h4 class="c-card__title">{$LNG.tech.{$ID}}</h4>
                                <ul class="ul-list {if $Element.techacc} ul-list--inRow {/if}">
                                    {foreach $Element.costResources as $RessID => $RessAmount}
                                        <li class="ul-list__item res{$RessID} tooltip {if $Element.costOverflow[$RessID] == 0}{else}required{/if}">
                                            <img src="{$dpath}img/resources/{$RessID}f.png" alt="" width="15">
                                            <span class="text">{$RessAmount|number}</span>
                                        </li>
                                    {/foreach}
                                    <li class="ul-list__item">
                                        {if !$Element.techacc}{else}
                                        {if $Element.elementTime >= 1}
                                            <img src="{$dpath}img/icons/ui/clock.svg" width="15" alt="" />
                                            <span class="time_build_edit">{$Element.elementTime|time}</span>
                                        {else}
                                            <img src="{$dpath}img/icons/ui/clock.svg" width="15" alt="" />
                                            <span>{round(1 / $Element.elementTime)} {$LNG.sec_conv}</span>
                                        {/if} 
                                    </li>
                                {/if}
                                </ul>
                                <ul class="ul-list ul-list--inRow">
                                    <li class="ul-list__item">
                                        {if !empty($Element.fleetgun)}
                                            {if $Element.fleetgun == 'notype'}
                                                <a class="tooltip" data-tooltip-content="
                                                    <table class='reducefleet_table'>
                                                        <tr>
                                                            <td class='reducefleet_img_ship'><img src='{$dpath}img/information/notype.png'></td>
                                                            <td class='reducefleet_name_ship'>{$LNG.in_attack_pt} <span class='reducefleet_count_ship'>{$Element.attack|number}</span></td>
                                                        </tr>
                                                    </table>">
                                                    <img height="15" width="15" src="{$dpath}img/information/notype.png">
                                                </a>
                                            {else}
                                                <a class="tooltip" data-tooltip-content="
                                                    <table class='reducefleet_table'>
                                                        {if !empty($Element.fleetgun.laser.attack)}
                                                        <tr>
                                                            <td class='reducefleet_img_ship'><img src='{$dpath}img/information/laser.jpg'></td>
                                                            <td class='reducefleet_name_ship'>{$LNG.in_attack_laser} <span class='reducefleet_count_ship'>{$Element.fleetgun.laser.attack|number}</span></td>
                                                        </tr>
                                                        {/if}
                                                        {if !empty($Element.fleetgun.ion.attack)}
                                                        <tr>
                                                            <td class='reducefleet_img_ship'><img src='{$dpath}img/information/ion.jpg'></td>
                                                            <td class='reducefleet_name_ship'>{$LNG.in_attack_ionic} <span class='reducefleet_count_ship'>{$Element.fleetgun.ion.attack|number}</span></td>
                                                        </tr>
                                                        {/if}
                                                        {if !empty($Element.fleetgun.plasma.attack)}
                                                        <tr>
                                                            <td class='reducefleet_img_ship'><img src='{$dpath}img/information/plasma.jpg'></td>
                                                            <td class='reducefleet_name_ship'>{$LNG.in_attack_buster} <span class='reducefleet_count_ship'>{$Element.fleetgun.plasma.attack|number}</span></td>
                                                        </tr>
                                                        {/if}
                                                        {if !empty($Element.fleetgun.gravity.attack)}
                                                        <tr>
                                                            <td class='reducefleet_img_ship'><img src='{$dpath}img/information/gravity.jpg'></td>
                                                            <td class='reducefleet_name_ship'>{$LNG.in_attack_graviton} <span class='reducefleet_count_ship'>{$Element.fleetgun.gravity.attack|number}</span></td>
                                                        </tr>
                                                        {/if}
                                                    </table>">
                                                    <img height="15" width="15" src="{$dpath}img/information/type_at.png">
                                                </a>
                                            {/if}
                                        {/if}
                                    </li>
                                    <li class="ul-list__item">
                                        <a class="tooltip" data-tooltip-content="
                                            <table class='reducefleet_table'>
                                                <tr>
                                                    <td class='reducefleet_img_ship'><img src='{$dpath}img/information/d_{$Element.info.class_defend}.png'></td>
                                                    <td class='reducefleet_name_ship'>{$LNG["in_armor_{$Element.info.class_defend}"]} <span class='reducefleet_count_ship'>{$Element.defend|number}</span></td>
                                                </tr>
                                            </table>">
                                            <img height="15" width="15" src="{$dpath}img/information/d_{$Element.info.class_defend}.png">
                                        </a>
                                    </li>
                                    {if $Element.info.class_shield != 's_none'}
                                        <li class="ul-list__item">
                                            <a class="tooltip" data-tooltip-content="
                                                <table class='reducefleet_table'>
                                                    <tr>
                                                        <td class='reducefleet_img_ship'><img src='{$dpath}img/information/s_{$Element.info.class_shield}.png'></td>
                                                        <td class='reducefleet_name_ship'>{$LNG["in_shield_{$Element.info.class_shield}"]} <span class='reducefleet_count_ship'>{$Element.shield|number}</span></td>
                                                    </tr>
                                                </table>">
                                                <img height="15" width="15" src="{$dpath}img/information/s_{$Element.info.class_shield}.png">
                                            </a>
                                        </li>
                                    {/if}
                                    {if !empty($Element.tech) && !empty($Element.speed1)}
                                        <li class="ul-list__item">
                                            <a class="tooltip" data-tooltip-content="
                                                <table class='reducefleet_table'>
                                                    <tr>
                                                        {if $Element.tech == 1 || $Element.tech == 4}
                                                        <td class='reducefleet_img_ship'><img src='{$dpath}img/information/comb.png'></td>
                                                        <td class='reducefleet_name_ship'>{$LNG.tech.115} <span class='reducefleet_count_ship'>{$Element.speed1|number}</span></td>
                                                        {elseif $Element.tech == 2 || $Element.tech == 5}
                                                        <td class='reducefleet_img_ship'><img src='{$dpath}img/information/imp.png'></td>
                                                        <td class='reducefleet_name_ship'>{$LNG.tech.117} <span class='reducefleet_count_ship'>{$Element.speed1|number}</span></td>
                                                        {else}
                                                        <td class='reducefleet_img_ship'><img src='{$dpath}img/information/hyper.png'></td>
                                                        <td class='reducefleet_name_ship'>{$LNG.tech.118} <span class='reducefleet_count_ship'>{$Element.speed1|number}</span></td>
                                                        {/if}
                                                    </tr>
                                                    <tr>
                                                        {if !empty($Element.consumption1)}
                                                        <td class='reducefleet_img_ship'><img src='{$dpath}img/information/consumption.png'></td>
                                                        <td class='reducefleet_name_ship'>{$LNG.in_consumption} <span class='reducefleet_count_ship'>{$Element.consumption1|number}</span></td>
                                                    {/if}
                                                    </tr>
                                                    <tr>
                                                    {if !empty($Element.capacity)}
                                                        <td class='reducefleet_img_ship'><img src='{$dpath}img/information/capacity.png'></td>
                                                        <td class='reducefleet_name_ship'>{$LNG.in_capacity} <span class='reducefleet_count_ship'>{$Element.capacity|number}</span></td>
                                                    {/if}
                                                    </tr>
                                                </table>">
                                                {if $Element.tech == 1 || $Element.tech == 4}
                                                    <img height="15" width="15" src="{$dpath}img/information/comb.png">
                                                {elseif $Element.tech == 2 || $Element.tech == 5}
                                                    <img height="15" width="15" src="{$dpath}img/information/imp.png">
                                                {else}
                                                    <img height="15" width="15" src="{$dpath}img/information/hyper.png">
                                                {/if}
                                            </a>
                                        </li>
                                    {/if}
                                    {if $ID == in_array($ID, $reslist.defense)}
                                        <li cclass="ul-list__item">
                                            <a class="tooltip" data-tooltip-content="
                                                <table class='reducefleet_table'>
                                                    <tr>
                                                        <td class='reducefleet_img_ship'><img src='{$dpath}img/information/recovery.png'></td>
                                                        <td class='reducefleet_name_ship'>{$LNG.in_recovery}</td>
                                                    </tr>
                                                </table>">
                                                <img height="15" width="15" src="{$dpath}img/information/recovery.png">
                                            </a>
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
                                                <a href="#" onclick="return Dialog.info({$requireID})" class="c-requirerment tooltip" data-tooltip-content="<span style='color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};'>{$LNG.tech.$requireID} {$LNG.tt_lvl}  {$NeedLevel.count} ({$NeedLevel.own}/{$NeedLevel.count})</span>">
                                                    <img src="{$dpath}img/game/gebaeude/{$requireID}.gif" width="40" alt="{$LNG.tech.$requireID}" />
                                                    <span class="c-requirerment__text" style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">
                                                        {$NeedLevel.own}/{$NeedLevel.count}
                                                    </span>
                                                </a>
                                            </li>
                                            <div class="required_block required_smal_text">
                                            </div>
                                            {/foreach}
                                        {/foreach}
                                    </ul>
                                </div>
                            {/if}
                            <div class="c-card__footer">
                                {if $NotBuilding && $Element.buyable && $Element.techacc && $Element.maxBuildable} 
                                    <div id="res_{$ID}">
                                        <div class="c-rangeSlider">
                                            <input class="c-rangeSlider__slider" oninput="counting('{$ID}');" name="fmenge[{$ID}]" id="input_{$ID}" type="range" min="0" step="1" max="{$Element.maxBuildable}" tabindex="{$smarty.foreach.FleetList.iteration}" data-cip-id="input_210">
                                            <output class="c-rangeSlider__bubble"></output>
                                        </div>
                                        <button class="c-btn c-btn--block" type="submit">
                                            <span class="top-corner"></span>
                                            <span class="bottom-corner"></span>
                                            {{$LNG.bd_build_ships}}
                                        </button>
                                    </div>
                                {elseif !$Element.techacc}{else}
                                    <button class="c-btn c-btn--block" disabled>
                                        <span class="top-corner"></span>
                                        <span class="bottom-corner"></span>
                                        {$LNG.bd_notres}
                                    </button>
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
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=buildings">{$LNG.lm_buildings}</a>
                </li>
                <li class="l-card__footerItem">
                    <a class="l-card__footerLink" href="game.php?page=research">{$LNG.lm_research}</a>
                </li>
                <li class="l-card__footerItem {if $mode != "defense"}is-active{/if}">
                    <a class="l-card__footerLink" href="game.php?page=shipyard&amp;mode=fleet">{$LNG.lm_shipshard}</a>
                </li>
                <li class="l-card__footerItem {if $mode == "defense"}is-active{/if}">
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
    data			= {$BuildList|json};
    bd_operating	= '{$LNG.bd_operating}';
    bd_available	= '{$LNG.bd_available}';

	DatatList		= {literal}{{/literal}
	{foreach $elementList as $ID => $Element}
	{literal}
	"{/literal}{$ID}{literal}":{"id":"{/literal}{$ID}{literal}","available":"{/literal}{$Element.available|number}{literal}","costResources":{{/literal}{foreach $Element.costResources as $RessID => $RessAmount}{literal}"{/literal}{$RessID}{literal}":{/literal}{$RessAmount}{literal},{/literal}{/foreach}{literal}},"elementTime":{/literal}{$Element.elementTime}{literal},"buyable":true,"maxBuildable":"{/literal}{$Element.maxBuildable}{literal}","AlreadyBuild":false,"AlreadyBuildOne":false},
	{/literal}
	{/foreach}

	{literal}};{/literal}
	
	MaxCount		= '{$max}';
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
    {if !empty($BuildList)}
    <script src="scripts/base/bcmath.js"></script>
    <script type="text/javascript">
    $(function() {
        ShipyardInit();
    });
    </script>
    {/if}
</div>
{/block}
{/strip}