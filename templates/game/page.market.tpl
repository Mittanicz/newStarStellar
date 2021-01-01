{block name="title" prepend}{$LNG.lm_market}{/block}
{block name="components" prepend}
    <script src="components/input.js"></script>
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<section class="l-section">
	<div class="l-card">
		<div class="l-card__header">
			<h1>{$LNG.lm_market}</h1>
        </div>
        <div class="l-card__content l-card__content--lined">
            <ul class="c-tab">
                <li class="c-tab__item is-active" data-tab="marketTab">
                    <span>
                        {$LNG.market_lot_active}
                    </span>
                </li>
                <li class="c-tab__item" data-tab="setTab">
                    <span>
                        {$LNG.market_go_lot}
                    </span>
                </li>
                <li class="c-tab__item" data-tab="yourTab">
                    <span>
                        {$LNG.market_you_lot}
                    </span>
                </li>
            </ul>
            <div class="l-card__innerContent" data-tab-content="marketTab" id="marketTab">
                {if !empty($market)}
                    {foreach $market as $row}
                        <div class="markett1">
                            <div class="markett3">{$row.lot}</div>
                            <span class="markett4">{$row.time}</span>
                            <span class="markett10">=</span>
                            <div class="content_box">
                                <a href="?page=market&mode=sell&id={$row.id}"><div class="markett6">{$row.price|number}</div></a>
                            </div>
                        </div>
                    {/foreach}
                    {else}
                        <div class="u-text-center">{$LNG.market_not_lot}</div>
                {/if}
            </div>
            <div class="l-card__innerContent" data-tab-content="setTab" id="setTab" style="display: none;">
                {if !empty($lot)}
                    <table class="c-table c-table--fullWidth u-mb-30">
                        <form action="?page=market&mode=add" method="post">
                            {foreach $lot as $row}
                            <tr>
                                <td>
                                    {$LNG.tech.{$row.id}}
                                </td>
                                <td>
                                    {$row.count|number}
                                </td>
                                <td>
                                    <s-input class="u-mb-0"  name="lot{$row.id}" size="10" value="0"></s-input>
                                </td>
                            </tr>
                            {/foreach}
                            <tr>
                                <td>
                                    {$LNG.market_price} {$LNG.tech.$res}
                                </td>
                                <td>
                                    <div class="c-formRow__wrapper c-select c-select--small">
                                        <select class="changeAction">{html_options  options=$class_name selected=1}</select>
                                    </div>
                                    
                                </td>
                                <td>
                                    <s-input class="u-mb-0" name="price" id="price" size="10" value="0"></s-input>
                                </td>
                            </tr>
                        </table>
                        <s-button type="submit" block >{$LNG.market_proceed}</s-button>
                        </form>	
                    </table>
                {else}
                    <div class="u-text-center">{$LNG.market_not_res}</div>
                {/if}
            </div>
            <div class="l-card__innerContent" data-tab-content="yourTab" id="yourTab" style="display: none;">
                {if !empty($u_lot)}
                    <table class="c-table c-table--fullWidth u-mb-30">
                        {foreach $u_lot as $row}
                            <tr>
                                <td>
                                    {$row.lot}
                                </td>
                                <td>
                                    =
                                </td>
                                <td>
                                    {if $row.time_off > $timestamp}
                                        <div class="u-text-center">-</div>
                                        {else}
                                        <a href="?page=market&mode=cancel_lot&id={$row.id}">{$LNG.market_take}</a>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                    </table>
                    {else}
                        <div class="u-text-center">{$LNG.market_not_lot_active}</div>
                {/if}
            </div>
        </div>
    </div>
</section>
{/block}