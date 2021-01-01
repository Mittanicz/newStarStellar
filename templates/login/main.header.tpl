<!DOCTYPE html>
<head>
    <link rel="manifest" href="./manifest.json">
    <title>{block name="title"} - {$gameName}{/block}</title>	
    <meta name="generator" content="New-Star {$VERSION}">
	<meta name="keywords" content="New-Star {$VERSION}">
	<meta name="description" content="New-Star Browsergame powerd by https://github.com/Yaro2709/New-Star">
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">
    {if !empty($goto)}
	    <meta http-equiv="refresh" content="{$gotoinsec};URL={$goto}">
	{/if}
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="scripts/base/jquery.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="assets/theme/stellar/css/login/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.12/vue.min.js"></script>
    {block name="components"}{/block}
    {block name="styleHeader"}{/block}
    <script>
        {if isset($code)}
            var loginError = {$code|json};
        {/if}
    </script>
	{block name="script"}{/block}	
</head>
<body id="{$smarty.get.page|htmlspecialchars|default:'overview'}" class="{$bodyclass}">
    <div id="app">