{block name="title" prepend}{$LNG.ti_read} - {$LNG.lm_support}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.ti_header}</h1>
        </div>
        <div class="l-card__content l-card__content--lined">
            <p>
                {if $status != 2}
                    {$LNG.ti_admin_open}
                {elseif $status == 2}
                    {$LNG.ti_admin_close}
                {/if}
            </p>
            <ul class="ul-conversation u-mb-30">
                {foreach $answerList as $answerID => $answerRow}
                    <li class="ul-conversation__item {if $answerRow.ownerID == $userID}is-right{/if}">
                        <div class="ul-conversation__wrapper tooltip" data-tooltip-content="{$answerRow.time}">
                            <h3 class="ul-conversation__heading">{$answerRow.ownerName}</h3>
                            <p class="u-mb-0">{$answerRow.message}</p>
                        </div>
                    </li>
                {/foreach}
            </ul>
            {if $status != 2}
                <form action="game.php?page=ticket&mode=send" method="post" id="form">
                <input type="hidden" name="id" value="{$ticketID}">
                    <textarea 
                        placeholder="{$LNG.ti_mess}" 
                        class="c-inputTextArea u-mb-20" 
                        id="message" 
                        name="message" 
                        row="50" 
                        cols="5">
                    </textarea>
                    <div class="c-btnWrapper">
                        <s-button
                            block
                            link
                            href="game.php?page=ticket"
                        >
                            {$LNG.nt_back}
                        </s-button>
                        <s-button
                            block
                            type="submit"
                        >
                            {$LNG.ti_submit}
                        </s-button>
                    </div>
                </form>
            {else}
                <s-button
                    block
                    link
                    href="game.php?page=ticket"
                >
                    {$LNG.nt_back}
                </s-button>
            {/if}
        </div>
    </div>
</section>
{/block}
{block name="script" append}
<script>
   $(document).ready(function() {
   	$("#form").validationEngine('attach');
   });
</script>
{/block}