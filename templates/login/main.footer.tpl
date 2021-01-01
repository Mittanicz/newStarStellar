<footer class="u-text-center u-mb-30">
    © 2020 {$gameName} <a href="index.php?page=disclamer">{$LNG.nav_disclamer}</a>
</footer>

<aside class="l-sideBar" id="loginSideBar">
    <div class="l-sideBar__close" data-sideBar>X</div>
    <form id="login" name="login" action="index.php?page=login" data-action="index.php?page=login" method="post">
        <div class="c-formRow">
            <label for="universe" class="c-label">{$LNG.universe}</label>
            <div class="c-formRow__wrapper c-select">
                <span class="c-input__before"></span>
                <span class="c-input__after"></span>
                <select name="uni" id="universe" class="changeAction">{html_options options=$universeSelect selected=$UNI}</select>
            </div>
        </div>
        <div class="c-formRow">
            <label class="c-label" for="username">{$LNG.loginUsername}</label>
            <div class="c-formRow__wrapper">
                <span class="c-input__before"></span>
                <span class="c-input__after"></span>
                <input type="text" class="c-input" name="username" id="username" placeholder="{$LNG.loginUsername}">
            </div>
        </div>
        <div class="c-formRow">
            <label class="c-label" for="password">{$LNG.loginPassword}</label>
            <div class="c-formRow__wrapper">
                <span class="c-input__before"></span>
                <span class="c-input__after"></span>
                <input type="password" class="c-input" name="password" id="password" placeholder="{$LNG.loginPassword}">
            </div>
        </div>
        <button type="submit" class="c-btn c-btn--block u-mb-30">
            <span class="top-corner"></span>
            <span class="bottom-corner"></span>
            {$LNG.loginButton}
        </button>
    </form>
    {if $facebookEnable}
        <a href="#" data-href="index.php?page=externalAuth&method=facebook" class="fb_login">
        <img src="./styles/resource/images/facebook/fb-connect-large.png" alt=""></a>
    {/if}
    <div class="u-mb-20">{$loginInfo}</div>
    <div class="u-text-center">
        <a class="link" href="index.php?page=register">{$LNG.buttonRegister}</a> 
    </div>
    {if $mailEnable} 
        - <a class="link" href="index.php?page=lostPassword">{$LNG.buttonLostPassword}</a>
    {/if}
</aside>
{if $analyticsEnable}
	<script type="text/javascript" src="http://www.google-analytics.com/ga.js"></script>
	<script type="text/javascript">
        try{
            var pageTracker = _gat._getTracker("{$analyticsUID}");
            pageTracker._trackPageview();
        } 
        catch(err) {}
	</script>
{/if}
</div>
</body>

<script type="text/javascript" src="scripts/base/jquery.validate.min.js"></script>
<script src="assets/theme/stellar/js/login/main.js"></script>
<script>
    var LoginConfig = {
        'isMultiUniverse': {$isMultiUniverse|json},
        'unisWildcast': {$unisWildcast|json},
        'referralEnable' : {$referralEnable|json},
        'basePath' : {$basepath|json}
    };

    $(document).ready(function () {
    	$("#login").validate({
        rules: {
            username: {
                required: true,
            },
            password: {
				required: true,
            },
        },
		messages: {
            username: "{$LNG.registerErrorUsernameEmpty}",
		    password: {
			    required: "{$LNG.registerPasswordRequired}"
            },
		},
		submitHandler: function(form) {
		  form.submit();
		}
	});
})
</script>
{block name="afterScript"}{/block}
<script>
    var app = new Vue({
    el: '#app',
    })
</script>
</html>