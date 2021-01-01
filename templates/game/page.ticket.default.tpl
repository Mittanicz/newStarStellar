{block name="title" prepend}{$LNG.lm_support}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.ti_header}</h1>
        </div>
        <div class="l-card__content">
            {if $ticketList|count != 0}
            <table class="c-table c-table--fullWidth u-mb-30">
                <thead>
                    <th>
                        {$LNG.ti_ticketId}
                    </th>
                    <th>
                        {$LNG.ti_ticketSubject}
                    </th>
                    <th>
                        {$LNG.ti_ticketSubject}
                    </th>
                    <th>
                        {$LNG.ti_ticketStatus}
                    </th>
                </thead>
                <tbody>
                    {foreach $ticketList as $TicketID => $TicketInfo}
                    <tr>
                        <td>
                            #{$TicketID}
                        </td>
                        <td>
                            <a href="game.php?page=ticket&amp;mode=view&amp;id={$TicketID}">
                                {$TicketInfo.subject}
                            </a>
                        </td>
                        <td>
                            {$TicketInfo.time}
                        </td>
                        <td
                            class="
                            {if $TicketInfo.status == 0}
                                u-colorSuccess
                            {elseif $TicketInfo.status == 1}
                                u-colorWarning
                            {elseif $TicketInfo.status == 2}
                                u-colorError
                            {/if}
                            "
                        >
                            {if $TicketInfo.status == 0}
                                {$LNG.ti_status_open}
                            {elseif $TicketInfo.status == 1}
                                {$LNG.ti_status_answer}
                            {elseif $TicketInfo.status == 2}
                                {$LNG.ti_status_closed}
                            {/if}
                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
            {/if}
            <s-button
                block
                link
                href="game.php?page=ticket&amp;mode=create"
            >
                {$LNG.ti_new}
            </s-button>
        </div>
    </div>
</section>
{/block}