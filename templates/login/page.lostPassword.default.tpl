{block name="title" prepend}{$LNG.nav_password}{/block}
{block name="components" prepend}
    <script src="components/button.js"></script>
{/block}
{block name="content"}
<main role="main" class="l-main">
	<section class="l-section">
		<div class="c-card c-card--center">
			<div class="c-card__header">
				<h1>{$LNG.nav_password}</h1>
				<span class="c-card__border"></span>
			</div>
			<div class="c-card__content">
				<span class="c-card__contentBorder"></span>
				<p>{$LNG.passwordInfo}</p>
				<form action="index.php?page=lostPassword" method="post" data-action="index.php?page=lostPassword" >
					<input type="hidden" value="send" name="mode">
					<div class="c-formRow">
						<label class="c-label" for="universe">{$LNG.universe}</label>
						<div class="c-formRow__wrapper c-select">
							<span class="c-input__before"></span>
							<span class="c-input__after"></span>
							<select name="uni" id="universe" class="changeAction">{html_options options=$universeSelect selected=$UNI}</select>
						</div>
					</div>
					<div class="c-formRow">
						<label class="c-label" for="username">{$LNG.passwordUsername}</label>
						<div class="c-formRow__wrapper">
							<span class="c-input__before"></span>
							<span class="c-input__after"></span>						
							<input type="text" class="c-input" name="username" id="username" placeholder="{$LNG.passwordUsername}">
						</div>
					</div>
					<div class="c-formRow">
						<label class="c-label" for="mail">{$LNG.passwordMail}</label>
						<div class="c-formRow__wrapper">
							<span class="c-input__before"></span>
							<span class="c-input__after"></span>						
						<input type="email" class="c-input" name="mail" id="mail" placeholder="{$LNG.passwordMail}">
					</div>
					</div>
					{if $recaptchaEnable}
					<div class="c-formRow" id="captchaRow">
						<label class="c-label">
							{$LNG.registerCaptcha}
							<p class="captchaButtons"></p>
						</label>
						<div class="g-recaptcha" data-sitekey="{$recaptchaPublicKey}"></div>
					</div>
					{/if}
					<s-button block type="submit">
						{$LNG.passwordSubmit}
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
{/block}