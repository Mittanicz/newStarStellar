{block name="title" prepend}{$LNG.ti_create_head} - {$LNG.lm_support}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
    <script src="components/input.js"></script>
{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.ti_create_head} - {$LNG.lm_support}</h1>
        </div>
        <div class="l-card__content l-card__content--lined">
            {$LNG.ti_create_info}
            <form action="game.php?page=ticket&mode=send" method="post" id="form">
                <input type="hidden" name="id" value="0">
                <div class="c-formRow">
                    <label class="c-label">{$LNG.ti_category}</label>
                    <div class="c-formRow__wrapper c-select">
                        <span class="c-input__before"></span>
                        <span class="c-input__after"></span>
                        <select class="changeAction">
                            <option>Choose from list</option>
                            <option>{$LNG.ti_category_error}</option>
                            <option>{$LNG.ti_category_bug}</option>
                            <option>{$LNG.ti_category_language}</option>
                        </select>
                    </div>
                </div>
                <s-input
                    label="{$LNG.ti_subject}"
                    type="text"
                    id="subject"
                    name="subject"
                    maxlength="60"
                >
                </s-input>
                <textarea 
                    placeholder="{$LNG.ti_mess}" 
                    class="c-inputTextArea u-mb-20" 
                    id="message" 
                    name="message" 
                    row="60" 
                    cols="7">
                </textarea>
                <div class="c-btnWrapper">
                    <s-button 
                        block 
                        type="submit" 
                        link 
                        href="game.php?page=ticket"
                    >
                        {$LNG.ti_overview}
                    </s-button>
                    <s-button block type="submit">{$LNG.ti_submit}</s-button>
                </div>
            </form>
        </div>
    </div>
</section>
{/block}