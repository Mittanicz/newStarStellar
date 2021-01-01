{strip}
<header class="l-header" id="header">
    <div class="l-header__resTop">
        <div class="l-header__resTopOther" id="resourcesTopOther">
            {foreach $resourceTable as $resourceID => $resouceData} 
                {if !isset($resouceData.current)}
                    {if $resourceID != 911}
                        {$resouceData.current = $resouceData.max + $resouceData.used}
                        <div 
                            id="res_block_{$resouceData.name}" 
                            class="c-progress tooltip" 
                            data-tooltip-content="
                                <span class='colore{$resourceID}'>
                                    {$LNG.tech.$resourceID}
                                </span>
                                <div style='border-bottom:1px dashed #666; margin:7px 0 4px 0;'></div>">
                        <div class="c-progress__text">
                                <img src="{$dpath}img/game/resources/{$resourceID}f.png" width="20" height="20" alt="{$resouceData.name}">
                                {shortly_number($resouceData.current)}
                            </div>
                        </div>
                    {/if}
                {/if}
            {/foreach}
        </div>
        <div class="l-header__resTopMain" id="resourcesTopMain">
            {foreach $resourceTable as $resourceID => $resouceData} 
                {if !isset($resouceData.current)}        
                {else}
                    {if !isset($resouceData.current) || !isset($resouceData.max)}
                        <div 
                            id="res_block_{$resouceData.name}" 
                            class="c-progress"
                            data-tooltip-content="<span class='colore{$resourceID}'>{$LNG.tech.$resourceID}</span><div style='border-bottom:1px dashed #666; margin:7px 0 4px 0;'></div>{$LNG.RE} {pretty_number($resouceData.current)}"
                        >
                            <!-- 
                                TODO: Implement this
                                {if isModuleAvailable($smarty.const.MODULE_FAIR)}
                            <a href="game.php?page=fair"><div class="ico_res"></div></a>
                            {else}
                            <div class="ico_res"></div>
                            {/if} -->
                            <span class='colore{$resourceID}' id="current_{$resouceData.name}" name="{$resouceData.current|number}" data-real="{$resouceData.current}">
                                <img src="{$dpath}img/game/resources/{$resourceID}f.png" width="20" height="20" alt="{$resouceData.name}">
                                {shortly_number($resouceData.current)}
                            </span>
                        </div>
                    {/if}
                {/if}
            {/foreach}
            <div class="l-header__resArrow" id="resourcesArrowRight"></div>
        </div>
    </div>
    <div class="l-header__info">
        <div class="l-header__left">
            <a title="{$LNG.lm_overview}" href="game.php?page=overview">
                <img title="{$username}" src="assets/theme/stellar/img/game/avatar_default.jpg" width="30" onclick="return Dialog.Playercard({$userID}, '{$username}');">
            </a>
            <div style="display:none;">					
                <select id="lstPlaneta" name="lstPlaneta" onchange="document.location = $(this).val();">
                    {html_options options=$PlanetSelect selected=$current_pids}
                </select>
            </div>
        </div>
        <div class="l-header__center">
            <div id="planetSelector" class="c-planetSelector">
                <div class="c-planetSelector__before"></div>
                <div class="c-planetSelector__after"></div>
                <div class="c-planetSelector__active">
                    <img src='{$dpath}planeten/planet2d/{$planetImage}.png' width="15" height="15">{$planetName}
                    <span>[{$planetGalaxy}:{$planetSystem}:{$planetPlanet}]</span>
                </div>
                <ul id="list_palnet" class="c-planetSelector__list" style="display: none;">
                    {foreach $PlanetListing as $ID => $Element}        
                        <li class="c-planetSelector__item {if $current_pid == $ID} is-active{/if}">
                            <div>
                                <img id="{$ID}m1" {if $Element.totalAttacks == 0}style="display:none;"{/if} src="{$dpath}img/iconav/p_select_attack.png" alt="" class="tooltip" data-tooltip-content="{$LNG.pla_attack_1}" />                                    
                                <img id="{$ID}m12" style="display:none;" src="{$dpath}img/iconav/p_select_grab.png" alt="" class="tooltip" data-tooltip-content="Планету захватывают" />
                                <img id="{$ID}m6" {if $Element.totalSpio == 0}style="display:none;"{/if} src="{$dpath}img/iconav/p_select_spio.png" alt="" class="tooltip" data-tooltip-content="{$LNG.pla_attack_2}" />
                                <img id="{$ID}m10" {if $Element.totalRockets == 0}style="display:none;"{/if} src="{$dpath}img/iconav/p_select_rocket.png" alt="" class="tooltip" data-tooltip-content="{$LNG.pla_attack_3}" />                 
                                {if $Element.luna !=0}  
                                <img id="{$Element.luna}m1" {if $Element.totalAttackLuna == 0}style="display:none;"{/if} src="{$dpath}img/iconav/p_select_moon_attack.png" alt="" class="tooltip" data-tooltip-content="{$LNG.pla_attack_4}" />
                                <img id="{$Element.luna}m6" {if $Element.totalRocketsLuna == 0}style="display:none;"{/if} src="{$dpath}img/iconav/p_select_moon_spio.png" alt="" class="tooltip" data-tooltip-content="{$LNG.pla_attack_5}" />       
                                <img id="{$Element.luna}m9" style="display:none;" src="{$dpath}img/iconav/p_select_destrued.png" alt="" class="tooltip" data-tooltip-content="{$LNG.pla_attack_6}" />
                                <img id="{$Element.luna}m10" {if $Element.totalSpioLuna == 0}style="display:none;"{/if} src="{$dpath}img/iconav/p_select_moon_rocket.png" alt="" class="tooltip" data-tooltip-content="{$LNG.pla_attack_7}" />                         
                                {/if}                
                            </div>	   
                            <div class="{if $current_pid == $ID}active_urlpalnet{else}urlpalnet{/if}" url="cp={$ID}">
                                <img src='{$dpath}img/game/planeten/planet2d/{$Element.image}.png' width="20" height="20">
                                <span>{$Element.name} [{$Element.galaxy}:{$Element.system}:{$Element.planet}]</span>		
                            </div>
                            {if $Element.luna !=0}                             
                            <div class="{if $current_pid == $Element.luna}active_urlpalnet{else}urlpalnet{/if}" url="cp={$Element.luna}">
                                <span class="moon_select {if $current_pid == $Element.luna}moon_active{/if}"></span>
                            </div>
                            {/if}                
                        </li> 
                    {/foreach}                       
                </ul>
            </div>
        </div>
        <div class="l-header__right"></div>
    </div>
    <div class="l-header__res">
        {foreach $resourceTable as $resourceID => $resouceData} 
            {if !isset($resouceData.current)}
                {if $resourceID == 911}
                    {$resouceData.current = $resouceData.max + $resouceData.used}
                    <div id="res_block_{$resouceData.name}" class="c-progress c-progress--{$resouceData.name} tooltip" data-tooltip-content="<span class='colore{$resourceID}'>{$LNG.tech.$resourceID}</span><div style='border-bottom:1px dashed #666; margin:7px 0 4px 0;'></div>{$LNG.RE} {$resouceData.percent|number}%">
                        <div class="c-progress__text">
                            <img src="{$dpath}img/game/resources/{$resourceID}f.png" width="20" height="20" alt="{$resouceData.name}">
                            {$resouceData.used|shortly_number}
                        </div>
                        <div class="c-progress__barBg">
                            <div class="c-progress__bar">
                                <div class="c-progress__barLeft" style="width:{abs($resouceData.percent/2)}%;{if $resouceData.percent > -0.1}display:none;{/if}"></div>
                                <div class="c-progress__barRight" style="width:{$resouceData.percent/2}%;{if $resouceData.percent < 0.1}display:none;{/if}"></div>
                            </div>
                        </div>                            
                    </div>
                {/if}
            {else}
                {if !isset($resouceData.current) || !isset($resouceData.max)}
                {else}
                    <div 
                        id="res_block_{$resouceData.name}" 
                        class="c-progress tooltip" 
                        data-tooltip-content="
                        <span class='colore{$resourceID}'>{$LNG.tech.$resourceID}</span>
                        <div style='border-bottom:1px dashed #666; margin:7px 0 4px 0;'></div>
                        {$LNG.PPS}: {$resouceData.information}
                        <br/>{$LNG.PPD}: {$resouceData.informationd}
                        <br/>{$LNG.PPW}: {$resouceData.informationz} 
                        <div style='border-bottom:1px dashed #666; margin:7px 0 4px 0;'>
                        </div> 
                        <span style='color:#999'><span id='current_{$resouceData.name}' name='{$resouceData.current|number}' data-real='{$resouceData.current}'>{shortly_number($resouceData.current)}</span>/{$resouceData.max|number}</span>"
                    >
                        <div class="c-progress__text">
                            <span class="u-vhide" id='current_{$resouceData.name}'>{$resouceData.current}</span>
                            <img src="{$dpath}img/game/resources/{$resourceID}f.png" width="20" height="20" alt="{$resouceData.name}">
                            {shortly_number($resouceData.current)}
                        </div>
                        <div class="c-progress__barBg">
                            <div class="c-progress__bar" style="background: linear-gradient(90deg,  #6afadc {$resouceData.percent}%,#fff {$resouceData.percent}%, #fff 100%);">
                            </div>
                        </div>
                        <div class="c-progress__extended">
                            {$resouceData.information}
                        </div>    
                    </div>
                {/if}
            {/if}
        {/foreach}       
    </div>
    <!-- <div id="barrasottoover">
		<div id="top_nav_parte_left">
            {if isModuleAvailable($smarty.const.MODULE_CONTROL)}
			<a title="{$LNG.lm_control}" href="game.php?page=control"><span class="imperia"></span></a>
            <div class="separator_nav"></div>
            {/if}
            {if isModuleAvailable($smarty.const.MODULE_STATISTICS)}
			<a title="{$LNG.lm_statistics}" href="game.php?page=statistics"><span class="stats"></span></a>
			<div class="separator_nav"></div>
            {/if}
            {if isModuleAvailable($smarty.const.MODULE_ACHIEVEMENTS)}
			<a title="{$LNG.lm_achievements}" href="game.php?page=achievements"><span class="achievv"></span></a>
			<div class="separator_nav"></div>
            {/if}
            {if isModuleAvailable($smarty.const.MODULE_BATTLEHALL)}
			<a title="{$LNG.lm_topkb}" href="game.php?page=battleHall"><span class="topbk"></span></a>
			<div class="separator_nav"></div>
            {/if}
            {if isModuleAvailable($smarty.const.MODULE_CHAT)}
			<a title="{$LNG.lm_chat}" href="game.php?page=chat"><span class="chat"></span></a>
            <div class="separator_nav"></div> 
            {/if}
            {if !empty($hasBoard)}
			<a title="{$LNG.lm_forums}" href="game.php?page=board" target="_blank"><span class="forum"></span></a>
			<div class="separator_nav"></div>
            {/if}
            {if isModuleAvailable($smarty.const.MODULE_MESSAGES)}
            <a title="{$LNG.lm_messages}" href="game.php?page=messages" id="a_mesage">
                <span class="mesages"></span>
                {nocache}{if $new_message > 0}<span class="new_email"><span id="newmesnum">{$new_message}</span></span>{/if}{/nocache}
            </a>                                       
            <div class="separator_nav"></div> 
            {/if}
        </div>    
        {if isModuleAvailable($smarty.const.MODULE_STORE)}
        <div class="premiumbarra">
			<img class="premiumimgbarra" src="{$dpath}img/iconav/ico-account-premium.png">
            <a href="game.php?page=store">  
                <span class="premiumtopbar">
                    <span class="premiumscrittabar">{$LNG.lm_store}</span>
                </span>
            </a>
        </div>
        {/if}
	</div> -->
    {if !$vmode}
		<script type="text/javascript">
		var viewShortlyNumber	= {$shortlyNumber|json};
		var vacation			= {$vmode};
        $(function() {
		{foreach $resourceTable as $resourceID => $resourceData}
		{if isset($resourceData.production)}
            resourceTicker({
                available: {$resourceData.current|json},
                limit: [0, {$resourceData.max|json}],
                production: {$resourceData.production|json},
                valueElem: "current_{$resourceData.name}",
                valuePoursent: "bar_{$resourceID}"
            }, true);
		{/if}
		{/foreach}
        });
		</script>
        <script src="scripts/game/topnav.js"></script>
    {/if}
    <script type="text/javascript">
		$(document).ready(function(){
			var flag_planet_menu = false;
			$('#planetSelector').click(function(){ 
				$(this).toggleClass('active');
				$('#list_palnet').stop(false,false).slideToggle(300);
				flag_planet_menu = true;
            });	

            $('#resourcesArrowRight').click(function () {
                $('#resourcesTopOther').toggleClass('is-show');
                $('#resourcesTopMain').toggleClass('is-toggle');
            });
            
			if(flag_planet_menu)
			{					
				document.body.onclick = function (e) {
					e = e || event;
					target = e.target || e.srcElement;
					if (target.id == "planetSelector") {
						return;
					} else {
						$('#list_palnet').hide();
						$('#planetSelector').removeClass('active');
						flag_planet_menu = false;
					}
				}
			}
			$('.urlpalnet').click( function(){
				document.location = '?'+queryString+'&'+$(this).attr("url");
			});		
		});
	</script>
</header>
{if $closed}
<div class="infobox">{$LNG.ov_closed}</div>
{elseif $delete}
<div class="infobox">{$delete}</div>
{elseif $vacation}
<div class="infobox">{$LNG.tn_vacation_mode} {$vacation}</div>
{/if}
{/strip}