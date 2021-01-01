<!DOCTYPE html>
<html lang="{$lang}" class="no-js">
<head>
	<title>{block name="title"} - {$uni_name} - {$game_name}{/block}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	{if !empty($goto)}
    	<meta http-equiv="refresh" content="{$gotoinsec};URL={$goto}">
	{/if}
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="assets/theme/stellar/css/base/jquery.css">
    <script type="text/javascript" src="./scripts/base/jquery.js"></script>
    <script type="text/javascript" src="./scripts/base/jquery.ui.js"></script>
	<script type="text/javascript" src="./scripts/base/jquery.cookie.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/theme/stellar/css/base/jquery.fancybox.css">
    <script type="text/javascript" src="./scripts/base/jquery.fancybox.js"></script>    
    <link rel="stylesheet" type="text/css" href="assets/theme/stellar/css/game/main.css">
    <link rel="stylesheet" type="text/css" href="assets/theme/stellar/css/game/style.css">
    <script type="text/javascript">
        var ServerTimezoneOffset = {$Offset};
        var serverTime 	= new Date({$date.0}, {$date.1 - 1}, {$date.2}, {$date.3}, {$date.4}, {$date.5});
        var startTime	= serverTime.getTime();
        var localTime 	= serverTime;
        var localTS 	= startTime;
        var Gamename	= document.title;
        var Ready		= "{$LNG.ready}";
        var Skin		= "{$dpath}";
        var Lang		= "{$lang}";
        var head_info	= "{$LNG.fcm_info}";
        var auth		= {$authlevel|default:'0'};
        var days 		= {$LNG.week_day|json|default:'[]'} 
        var months 		= {$LNG.months|json|default:'[]'} ;
        var tdformat	= "{$LNG.js_tdformat}";
        var queryString	= "{$queryString|escape:'javascript'}";
        var isPlayerCardActive	= "{$isPlayerCardActive|json}";

        setInterval(function() {
            serverTime.setSeconds(serverTime.getSeconds()+1);
        }, 1000);
	</script>
    <script type="text/javascript" src="./scripts/base/tooltip.js"></script>
	<script type="text/javascript" src="./scripts/game/base.js"></script>
    <script type="text/javascript" src="./scripts/game/game.class.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.12/vue.min.js"></script>
    {block name="components"}{/block}

	{block name="script"}{/block}
	<script type="text/javascript">
	$(function() {
		{$execscript}
	});
	</script>
</head>
<body id="{$smarty.get.page|htmlspecialchars|default:'overview'}" class="l-popup {$bodyclass}">
    <div id="app">