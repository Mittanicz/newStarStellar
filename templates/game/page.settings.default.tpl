{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="components" prepend}
<script src="components/input.js"></script>
<script src="components/button.js"></script>
{/block}
{block name="content"}
<section class="l-section">
    <div class="l-card">
        <div class="l-card__header">
            <h1>{$LNG.lm_options}</h1>
        </div>
        <div class="l-card__content l-card__content--lined">
            <ul class="c-tab">
                <li class="c-tab__item is-active" data-tab="userTab">
                    <span>
                        {$LNG.op_user}
                    </span>
                </li>
                <li class="c-tab__item" data-tab="generalTab">
                    <span>
                        {$LNG.op_general_settings}
                    </span>
                </li>
                <li class="c-tab__item" data-tab="galaxyTab">
                    <span>
                        {$LNG.op_galaxy_settings}
                    </span>
                </li>
                <li class="c-tab__item" data-tab="profileSettingsTab">
                    <span>
                        {$LNG.op_vacation_delete_mode}
                    </span>
                </li>
                {if $userAuthlevel > 0}
                    <li class="c-tab__item" data-tab="adminTab">
                        <span>
                            {$LNG.op_galaxy_settings}
                        </span>
                    </li>
                {/if}
            </ul>
            <form action="game.php?page=settings" method="post">
                <input type="hidden" name="mode" value="send">
                <div class="l-card__innerContent" data-tab-content="userTab" id="userTab">
                    <s-input
                        type="text"
                        name="foto"
                        label="{$LNG.op_foto}"
                        maxlength="90"
                        value="{$foto}"
                    ></s-input>
                    <s-input
                        type="text"
                        name="background"
                        label="{$LNG.op_background}"
                        maxlength="90"
                        value="{$background}"
                    ></s-input>
                    {if $changeNickTime < 0}
                        <s-input
                            type="text"
                            name="username"
                            label="{$LNG.op_username}"
                            maxlength="90"
                            value="{$username}"
                        ></s-input>
                    {else}
                        {$username}
                    {/if}
                    <s-input
                        type="password"
                        name="password"
                        label="{$LNG.op_old_pass}"
                        maxlength="20"
                    ></s-input>                
                    <s-input
                        type="password"
                        name="newpassword"
                        label="{$LNG.op_new_pass}"
                        maxlength="40"
                    ></s-input>                
                    <s-input
                        type="password"
                        name="newpassword2"
                        label="{$LNG.op_repeat_new_pass}"
                        maxlength="40"
                    ></s-input>                
                    <s-input
                        type="text"
                        name="email"
                        label="{$LNG.op_email_adress}"
                        maxlength="20"
                        value="{$email}"
                    ></s-input>
                    {$LNG.op_permanent_email_adress}       
                </div>
                <div class="l-card__innerContent" data-tab-content="generalTab" id="generalTab" style="display: none;">
                    <div class="c-formRow">
                        <label class="c-label">{$LNG.op_timezone}</label>
                        <div class="c-formRow__wrapper c-select c-select--small">
                            <select class="changeAction">{html_options options=$Selectors.timezones selected=$timezone}</select>
                        </div>
                    </div>
                    {* Selects may have name to function correctly *}
                    <div class="c-formRow">
                        <label class="c-label">{$LNG.op_lang}</label>
                        <div class="c-formRow__wrapper c-select c-select--small">
                            <select class="changeAction">{html_options options=$Selectors.lang selected=$timezone}</select>
                        </div>
                    </div>
                    <div class="c-formRow">
                        <label class="c-label">{$LNG.op_sort_planets_by}</label>
                        <div class="c-formRow__wrapper c-select c-select--small">
                            <select class="changeAction">{html_options options=$Selectors.Sort selected=$planetSort}</select>
                        </div>
                    </div>
                    <div class="c-formRow">
                        <label class="c-label">{$LNG.op_sort_kind}</label>
                        <div class="c-formRow__wrapper c-select c-select--small">
                            <select class="changeAction">{html_options options=$Selectors.SortUpDown selected=$planetOrder}</select>
                        </div>
                    </div>
                    {if count($Selectors.Skins) > 1}
                        <div class="c-formRow">
                            <label class="c-label">{$LNG.op_skin_example}</label>
                            <div class="c-formRow__wrapper c-select c-select--small">
                                <select class="changeAction">{html_options options=$Selectors.Skins selected=$theme id="theme"}</select>
                            </div>
                        </div>
                    {/if}
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="queueMessages" class="c-checkbox__input" value="1" {if $queueMessages == 1}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_active_build_messages}</span>
                    </label>
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="spyMessagesMode" class="c-checkbox__input" value="1" {if $spyMessagesMode == 1}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_active_spy_messages_mode}</span>
                    </label>
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="blockPM" class="c-checkbox__input" value="1" {if $blockPM == 1}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_block_pm}</span>
                    </label>
                </div>
                <div class="l-card__innerContent" data-tab-content="galaxyTab" id="galaxyTab" style="display: none;">
                    <s-input
                        type="number"
                        name="spycount"
                        label="{$LNG.op_spy_probes_number}"
                        size="{$spycount|count_characters + 3}"
                        value="{$spycount}"
                    ></s-input>
                    <s-input
                        type="number"
                        name="fleetactions"
                        label="{$LNG.op_max_fleets_messages}"
                        size="{$fleetActions|count_characters + 2}"
                        maxlength="2"
                        value="{$fleetActions}"
                    ></s-input>
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="galaxySpy" class="c-checkbox__input" value="1" {if $galaxySpy == 1}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_spy}</span>
                    </label>
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="galaxyMessage" class="c-checkbox__input" value="1" {if $galaxyMessage == 1}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_write_message}</span>
                    </label>
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="galaxyBuddyList" class="c-checkbox__input" value="1" {if $galaxyBuddyList == 1}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_add_to_buddy_list}</span>
                    </label>
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="galaxyMissle" class="c-checkbox__input" value="1" {if $galaxyMissle == 1}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_missile_attack}</span>
                    </label>
                </div>
                <div class="l-card__innerContent" data-tab-content="profileSettingsTab" id="profileSettingsTab" style="display: none;">
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="vacation" class="c-checkbox__input" value="1" />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_activate_vacation_mode}</span>
                    </label>
                    <label class="c-checkbox u-mb-30">
                        <span class="c-checkbox__over">
                            <input type="checkbox" name="delete" class="c-checkbox__input" value="1" {if $delete > 0}checked="checked"{/if} />
                            <span class="c-checkbox__span"></span>
                        </span>
                        <span class="c-checkbox__text">{$LNG.op_dlte_account}</span>
                    </label>
                    {if isModuleAvailable($smarty.const.MODULE_BANNER)}
                        {* IMPLEMENT USER BANNER/PIC *}
                    {/if}                
                </div>
                {if $userAuthlevel > 0}
                    <div class="l-card__innerContent" data-tab-content="adminTab" id="adminTab" style="display: none;">
                        <label class="c-checkbox u-mb-30">
                            <span class="c-checkbox__over">
                                <input type="checkbox" name="adminprotection" class="c-checkbox__input" value="1" {if $adminProtection > 0}checked="checked"{/if} />
                                <span class="c-checkbox__span"></span>
                            </span>
                            <span class="c-checkbox__text">{$LNG.op_admin_planets_protection}</span>
                        </label>
                        <input value="{$LNG.op_save_changes}" type="hidden">
                        <s-button type="submit" block>{$LNG.op_save_changes}</s-button>
                    </div>
                {/if}
            </form>
        </div>
    </div>
</section>
{/block}