{block name="title" prepend}{$LNG.write_message}{/block}
{block name="content"}
<section class="l-card">
   <div class="l-card__header">
       <h1>{$LNG.mg_to}: {$OwnerRecord.username} [{$OwnerRecord.galaxy}:{$OwnerRecord.system}:{$OwnerRecord.planet}]</h1>
   </div>
   <div class="l-card__content">
      <form name="message" id="message" action="">
         <div class="c-formRow">
            <input 
               class="c-input" 
               name="subject" 
               id="subject" 
               size="40" 
               maxlength="40" 
               placeholder="Title" 
               value="{if !empty($subject)}{$subject}{else}{$LNG.mg_no_subject}{/if}" 
               type="text"
            />
         </div>
         <textarea class="c-inputTextArea u-mb-30" placeholder="{$LNG.mg_text}" name="text" id="text" cols="40" rows="10"></textarea>
            <input class="u-vhide" id="submit" onclick="check();" name="button" value="{$LNG.mg_send}" type="hidden">
            <button class="c-btn c-btn--block"onclick="check();" type="submit">{$LNG.mg_send}</button>
      </form>
   </div>
</section>
<!-- <div id="ally_content" class="conteiner" style="width:auto">
   <div class="gray_stripe">
      {$LNG.mg_to}: <span class="message_recipient_name">{$OwnerRecord.username} [{$OwnerRecord.galaxy}:{$OwnerRecord.system}:{$OwnerRecord.planet}]</span> 
      <span style="float:right; color:#8e9394;">({$LNG.mg_characters} <span id="cntChars">0</span>/5.000)</span>
   </div>
   <form name="message" id="message" action="">
      <input class="message_subject" name="subject" id="subject" size="40" maxlength="40" placeholder="Title" value="{if !empty($subject)}{$subject}{else}{$LNG.mg_no_subject}{/if}" type="text">
      <div class="clear" style="border-bottom:1px solid #000;"></div>
      <textarea class="message_text_message" placeholder="{$LNG.mg_text}" name="text" id="text" cols="40" rows="10" onkeyup="$('#cntChars').text($(this).val().length); keyUp(event);" onkeydown="keyDown(event)"></textarea>
      <div class="build_band" style="padding-right:0;">       		
         <input class="bottom_band_submit message_check_message" id="submit" onclick="check();" name="button" value="{$LNG.mg_send}" type="button"> 
         <span style="color:#999; float:right; margin-right:10px;">[ctrl + enter]</span>
      </div>
   </form>
</div> -->
{/block}
{block name="script" append}
<script type="text/javascript">
   function check(){
   	if($('#text').val().length == 0) {
   		alert('{$LNG.mg_empty_text}');
   		return false;
   	} else {
   		$('submit').attr('disabled','disabled');
   		$.post('game.php?page=messages&mode=send&id={$id}&ajax=1', $('#message').serialize(), function(data) {
   			alert(data);
   			parent.$.fancybox.close();
   			return true;
   		}, 'json');
   	}
   }
</script>
{/block}