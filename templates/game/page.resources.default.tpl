{block name="title" prepend}{$LNG.lm_resources}{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$planetName}</h1>
        </div>
        <div class="l-card__content">
            <div class="c-overflow u-mb-30">
                <div class="c-overflow__wrapper">
                <table class="c-table c-table--spacing c-table--responsive">
                    <thead>
                        <tr>
                            <td>
                                {* Empty cell for table*}
                            </td>
                            {foreach $resstype1 as $res => $id_res}
                                <td>
                                    <img src="assets/theme/stellar/img/game/resources/{$id_res}f.png" width="50" alt="">
                                </td>
                            {/foreach}
                            {foreach $resstype2 as $res => $id_res}
                                <td>
                                    <img src="assets/theme/stellar/img/game/resources/{$id_res}f.png" width="50" alt="">
                                </td>
                            {/foreach}
                            <td>
                                <img src="assets/theme/stellar/img/game/resources/procent.png" width="50" alt="">
                            </td>
                        </tr>
                        <tr>
                            <td class="static">{$LNG.rs_basic_income}</td>
                            {foreach $resstype1 as $res => $id_res}
                                <td>{$basicProduction.$id_res|shortly_number}</td>
                            {/foreach}
                            {foreach $resstype2 as $res => $id_res}
                                <td>{$basicProduction.$id_res|shortly_number}</td>
                            {/foreach}
                            <td>
                                {* Empty cell for table*}
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $productionList as $productionID => $productionRow}
                            {if $productionID != 48}
                                {if $productionID != 54}
                                    <tr>
                                        <td class="static">
                                            <a href="#" onclick="return Dialog.info({$productionID})">
                                                <img src="{$dpath}img/game/gebaeude/{$productionID}.gif" width="25">{$LNG.tech.$productionID} 
                                                <span class="tooltip" data-tooltip-content="{if $productionID  > 200}{$LNG.rs_amount}{else}{$LNG.rs_lvl}{/if}">{$productionRow.elementLevel}</span>
                                            </a>
                                        </td>
                                        {foreach $resstype1 as $res => $id_res}
                                            <td class="colore{if $productionRow.production.$id_res > 0}{$id_res}{elseif $productionRow.production.$id_res < 0}red{else}{/if}">
                                                <span class="">{$productionRow.production.$id_res|shortly_number}
                                            </td>	
                                        {/foreach}
                                        {foreach $resstype2 as $res => $id_res}
                                            <td class="colore{if $productionRow.production.$id_res > 0}{$id_res}{elseif $productionRow.production.$id_res < 0}red{else}{/if}">
                                                {$productionRow.production.$id_res|shortly_number}
                                            </td>	
                                        {/foreach}
                                        <td>
                                            <div class="c-formRow__wrapper c-select c-select--small">
                                                <select class="changeAction">{html_options  options=$prodSelector selected=$productionRow.prodLevel}</select>
                                            </div>
                                        </td>
                                    </tr>
                                {/if}
                            {/if}	
                        {/foreach}
                        <tr>
                            <td class="static">{$LNG.rs_ress_bonus}</td>
                            {foreach $resstype1 as $res => $id_res}
                                <td class="colore{if $bonusProduction.$id_res > 0}{$id_res}{elseif $bonusProduction.$id_res < 0}red{else}{/if}">
                                    {$bonusProduction.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            {foreach $resstype2 as $res => $id_res}
                                <td class="colore{if $bonusProduction.$id_res > 0}{$id_res}{elseif $bonusProduction.$id_res < 0}red{else}{/if}">
                                    {$bonusProduction.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            <td class="">
                                -
                            </td>
                        </tr>
                        <tr>
                            <td class="static">{$LNG.rs_storage_capacity}</td>
                            {foreach $resstype1 as $res => $id_res}
                                <td class="colore{if $storage.$id_res > 0}{$id_res}{elseif $storage.$id_res < 0}red{else}{/if}">
                                    {$storage.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            {foreach $resstype2 as $res => $id_res}
                                <td>
                                    -
                                </td>
                            {/foreach}
                            <td>
                                <button class="c-btn c-btn--small">
                                    <span class="top-corner"></span>
                                    <span class="bottom-corner"></span>
                                    <input class="u-vhide" value="{$LNG.rs_calculate}" type="submit">
                                    Calc
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td class="static">{$LNG.rs_sum}</td>
                            {foreach $resstype1 as $res => $id_res}
                                <td class="colore{if $totalProduction.$id_res > 0}{$id_res}{elseif $totalProduction.$id_res < 0}red{else}{/if}">
                                    {$totalProduction.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            {foreach $resstype2 as $res => $id_res}
                            <td class="colore{if $totalProduction.$id_res > 0}{$id_res}{elseif $totalProduction.$id_res < 0}red{else}{/if}">
                                {$totalProduction.$id_res|shortly_number}
                            </td>
                            {/foreach}
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="static">{$LNG.rs_daily}</td>
                            {foreach $resstype1 as $res => $id_res}
                                <td class="colore{if $dailyProduction.$id_res > 0}{$id_res}{elseif $dailyProduction.$id_res < 0}red{else}{/if}">
                                    {$dailyProduction.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            {foreach $resstype2 as $res => $id_res}
                                <td class="colore{if $dailyProduction.$id_res > 0}{$id_res}{elseif $dailyProduction.$id_res < 0}red{else}{/if}">
                                    {$dailyProduction.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="static">{$LNG.rs_weekly}</td>
                            {foreach $resstype1 as $res => $id_res}
                                <td class="colore{if $weeklyProduction.$id_res > 0}{$id_res}{elseif $weeklyProduction.$id_res < 0}red{else}{/if}">
                                    {$weeklyProduction.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            {foreach $resstype2 as $res => $id_res}
                                <td class="colore{if $weeklyProduction.$id_res > 0}{$id_res}{elseif $weeklyProduction.$id_res < 0}red{else}{/if}">
                                    {$weeklyProduction.$id_res|shortly_number}
                                </td>
                            {/foreach}
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            <div class="c-btnWrapper">
                <form action="?page=resources" method="post">
                    <input type="hidden" name="mode" value="AllPlanets">
                    <input type="hidden" name="action" value="off">
                    <button type="submit" class="c-btn">{$LNG.res_disable}</button>
                </form>
                <form action="?page=resources" method="post">
                    <input type="hidden" name="mode" value="AllPlanets">
                    <input type="hidden" name="action" value="on">
                    <button type="submit" class="c-btn u-ml-10">{$LNG.res_activate}</button>
                </form>
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
                <li class="l-card__footerItem is-active">
                    <a class="l-card__footerLink" href="game.php?page=resources">{$LNG.lm_resources}</a>
                </li>
            </ul>
        </footer>        
    </div>
</section>
<div id="page">
	<div id="content">
        <div id="ally_content" class="conteiner" style="width: 100%;">
            <div class="gray_flettab">
                <span>{$header}</span>
            </div>
            <div class="fleettab9" style="margin-bottom:0;"></div>
            <form action="?page=resources" method="post">
                <input type="hidden" name="mode" value="send">
                <div class="rexx1" style="width: 25%;">
                    <img src="{$dpath}img/game/planeten/small/s_{$planetImage}.jpg" class="rexx9">
                    <span class="rexx10">{$planetName}</span>
                        {*<span class="rexx11">[{$planetGalaxy}:{$planetSystem}:{$planetPlanet}]</span>*}
                    <div class="rexx2 rexx3" style="margin-top:70px">{$LNG.rs_basic_income}</div>
                    {foreach $productionList as $productionID => $productionRow}
                        {if $productionID != 48}{if $productionID != 54}
                            <div class="rexx2 rexx3">
                                <a href="#" onclick="return Dialog.info({$productionID})"><img src="{$dpath}img/game/gebaeude/{$productionID}.gif" style="margin-right:3px">{$LNG.tech.$productionID} 
                                    <span class="rexx4 tooltip" data-tooltip-content="{if $productionID  > 200}{$LNG.rs_amount}{else}{$LNG.rs_lvl}{/if}">{$productionRow.elementLevel}</span>
                                </a>
                            </div>
                        {/if}{/if}
                    {/foreach}
                    <div class="rexx2 rexx3">{$LNG.rs_ress_bonus}</div>
                    <div class="rexx2 rexx3" style="margin-top:12px">{$LNG.rs_storage_capacity}</div>
                    <div class="rexx2 rexx3" style="margin-top:12px">{$LNG.rs_sum}</div>
                    <div class="rexx2 rexx3">{$LNG.rs_daily}</div>
                    <div class="rexx2 rexx3">{$LNG.rs_weekly}</div>
                </div>
                {foreach $resstype1 as $res => $id_res}
                    <div class="rexx1 rexx{$id_res}">
                        <span class="rexx8"></span>
                        <div class="rexx2" style="margin-top:70px"><span class="colore{if $basicProduction.$id_res > 0}{$id_res}{elseif $basicProduction.$id_res < 0}red{else}{/if}">{$basicProduction.$id_res|shortly_number}</span></div>
                        {foreach $productionList as $productionID => $productionRow}
                            {if $productionID != 48}{if $productionID != 54}
                                <div class="rexx2 colore{if $productionRow.production.$id_res > 0}{$id_res}{elseif $productionRow.production.$id_res < 0}red{else}{/if}">
                                    {$productionRow.production.$id_res|shortly_number}</span>
                                </div>	
                            {/if}{/if}
                        {/foreach}
                        <div class="rexx2"><span class="colore{if $bonusProduction.$id_res > 0}{$id_res}{elseif $bonusProduction.$id_res < 0}red{else}{/if}">{$bonusProduction.$id_res|shortly_number}</span></div>
                        <div class="rexx2" style="margin-top:12px"><span class="colore{if $storage.$id_res > 0}{$id_res}{elseif $storage.$id_res < 0}red{else}{/if}">{$storage.$id_res|shortly_number}</span></div>
                        <div class="rexx2" style="margin-top:12px"><span class="colore{if $totalProduction.$id_res > 0}{$id_res}{elseif $totalProduction.$id_res < 0}red{else}{/if}">{$totalProduction.$id_res|shortly_number}</span></div>
                        <div class="rexx2"><span class="colore{if $dailyProduction.$id_res > 0}{$id_res}{elseif $dailyProduction.$id_res < 0}red{else}{/if}">{$dailyProduction.$id_res|shortly_number}</span></div>
                        <div class="rexx2"><span class="colore{if $weeklyProduction.$id_res > 0}{$id_res}{elseif $weeklyProduction.$id_res < 0}red{else}{/if}">{$weeklyProduction.$id_res|shortly_number}</span></div>
                    </div>
                {/foreach}
                {foreach $resstype2 as $res => $id_res}
                    <div class="rexx1 rexx{$id_res}">
                        <span class="rexx8"></span>
                        <div class="rexx2" style="margin-top:70px"><span class="colore{if $basicProduction.$id_res > 0}{$id_res}{elseif $basicProduction.$id_res < 0}red{else}{/if}">{$basicProduction.$id_res|shortly_number}</span></div>
                        {foreach $productionList as $productionID => $productionRow}
                            {if $productionID != 48}{if $productionID != 54}
                                <div class="rexx2 colore{if $productionRow.production.$id_res > 0}{$id_res}{elseif $productionRow.production.$id_res < 0}red{else}{/if}">
                                    <span class="">{$productionRow.production.$id_res|shortly_number}</span>
                                </div>	
                            {/if}{/if}
                        {/foreach}
                        <div class="rexx2"><span class="colore{if $bonusProduction.$id_res > 0}{$id_res}{elseif $bonusProduction.$id_res < 0}red{else}{/if}">{$bonusProduction.$id_res|shortly_number}</span></div>
                        <div class="rexx2" style="margin-top:12px">-</div>
                        <div class="rexx2" style="margin-top:12px"><span class="colore{if $totalProduction.$id_res > 0}{$id_res}{elseif $totalProduction.$id_res < 0}red{else}{/if}">{$totalProduction.$id_res|shortly_number}</span></div>
                        <div class="rexx2"><span class="colore{if $dailyProduction.$id_res > 0}{$id_res}{elseif $dailyProduction.$id_res < 0}red{else}{/if}">{$dailyProduction.$id_res|shortly_number}</span></div>
                        <div class="rexx2"><span class="colore{if $weeklyProduction.$id_res > 0}{$id_res}{elseif $weeklyProduction.$id_res < 0}red{else}{/if}">{$weeklyProduction.$id_res|shortly_number}</span></div>
                    </div>
                {/foreach}
                <div class="rexx1 rexxprocent">
                    <div class="rexx6">
                        <select class="rexx5 option"><option value="1" selected="selected" class="rexx5 option option">100%</option></select>
                        {foreach $productionList as $productionID => $productionRow}
                            {if $productionID != 48}{if $productionID != 54}
                                {html_options class="rexx5 option" name="prod[{$productionID}]" options=$prodSelector selected=$productionRow.prodLevel}
                            {/if}{/if}
                        {/foreach}
                    </div>
                    <div class="rexx2"style="margin-top:0px">-</div> 
                    <div class="rexx2" style="margin-top:12px;"><input value="{$LNG.rs_calculate}" type="submit" class="rexx7"></div>
                    <div class="rexx2" style="margin-top:12px;">-</div>
                    <div class="rexx2">-</div>
                    <div class="rexx2">-</div>
                </div>
            </form>
            <div class="alleanza57" style="margin-top: 5px;"></div>
            <div class="fleettab1" style="height: 32px;"> 
                <form action="?page=resources" method="post">
                    <input type="hidden" name="mode" value="AllPlanets">
                    <input type="hidden" name="action" value="off">
                    <button type="submit" class="rexx13">{$LNG.res_disable}</button>
                </form>
                <form action="?page=resources" method="post">
                    <input type="hidden" name="mode" value="AllPlanets">
                    <input type="hidden" name="action" value="on">
                    <button type="submit" class="rexx12">{$LNG.res_activate}</button>
                </form>
            </div>		
        </div>
    </div>
</div>
{/block}