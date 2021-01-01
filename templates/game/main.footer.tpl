{strip}
<footer id="footer" class="l-footer">
    <nav class="ul-nav">
        <ul class="ul-navList">
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=research" id="munu_research">
                    <img src="{$dpath}img/icons/nav/research.svg" width="25" height="25" alt="{$LNG.lm_research}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=buildings" id="munu_build">
                    <img src="{$dpath}img/icons/nav/buildings.svg" width="25" height="25" alt="{$LNG.lm_buildings}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=shipyard&amp;mode=fleet" id="munu_shipyard_fleet">
                    <img src="{$dpath}img/icons/nav/hangar.svg" width="25" height="25" alt="{$LNG.lm_shipshard}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=shipyard&amp;mode=defense" id="munu_shipyard_defense">
                    <img src="{$dpath}img/icons/nav/defense.svg" width="25" height="25" alt="{$LNG.lm_defenses}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=overview" id="munu_shipyard_defense">
                    <img src="{$dpath}img/icons/nav/defense.svg" width="25" height="25" alt="{$LNG.lm_overview}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=resources" id="munu_shipyard_defense">
                    <img src="{$dpath}img/icons/nav/defense.svg" width="25" height="25" alt="{$LNG.lm_resources}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=fleetTable" id="munu_orbita">
                    <img src="{$dpath}img/icons/nav/fleet.svg" width="25" height="25" alt="{$LNG.lm_fleet}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=fleetTable" id="munu_orbita">
                    <img src="{$dpath}img/icons/nav/aliance.svg" width="25" height="25" alt="{$LNG.lm_alliance}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=settings" id="munu_orbita">
                    <img src="{$dpath}img/icons/nav/settings.svg" width="25" height="25" alt="{$LNG.lm_options}">
                </a>
            </li>
            <li class="ul-navList__item">
                <a class="ul-navList__link" href="game.php?page=settings" id="munu_orbita">
                    <img src="{$dpath}img/icons/nav/settings.svg" width="25" height="25" alt="{$LNG.lm_options}">
                </a>
            </li>
        </ul>
    </nav>
</footer>
</div>
{if $ga_active}
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '{$ga_key}']);
        _gaq.push(['_trackPageview']);

        (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
{/if}
{if $debug == 1}
    <script type="text/javascript">
        onerror = handleErr;
    </script>
{/if}
<script>
    var app = new Vue({
    el: '#app',
    })
</script>
</body>
</html>
{/strip}