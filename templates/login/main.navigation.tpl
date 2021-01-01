<header class="l-header">
    <div class="l-header__button" id="navButton">
        <span class="line"></span>
        <span class="line line--big"></span>
        <span class="line"></span>
    </div>
    <nav class="ul-nav" id="navList">
        <ul class="ul-nav__list">
            <li class="ul-nav__item">
                <a href="index.php" class="ul-nav__link">{$LNG.nav_index}</a>
            </li>
            <li class="ul-nav__item">
                <a class="ul-nav__link" href="index.php?page=news">{$LNG.nav_news}</a>
            </li>
            <li class="ul-nav__item">
                <a href="index.php?page=board" class="ul-nav__link">{$LNG.nav_forum}</a>
            </li>
            <li class="ul-nav__item">
                <a class="ul-nav__link" href="index.php?page=battleHall">{$LNG.nav_battlehall}</a>
            </li>
            <li class="ul-nav__item">
                <a class="ul-nav__link" href="index.php?page=screens">{$LNG.nav_screens}</a>
            </li>
            <li class="ul-nav__item">
                <a class="ul-nav__link" href="index.php?page=banList">{$LNG.nav_banlist}</a>
            </li>
            <li class="ul-nav__item">
                <a class="ul-nav__link" href="index.php?page=rules">{$LNG.nav_rules}</a>
            </li>
            <li class="ul-nav__item">
                <a class="ul-nav__link" data-sideBar>{$LNG.loginButton}</a>
            </li>
            {if count($languages) > 1}
                <li class="ul-nav__item c-dropdown">
                    <a class="ul-nav__link" href="#">{$LNG.language}</a>
                    <div class="c-dropdown__content c-dropdown__content--header">
                    {foreach $languages as $langKey => $langName}
                        <a class="ul-nav__link" href="?lang={$langKey}" rel="alternate" hreflang="{$langKey}" title="{$langName}">{$langName}</a>
                    {/foreach}
                    </div>
                </li>
            {/if}
        </ul>
    </nav>
    <a href="index.php" class="l-header__logo">{$gameName}</a>
    <a class="l-header__link" href="#" data-sideBar>{$LNG.loginButton}</a>
</header>