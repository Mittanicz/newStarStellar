{include file="main.header.tpl" bodyclass="full"}
{strip}
{if $hasAdminAccess}
<div class="globalWarning">
{$LNG.admin_access_1} <a id="drop-admin">{$LNG.admin_access_link}</a>{$LNG.admin_access_2}
</div>
{/if}
{include file="main.topnav.tpl"}
<main class="l-main">
    <img class="l-main__planet" src="{$dpath}img/game/planeten/planet2d/{$planetimage}.png" />
    {block name="content"}{/block}
</main>
{foreach $cronjobs as $cronjob}<img src="cronjob.php?cronjobID={$cronjob}" alt="">{/foreach}
    {include file="main.navigation.tpl"}
{include file="main.footer.tpl" nocache}
{/strip}