{block name="title" prepend}{$LNG.nav_news}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<main role="main" class="l-main container">
    <section class="c-articles">
            {foreach $newsList as $newsRow}
            <div class="c-articleList__article">
                <h1 class="c-articleList__title">{$newsRow.title}</h1>
                <div class="c-card__innerContent c-articleList___content">
                    {$newsRow.text}
                    <div class="c-articleList__footer">
                        {$newsRow.from}
                    </div>
                </div>
                <s-button link block href="../index.php?page=news&id={$newsRow.id}">
                    {$LNG.news_buttonContinue}
                </s-button>
            </div> 
            {/foreach}
    </section>
</main>
{/block}