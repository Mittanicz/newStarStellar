{block name="content"}
{block name="components" prepend}
<script src="components/button.js"></script>
{/block}
<div class="c-conversation">
    <form action="game.php?page=messages" method="post">
        <input type="hidden" name="mode" value="action">
        <input type="hidden" name="ajax" value="1">
        <input type="hidden" name="messcat" value="{$MessID}">
        <input type="hidden" name="side" value="{$page}">
        <input class="u-vhide" value="{$LNG.mg_confirm}" type="submit" name="submitBottom">
        <div class="c-conversation__wrapper">
            {foreach $MessageList as $Message}
                <div class="c-message">
                    <div id="message_{$Message.id}" class="c-message__header{if $MessID != 999 && $Message.unread == 1} is-unread{/if}">
                        <div>
                            {$Message.from}
                        </div>
                        <div>
                            <span>{$Message.time}</span>
                            <span>
                                {if $Message.type == 1 && $MessID != 999}
                                    <a 
                                        href="#" 
                                        onclick="return Dialog.Buddy({$Message.sender})"
                                        title="{$LNG.mg_fre}"
                                    >
                                        <img height="13px" class="messagesnew4" src="{$dpath}img/icons/iconav/mes_friendd.png" />
                                    </a> 
                                    <a 
                                        href="#"
                                        onclick="return Dialog.PM({$Message.sender}, Message.CreateAnswer('{$Message.subject}'));" 
                                        title="{$LNG.mg_answer_to} {strip_tags($Message.from)}"
                                    >
                                        <img height="13px" class="messagesnew4" src="{$dpath}img/icons/iconav/mes_messages.png" />
                                    </a>
                                {/if}
                                <a 
                                    href="#" 
                                    onclick="msgArchive({$Message.id}, {$Message.type}); Message.getMessages({$Message.type}); return false;" 
                                    title="{$LNG.mg_arh}"
                                >
                                    <img height="13px" class="messagesnew4" src="{$dpath}img/icons/iconav/mes_inarchive.png" />
                                </a>
                                <a 
                                    href="#" 
                                    onclick="msgDel({$Message.id}, {$Message.type}); Message.getMessages({$Message.type}); return false;" 
                                    title="{$LNG.mg_del}"
                                >
                                    <img height="13px" class="messagesnew4" src="{$dpath}img/icons/iconav/mes_delmsg.png" />
                                </a>
                                <div class="message_check">
                                    {if $MessID != 999}
                                        <input name="messageID[{$Message.id}]" value="1" type="checkbox">
                                    {/if}                    
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="messages_body">
                        <div colspan="4" class="left" style="padding:0;">
                            <div class="message_text">{$Message.text}</div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
        <div class="c-pagination">
            {$LNG.mg_page}:  
            {if $page != 1}
                <a href="#" class="c-pagination__item" onclick="Message.getMessages({$MessID}, {$page - 1});return false;">
                    &laquo;
                </a>
                &nbsp;
            {/if}
            <a 
                href="#" 
                class="
                    {if 1 == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}" 
                onclick="Message.getMessages({$MessID}, 1);return false;"
            >
                    1
            </a>
            {if $page - 4 > 1}
                ... 
            {/if}   
            {if $page - 3 > 1}
                <a 
                    href="#"                 
                    class="
                        {if $page - 3 == $page}
                            c-pagination__item is-active
                        {else}
                            c-pagination__item
                        {/if}" 
                    onclick="Message.getMessages({$MessID}, {$page - 3});return false;"
                >
                    {$page - 3}
                </a>
            {/if} 
            {if $page - 2 > 1}
                <a 
                    href="#" 
                    class="
                    {if $page - 2 == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}" 
                    onclick="Message.getMessages({$MessID}, {$page - 2});return false;"
                >
                    {$page - 2}
                </a>
            {/if}   
            {if $page - 1 > 1}
                <a 
                    href="#" 
                    class="
                    {if $page - 1 == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}"  
                    onclick="Message.getMessages({$MessID}, {$page - 1});return false;"
                >
                    {$page - 1}
                </a>
            {/if}
            {if $page > 1}
                <a 
                    href="#"
                    class="
                    {if $page == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}"  
                    onclick="Message.getMessages({$MessID}, {$page});return false;"
                >
                    {$page}
                </a>
            {/if}
            {if $page + 1 <= $maxPage}            
                <a 
                    href="#" 
                    class="
                    {if $page + 1 == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}"
                    onclick="Message.getMessages({$MessID}, {$page + 1});return false;"
                >
                    {$page + 1}
                </a>
            {/if}
            {if $page + 2 <= $maxPage}            
                <a 
                    href="#" 
                    class="
                    {if $page + 2 == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}"
                    onclick="Message.getMessages({$MessID}, {$page + 2});return false;"
                >
                    {$page + 2}
                </a>
            {/if}
            {if $page + 3 <= $maxPage}            
                <a 
                    href="#" 
                    class="
                    {if $page + 3 == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}"
                    onclick="Message.getMessages({$MessID}, {$page + 3});return false;"
                >
                    {$page + 3}
                </a>
            {/if}  
            {if $page + 4 < $maxPage} ... {/if}   
            {if $page + 4 <= $maxPage}
                <a 
                    href="#" 
                    class="
                    {if $maxPage == $page}
                        c-pagination__item is-active
                    {else}
                        c-pagination__item
                    {/if}"
                    onclick="Message.getMessages({$MessID}, {$maxPage});return false;"
                >
                    {$maxPage} 
                </a>
            {/if}      
            {if $page != $maxPage}
                <a href="#" class="c-pagination__item" onclick="Message.getMessages({$MessID}, {$page + 1});return false;">
                    &raquo;
                </a>
            {/if}
        </div>
    </form>
</div>
{/block}