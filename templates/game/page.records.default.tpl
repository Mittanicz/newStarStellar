{block name="title" prepend}{$LNG.lm_records}{/block}
{block name="content"}
<section class="l-section">
   <div class="l-card">
       <div class="l-card__header">
           <h1>{$LNG.lm_records}</h1>
       </div>
       <div class="l-card__content l-card__content--lined">
         <ul class="c-tab">
            <li class="c-tab__item is-active" data-tab="buildingsTab">
                <span>
                  {$LNG.tech.0}
                </span>
            </li>
            <li class="c-tab__item" data-tab="researchTab">
                <span>
                  {$LNG.tech.100}
                </span>
            </li>
            <li class="c-tab__item" data-tab="fleetTab">
                <span>
                  {$LNG.tech.200}
                </span>
            </li>
            <li class="c-tab__item" data-tab="defenseTab">
                <span>
                  {$LNG.tech.400}
                </span>
            </li>
         </ul>
         <div data-tab-content="buildingsTab" id="buildingsTab">
            <table class="c-table c-table--fullWidth c-table--spacing">
               <tbody>
                  {foreach $buildList as $elementID => $elementRow}
                     <tr>
                        <td class="u-text-left">
                           <img src="{$dpath}img/game/gebaeude/buildings/{$elementID}.png" width="50">
                           {$LNG.tech.$elementID}
                        </td>
                        <td>
                           {if !empty($elementRow)}
                              <div>
                                 {foreach $elementRow as $user}
                                 {$LNG.rec_user_top}: {$user.username} 
                                 {/foreach}
                              </div>
                              <div>
                                 {$LNG.rec_record}: {$elementRow[0].level|number} | 
                                 {$LNG.rec_you}: {$PLANET[$resource[$elementID]]|number}
                              </div>
                           {/if}
                        </td>
                     </tr>
                  {/foreach}
               </tbody>
            </table>
         </div>
         <div data-tab-content="researchTab" id="researchTab" style="display: none;">
            <table class="c-table c-table--fullWidth c-table--spacing">
               <tbody>
                  {foreach $researchList as $elementID => $elementRow}
                     <tr>
                        <td class="u-text-left">
                           <img src="{$dpath}img/game/gebaeude/research/{$elementID}.png" width="50">
                           {$LNG.tech.$elementID}
                        </td>
                        <td>
                           {if !empty($elementRow)}
                           <div>
                              {foreach $elementRow as $user}
                              {$LNG.rec_user_top}: {$user.username} 
                              {/foreach}
                           </div>
                           <div>
                              {$LNG.rec_record}: {$elementRow[0].level|number} | 
                              {$LNG.rec_you}: {$USER[$resource[$elementID]]|number}
                           </div>
                           {/if}
                        </td>
                     </tr>
                  {/foreach}
               </tbody>
            </table>
         </div>
         <div data-tab-content="fleetTab" id="fleetTab" style="display: none;">
            <table class="c-table c-table--fullWidth c-table--spacing">
               <tbody>
                  {foreach $fleetList as $elementID => $elementRow}
                     <tr>
                        <td class="u-text-left">
                           <img src="{$dpath}img/game/gebaeude/{$elementID}.gif" width="50">
                           {$LNG.tech.$elementID}
                        </td>
                        <td>
                           {if !empty($elementRow)}
                           <div>
                              {foreach $elementRow as $user}
                              {$LNG.rec_user_top}: {$user.username} 
                              {/foreach}
                           </div>
                           <div>
                              {$LNG.rec_record}: {$elementRow[0].level|number} | 
                              {$LNG.rec_you}: {$PLANET[$resource[$elementID]]|number}
                           </div>
                           {/if}
                        </td>
                     </tr>
                  {/foreach}
               </tbody>
            </table>
         </div>
         <div data-tab-content="defenseTab" id="defenseTab" style="display: none;">
            <table class="c-table c-table--fullWidth c-table--spacing">
               <tbody>
                  {foreach $defenseList as $elementID => $elementRow}
                     <tr>
                        <td class="u-text-left">
                           <img src="{$dpath}img/game/gebaeude/{$elementID}.gif" width="50">
                           {$LNG.tech.$elementID}
                        </td>
                        <td>
                           {if !empty($elementRow)}
                           <div>
                              {foreach $elementRow as $user}
                              {$LNG.rec_user_top}: {$user.username} 
                              {/foreach}
                           </div>
                           <div>
                              {$LNG.rec_record}: {$elementRow[0].level|number} | 
                              {$LNG.rec_you}: {$PLANET[$resource[$elementID]]|number}
                           </div>
                           {/if}
                        </td>
                     </tr>
                  {/foreach}
               </tbody>
            </table>
         </div>
      </div>
   </div>
</section>
{/block}