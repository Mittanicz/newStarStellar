{block name="title" prepend}{$LNG.nav_index}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<main role="main" class="l-main">
    <section class="l-section">
        <picture class="l-section--bg">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg1x400.jpg" media="(max-width: 400px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg1x800.jpg" media="(max-width: 800px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg1x1280.jpg" media="(max-width: 1280px)">
            <img src="./assets/theme/stellar/img/login/bgs/bg1.jpg" alt="background">
          </picture>         
        <div class="c-hero">
            <header class="c-mainTitle">
                <h1 class="c-hero__title">
                    {$gameName}
                    <div class="c-hero__subTitle">{$LNG.subTitle}</div>
                </h1>
            </header>
            <div class="c-btnWrapper">
                <s-button 
                    link 
                    block
                    href="index.php?page=register" 
                >
                    {$LNG.buttonPlayNow}
                </s-button>
                <s-button block data-sideBar>
                    {$LNG.loginButton}
                </s-button>
            </div>
        </div>
    </section>
    <section class="l-section">
        <picture class="l-section--bg">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg2x400.jpg" media="(max-width: 400px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg2x800.jpg" media="(max-width: 800px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg2x1280.jpg" media="(max-width: 1280px)">
            <img src="./assets/theme/stellar/img/login/bgs/bg2.jpg" alt="background">
          </picture>         
        <div class="c-card">
            <div class="c-card__header">
                <h1>{$LNG.aboutGame}</h1>
            </div>
            <div class="c-card__content">
                <p>{$LNG.aboutGameDesc1}</p>
                <p>
                    {$LNG.aboutGameDesc2}
                </p>
                <p>  
                    {$LNG.aboutGameDesc3}
                </p>
            </div>
        </div>
    </section>
    <section class="l-section l-section--center">
        <picture class="l-section--bg">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg3x400.jpg" media="(max-width: 400px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg3x800.jpg" media="(max-width: 800px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg3x1280.jpg" media="(max-width: 1280px)">
            <img src="./assets/theme/stellar/img/login/bgs/bg3.jpg" alt="background">
          </picture>    
        <div class="c-card c-card--center">
            <div class="c-card__header">
                <h1>{$LNG.gameplayTitle}</h1>
                <span class="c-card__border"></span>
            </div>
            <div class="c-card__content">
                <span class="c-card__contentBorder"></span>
                <p class="u-text-center">{$LNG.gameplaySubTitle}</p>
                <ul class="c-features">
                    <li class="c-features__item is-active" data-toggle-action="toggleExploration">
                        <img class="c-features__icon" src="./assets/theme/stellar/img/login/icons/telescope.svg" width="50" height="50" />
                    </li>
                    <li class="c-features__item" data-toggle-action="toggleExpansion">
                        <img class="c-features__icon" src="./assets/theme/stellar/img/login/icons/expansion.svg" width="50" height="50" />
                    </li>
                    <li class="c-features__item" data-toggle-action="toggleEconomics">
                        <img class="c-features__icon" src="./assets/theme/stellar/img/login/icons/gdp.svg" width="50" height="50" />
                    </li>
                    <li class="c-features__item" data-toggle-action="toggleConquest">
                        <img class="c-features__icon" src="./assets/theme/stellar/img/login/icons/rocket.svg" width="50" height="50" />
                    </li>
                </ul>
                <div class="c-card__innerContent c-features__content">
                    <div class="c-features__contentItem is-show" data-toggle-content="toggleExploration" id="toggleExploration">
                        <h1>{$LNG.gameplayExploration}</h1>
                        <p>
                            {$LNG.gameplayExplorationDesc}
                        </p>
                    </div>
                    <div class="c-features__contentItem" data-toggle-content="toggleExpansion" id="toggleExpansion">
                        <h1>{$LNG.gameplayExpansion}</h1>
                        <p>
                            {$LNG.gameplayExpansionDesc}
                        </p>
                    </div>
                    <div class="c-features__contentItem" data-toggle-content="toggleEconomics" id="toggleEconomics">
                        <h1>{$LNG.gameplayEconomics}</h1>
                        <p>
                            {$LNG.gameplayEconomicsDesc}
                        </p>
                    </div>
                    <div class="c-features__contentItem" data-toggle-content="toggleConquest" id="toggleConquest">
                        <h1>{$LNG.gameplayEconomics}</h1>
                        <p>
                            {$LNG.gameplayConquestDesc}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="l-section">
        <picture class="l-section--bg">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg4x400.jpg" media="(max-width: 400px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg4x800.jpg" media="(max-width: 800px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg4x1280.jpg" media="(max-width: 1280px)">
            <img src="./assets/theme/stellar/img/login/bgs/bg4.jpg" alt="background">
          </picture> 
        <div class="c-card">
            <div class="c-card__header">
                {$LNG.newsAndComunity}
            </div>
            <div class="c-card__content">
                <p>
                    {$LNG.newsAndComunityDesc1}
                </p>
                <p>
                    {$LNG.newsAndComunityDesc2}
                </p>
                <div class="c-btnWrapper">
                    <s-button block>
                        {$LNG.nav_news}
                    </s-button>
                    <s-button block>
                        {$LNG.nav_forum}
                    </s-button>
                </div>
            </div>
        </div>
    </section>
    <section class="l-section">
        <picture class="l-section--bg">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg6x400.jpg" media="(max-width: 400px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg6x800.jpg" media="(max-width: 800px)">
            <source srcset="./assets/theme/stellar/img/login/bgs/bg6x1280.jpg" media="(max-width: 1280px)">
            <img src="./assets/theme/stellar/img/login/bgs/bg6.jpg" alt="background">
          </picture> 
        <div class="c-hero">
            <header class="c-mainTitle">
                <h1 class="c-hero__title">
                    {$LNG.callToAction}
                </h1>
            </header>
                <s-button link block href="index.php?page=register">
                    {$LNG.buttonRegister}
                </s-button>
            </div>
        </div>
    </section>    
</main>
{/block}
{block name="script" append}
<script>{if $code}alert({$code|json});{/if}</script>
{/block}