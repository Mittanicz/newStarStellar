{block name="title" prepend}{$LNG.nav_banlist}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<main role="main" class="l-main">
    <section class="l-section">
        <div class="c-card c-card--center c-card--alignCenter">
            <header class="c-card__header">
                <h1>{$LNG.nav_banlist}</h1>
                <span class="c-card__border"></span>
            </header>
            <div class="c-card__content">
                <span class="c-card__contentBorder"></span>            
                {if $isMultiUniverse}
                    <p>
                        {html_options options=$universeSelect selected=$UNI class="form-control changeUni" id="universe" name="universe"}
                    </p>
                {/if}
                <table class="c-table">
                    <thead>
                        <tr>
                            <th>{$LNG.bn_from}</th>
                            <th>{$LNG.bn_until}</th>
                            <th>{$LNG.bn_player}</th>
                            <th>{$LNG.bn_by}</th>
                            <th>{$LNG.bn_reason}</th>
                        </tr>
                    </thead>
                    <tbody>
                    {if $banCount}
                    {foreach $banList as $banRow}
                        <tr>
                            <td>{$banRow.from}</td>
                            <td>{$banRow.to}</td>
                            <td>{$banRow.player}</td>
                            <td><a href="mailto:{$banRow.mail}" title="{$banRow.info}">{$banRow.admin}</a></td>
                            <td>{$banRow.theme}</td>
                        </tr>
                    {/foreach}
                        <tr>
                            <td colspan="5">{$LNG.bn_exists}{$banCount|number}{$LNG.bn_players_banned}</td>
                        </tr>
                    {else}
                        <tr>
                            <td colspan="5">{$LNG.bn_no_players_banned}</td>
                        </tr>
                    {/if}
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <div class="u-content-center">
        {if $banCount}
            <div class="c-btnWrapper">
                {if $page != 1}
                    <s-button href="index.php?page=banList&amp;side={$page - 1}" link>
                        Prev
                    </s-button>
                {/if}
                {for $site=1 to $maxPage}
                    {if $site == $page}
                        <s-button onclick="false;"href="#" link>
                            {$site}
                        </s-button>                    
                    {else}
                        <s-button  href="index.php?page=banList&amp;side={$site}" link>
                            {$site}
                        </s-button>                      
                    {/if}
                {/for}
                {if $page != $maxPage}
                    <s-button href="index.php?page=banList&amp;side={$page + 1}" link>
                        Next
                    </s-button>  
                {/if}
            </div>
        {/if}
    </div>
</main>
{/block}