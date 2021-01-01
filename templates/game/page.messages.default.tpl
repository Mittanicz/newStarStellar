{block name="title" prepend}{$LNG.lm_messages}{/block}
{block name="components" prepend}
<script src="components/button.js"></script>
{/block}
{block name="content"}
<section class="l-section">
	<div class="l-card">
		<div class="l-card__header">
			<h1>Messages</h1>
		</div>
		<div class="l-card__content">
			<div class="c-slider">
				<ul class="c-tab c-tab--vertical">
					{foreach $CategoryList as $CategoryID => $CategoryRow}
					<li 
						class="c-tab__item"
						onclick="Message.getMessages({$CategoryID});return false;"
						id="mes_{$CategoryID}"
					>
						{$LNG.mg_type.{$CategoryID}} 
						<span id="unread_{$CategoryID}">
							{$CategoryRow.unread}</span>/<span id="total_{$CategoryID}">
								{$CategoryRow.total}
						</span>
					</li>
					{/foreach}
				</ul>
			</div>
			<div class="l-card__innerContent l-card__innerContent--noPadd l-card__innerContent--stretch">
				<div class="c-conversation__header">
					<div class="c-formRow u-mb-0">
						<div class="c-formRow__wrapper c-select">
							<select name="uni" id="universe" class="changeAction">
								<option value="readmarked">{$LNG.mg_read_marked}</option>
								<option value="readtypeall">{$LNG.mg_read_type_all}</option>
								<option value="readall">{$LNG.mg_read_all}</option>
								<option value="deletemarked">{$LNG.mg_delete_marked}</option>
								<option value="deleteunmarked">{$LNG.mg_delete_unmarked}</option>
								<option value="deletetypeall">{$LNG.mg_delete_type_all}</option>
								<option value="deleteall">{$LNG.mg_delete_all}</option>
								<option value="archivemarked">{$LNG.mg_arh_mess}</option>
							</select>
						</div>
					</div>
					<s-button
						type="submit" 
						name="submitBottom"
					>
						{$LNG.mg_confirm}
					</s-button>
				</div>				
				<div id="mes_viw">

				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(document).ready(function () {
		Message.getMessages({100})
	});
</script>
{/block}