{block name="title" prepend}{$newsSolo.title}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<main role="main" class="l-main">
    <section class="l-section l-section--center">
        <div class="c-card c-card--center">
            <div class="c-card__header">
                <h1>{$newsSolo.title}</h1>
                <span class="c-card__border"></span>
            </div>
            <div class="c-card__content">
                <span class="c-card__contentBorder"></span>
                <div class="c-card__innerContent">
                    <p>{$newsSolo.text}</p>
                    <div class="c-articleList__footer">
                        {$newsSolo.date}
                    </div>
                </div>
                <s-button block  onclick="goBack()">
                    {$LNG.news_buttonBack}
                </s-button>
            </div>
        </div>
    </section>
</main>
{/block}
{block name="script" append}
<script>
    function goBack() {
        window.history.back();
    }
</script>
{/block}

