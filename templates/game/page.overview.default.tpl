{block name="title" prepend}{$LNG.lm_overview}{/block}
{block name="script" append}{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$planetname}</h1>
        </div>
        <div class="l-card__content l-card__content--planetView">
            <div class="l-card__innerContent l-card__innerContent--noPadd planetImg">
                {if isModuleAvailable($smarty.const.MODULE_CREATE_MOON)}
                    {if $planet_type == 1}	
                        {if $Moon}
                            <a class="c-planetImg__moon" href="game.php?page=overview&amp;cp={$Moon.id}&amp;re=0">
                                <span class="c-planetImg__moonText">{$Moon.name}</span>
                                <img src="{$dpath}img/game/content/moon.png" class="tooltip" data-tooltip-content="{$Moon.name}">
                            </a>
                        {else}
                            <a class="c-planetImg__moon" href="game.php?page=createMoon">
                                <span class="c-planetImg__moonText">{$LNG.ov_create_moon}</span>
                                <img src="{$dpath}img/game/content/moon.png" class="tooltip" data-tooltip-content="{$LNG.ov_create_moon}">
                            </a>
                        {/if}
                    {/if}
                {/if}                 
                <img src="{$dpath}img/game/planeten/{$planetimage}.jpg" alt="">
            </div>
            <div class="l-card__innerContent planetActivity">
                <h2 class="u-mb-20">Planet activity</h2>
                <ul class="ul-list">
                    <li class="ul-list__item ul-list__item--highLight">
                        {if $buildInfo.tech}
                            <div class="u-mb-10">
                                <img src="{$dpath}img/game/gebaeude/{$ID}.gif" alt="{$LNG.tech[$buildInfo.buildings['id']]}" width="30" />
                                {$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})
                            </div>
                            <span id="queeTimer" data-time="{$buildInfo.buildings['timeleft']}">
                                {$buildInfo.buildings['starttime']}
                            </span>
                        {else}
                            <a href="game.php?page=research">
                                <img src="{$dpath}img/icons/ui/wrench.svg" width="20" alt="">
                                No active researchs
                            </a>
                        {/if}
                    </li>
                    <li class="ul-list__item ul-list__item--highLight">
                        {if $buildInfo.buildings}
                            <div class="u-mb-10">
                                <img src="{$dpath}gebaeude/{$ID}.gif" alt="{$LNG.tech[$buildInfo.buildings['id']]}" width="30" />
                                {$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})
                            </div>
                            <span id="queeTimer" data-time="{$buildInfo.buildings['timeleft']}">
                                {$buildInfo.buildings['starttime']}
                            </span>
                        {else}
                            <a href="game.php?page=buildings">
                                <img src="{$dpath}img/icons/ui/wrench.svg" width="20" alt="">
                                No active building
                            </a>
                        {/if}
                    </li>
                    <li class="ul-list__item ul-list__item--highLight">
                        {if $buildInfo.fleet}
                            <div class="u-mb-10">
                                <img src="{$dpath}gebaeude/{$ID}.gif" alt="{$LNG.tech[$buildInfo.buildings['id']]}" width="30" />
                                {$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})
                            </div>
                            <span id="queeTimer" data-time="{$buildInfo.buildings['timeleft']}">
                                {$buildInfo.buildings['starttime']}
                            </span>
                        {else}
                            <a href="game.php?page=shipyard">
                                <img src="{$dpath}img/icons/ui/wrench.svg" width="20" alt="">
                                No fleet or defense constrution active
                            </a>
                        {/if}
                    </li>
                </ul>
            </div>
            <div class="l-card__innerContent l-card__innerContent--info planetInfo">
                <h2 class="u-mb-20">Planet info</h2>
                <ul class="ul-list">
                    <li class="ul-list__item">
                        {$LNG.ov_diameter} {$planet_diameter} {$LNG.ov_distance_unit} 
                        (<span title="{$LNG.ov_developed_fields}">{$planet_field_current}</span> / <span title="{$LNG.ov_max_developed_fields}">{$planet_field_max}</span> 
                        {$LNG.ov_fields})
                    </li>        
                    <li class="ul-list__item">
                        {$LNG.ov_temperature} {$LNG.ov_aprox} {$planet_temp_min}{$LNG.ov_temp_unit} {$LNG.ov_to} {$planet_temp_max}{$LNG.ov_temp_unit}
                    </li>        
                    <li class="ul-list__item">
                        {$LNG.ov_position} <a href="game.php?page=galaxy&amp;galaxy={$galaxy}&amp;system={$system}">[{$galaxy}:{$system}:{$planet}]</a>
                    </li>        
                    <li class="ul-list__item">
                        {$LNG.ov_points} {$rankInfo}
                    </li>
                </ul>      
            </div>
            <div class="l-card__innerContent l-card__innerContent--info planetControl">
                <h2 class="u-mb-20">{$LNG.ov_panel_root}</h2>
                <ul class="ul-listRow">
                    {if isModuleAvailable($smarty.const.MODULE_RACE)}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=race">
                                <img src="{$dpath}img/icons/nav/{$race}.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.tech.$race}" />
                            </a>
                        </li>
                    {/if}     
                    {if isModuleAvailable($smarty.const.MODULE_FORMGOVERNMENT)}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=formgovernment">
                                <img src="{$dpath}img/icons/nav/{$formgovernment}.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.tech.$formgovernment}" />
                            </a>
                        </li>
                    {/if}     
                    {if isModuleAvailable($smarty.const.MODULE_ETHICS)}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=ethics">
                                <img src="{$dpath}img/icons/nav/{$ethics}.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.tech.$ethics}" />
                            </a>
                        </li>
                    {/if}     
                    {if isModuleAvailable($smarty.const.MODULE_INFO_BONUS)}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=infobonus">
                                <img src="{$dpath}img/icons/nav/bonus.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.lm_infobonus}" />
                            </a>
                        </li>
                    {/if}     
                    {if isModuleAvailable($smarty.const.MODULE_PARTY)}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=party">
                                <img src="{$dpath}img/icons/nav/party.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.lm_party}" />
                            </a>
                        </li>
                    {/if}     
                    {if isModuleAvailable($smarty.const.MODULE_IDEOLOGIES)}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=ideologies">
                                <img src="{$dpath}img/icons/nav/ideologies.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.lm_ideologies}" />
                            </a>
                        </li>
                    {/if}     
                    {if isModuleAvailable($smarty.const.MODULE_OFFICIER)}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=officier">
                                <img src="{$dpath}img/icons/nav/officier.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.lm_officiers}" />
                            </a>
                        </li>
                        {/if}
                        <li class="ul-listRow__item">
                            <a href="game.php?page=market">
                                <img src="{$dpath}img/icons/nav/officier.svg" class="tooltip" width="20"  data-tooltip-content="{$LNG.lm_market}" />
                            </a>
                        </li>
                </ul>     
                <!-- {if $is_news}
                    <div class="overvieew7">
                        <div class="title">{$LNG.ov_news}</div>
                        <div id="news_ower">{$news}</div>
                    </div> 
                {/if} -->
            </div>
        </div>
        <footer class="l-card__footer">
            <ul class="l-card__footerNav">
                <li class="l-card__footerItem is-active">
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
{block name="script" append}
    <script src="scripts/game/overview.js"></script>
    <script src="scripts/game/buildlist.js"></script>
{/block}