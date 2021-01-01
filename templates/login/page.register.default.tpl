{block name="title" prepend}{$LNG.nav_register}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<main role="main" class="l-main container">
    <section class="l-section l-section--center">
        <div class="c-card c-card--center">
            <div class="c-card__header">
                <h1>{$LNG.nav_register}</h1>
                <span class="c-card__border"></span>
            </div>
            <div class="c-card__content">
                <span class="c-card__contentBorder"></span>
                <form id="registerForm" method="post" action="index.php?page=register" data-action="index.php?page=register" novalidate="novalidate">
                    <input type="hidden" value="send" name="mode">
                    <input type="hidden" value="{$externalAuth.account}" name="externalAuth[account]">
                    <input type="hidden" value="{$externalAuth.method}" name="externalAuth[method]">
                    <input type="hidden" value="{$referralData.id}" name="referralID">
                    <div class="c-formRow">
                        <label class="c-label" for="universe">{$LNG.chose_a_uni}</label>
                        <div class="c-formRow__wrapper c-select">
                            <span class="c-input__before"></span>
                            <span class="c-input__after"></span>
                            <select name="uni" id="universe" class="changeAction">{html_options options=$universeSelect selected=$UNI}</select>
                        </div>
                        {if !empty($error.uni)}<span class="error errorUni"></span>{/if}
                    </div>
                    <div class="c-formRow">
                        <label class="c-label" for="username">{$LNG.registerUsername}</label>
                        <div class="c-formRow__wrapper">
                            <span class="c-input__before"></span>
                            <span class="c-input__after"></span>
                            <input type="text" class="c-input" name="username" required id="username" placeholder="{$LNG.registerUsername}">
                            {if !empty($error.username)}<span class="c-validationMSG"></span>{/if}
                        </div>
                        <span class="c-input__text">{$LNG.registerUsernameDesc}</span>
                    </div>
                    <div class="c-formRow">
                        <label class="c-label" for="password">{$LNG.registerPassword}</label>
                        <div class="c-formRow__wrapper">
                            <span class="c-input__before"></span>
                            <span class="c-input__after"></span>						
                            <input type="password" class="c-input" name="password" required id="password" placeholder="{$LNG.registerPassword}">
                            {if !empty($error.password)}<span class="error errorPassword"></span>{/if}
                        </div>
                        <span class="c-input__text"><small>{$LNG.registerPasswordDesc}</small></span>
                    </div>
                    <div class="c-formRow">
                        <label class="c-label" for="passwordReplay">{$LNG.registerPasswordReplay}</label>
                        <div class="c-formRow__wrapper">
                            <span class="c-input__before"></span>
                            <span class="c-input__after"></span>						
                            <input type="password" class="c-input" name="passwordReplay" id="passwordReplay" placeholder="{$LNG.registerPasswordReplay}">
                            {if !empty($error.passwordReplay)}<span class="error errorPasswordReplay"></span>{/if}
                        </div>
                        <span class="c-input__text"><small>{$LNG.registerPasswordReplayDesc}</small></span>
                    </div>
                    <div class="c-formRow">
                        <label class="c-label" for="email">{$LNG.registerEmail}</label>
                        <div class="c-formRow__wrapper">
                            <span class="c-input__before"></span>
                            <span class="c-input__after"></span>
                            <input type="email" class="c-input" name="email" id="email" placeholder="{$LNG.registerEmail}">
                            {if !empty($error.password)}<span class="error errorEmail"></span>{/if}
                        </div>
                        <span class="c-input__text"><small>{$LNG.registerEmailDesc}</small></span>
                    </div>
                    <div class="c-formRow">
                        <label class="c-label" for="emailReplay">{$LNG.registerEmailReplay}</label>
                        <div class="c-formRow__wrapper">
                            <span class="c-input__before"></span>
                            <span class="c-input__after"></span>
                            <input type="email" class="c-input" name="emailReplay" id="emailReplay" placeholder="{$LNG.registerEmailReplay}">
                            {if !empty($error.emailReplay)}<span class="error errorEmailReplay"></span>{/if}
                        </div>
                        <span class="c-input__text"><small>{$LNG.registerEmailReplayDesc}</small></span>
                    </div>
                    {if count($languages) > 1}
                        <div class="c-formRow">
                            <label class="c-label" for="language">{$LNG.language}</label>
                            <div class="c-formRow__wrapper c-select">
                                <span class="c-input__before"></span>
                                <span class="c-input__after"></span>
                                <select name="lang" id="language">{html_options options=$languages selected=$lang}</select>
                        {if !empty($error.language)}<span class="error errorLanguage"></span>{/if}
                        </div>
                    </div>
                    {/if}
                    {if !empty($referralData.name)}
                    <div class="c-formRow">
                        <label class="c-label" for="username">{$LNG.registerReferral}</label>
                        <span class="c-input__text">{$referralData.name}</span>
                    </div>
                    {/if}
                    {if $recaptchaEnable}
                    <div class="rowForm" id="captchaRow">
                        <div>
                            <label class="c-label">{$LNG.registerCaptcha}</label>
                            <!--<span class="c-input__text">{$LNG.registerCaptchaDesc}</span>-->
                            <div class="g-recaptcha" data-sitekey="{$recaptchaPublicKey}"></div>
                        </div>
                    </div>
                    {/if}
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="rules" class="c-checkbox__input" id="rules" value="1" />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$registerRulesDesc}</span>
                        {if !empty($error.rules)}<span class="error errorRules"></span>{/if}
                    </label>
                    <s-button block type="submit">
                        {$LNG.buttonRegister}
                    </s-button>
                </form>
            </div>
        </div>
    </section>
</main>  
{/block}
{block name="script" append}
{if $recaptchaEnable}
<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?hl={$lang}"></script>
{/if}

<script>
$(document).ready(function () {
	$("#registerForm").validate({
        rules: {
            username: {
                required: true,
                minlength: 3,
                maxlength: 25
            },
            password: {
                minlength: 8
            },
            passwordReplay: {
                minlength: 8,
                equalTo : "#password"
            },
            email: {
                required: true,
                email: true
            },
            emailReplay: {
                email: true,
                equalTo : "#email"
            },
            rules: {
                required: true
            },
        },
		messages: {
            username: "{$LNG.registerErrorUsernameEmpty}",
		    password: {
			    minlength: "{$LNG.registerErrorPasswordLength}"
            },
            passwordReplay: {
                minlength: "{$LNG.registerErrorPasswordLength}",
                equalTo: "{$LNG.registerErrorPasswordSame}"
            },
            email: {
                required: "{$LNG.registerErrorMailEmpty}",
                email: "{$LNG.registerErrorMailInvalid}"
            },
            emailReplay: {
                required: "{$LNG.registerErrorMailEmpty}",
                email: "{$LNG.registerErrorMailInvalid}",
                equalTo: "{$LNG.registerErrorMailSame}"
            },
            rules:{
                required: "{$LNG.registerErrorRules}"
            }
		},
		submitHandler: function(form) {
		  form.submit();
		}
	});
})
</script>
{/block}