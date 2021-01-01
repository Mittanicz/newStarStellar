{block name="title" prepend}{$LNG.nav_battlehall}{/block}
{block name="content"}
<main role="main" class="l-main">
    <section class="l-section">
        <div class="c-card c-card--center c-card--alignCenter">
            <header class="c-card__header">
                <h1>{$LNG.nav_battlehall}</h1>
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
                        <th>{$LNG.tkb_platz}</th>
                        <th>{$LNG.tkb_owners}</th>
                        <th>{$LNG.tkb_datum}</th>
                        <th>{$LNG.tkb_units}</th>
                    </tr>
                </thead>
                    <tbody>
                        {foreach $hallList as $hallRow}
                            <tr>
                                <td>{$hallRow@iteration}</td>
                                <td>
                                    {if $hallRow.result == "a"}
                                        <span style="color:#00FF00">{$hallRow.attacker}</span><span style="color:#FFFFFF"><b> VS </b></span><span style="color:#FF0000">{$hallRow.defender}</span>
                                    {elseif $hallRow.result == "r"}
                                        <span style="color:#FF0000">{$hallRow.attacker}</span><span style="color:#FFFFFF"><b> VS </b></span><span style="color:#00FF00">{$hallRow.defender}</span>
                                    {else}
                                        {$hallRow.attacker}<b> VS </b>{$hallRow.defender}
                                    {/if}
                                </td>
                                <td>{$hallRow.time}</td>
                                <td>{$hallRow.units|number}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>    
        </div>
    </section>
</main>
{/block}