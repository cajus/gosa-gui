
<h3>{tr}System trust{/tr}
</h3>

{if !$multiple_support}{tr}Trust mode{/tr}&nbsp;
 {render acl=$trustmodeACL}
  <select name="trustmode" id="trustmode" size=1   onChange="changeSelectState('trustmode', 'add_ws');   changeSelectState('trustmode', 'del_ws');">
   {html_options options=$trustmodes selected=$trustmode}
  </select>
 {/render}
 {render acl=$trustmodeACL}
  {$trustList}
 {/render}
 {render acl=$trustmodeACL}
  <button {$trusthide}type='submit' name='add_ws' id="add_ws">
  {msgPool type=addButton}</button>&nbsp;
 {/render}
 {else}
 
 
 <input type="checkbox" name="use_trustmode" {if $use_trustmode} checked {/if}class="center" onClick="$('div_trustmode').toggle();">{tr}Trust mode{/tr}&nbsp;
 
 
 <div {if !$use_trustmode} style="display: none;" {/if}id="div_trustmode">
 {render acl=$trustmodeACL}
  <select name="trustmode" id="trustmode" size=1 onChange="changeSelectState('trustmode', 'add_ws'); changeSelectState('trustmode', 'del_ws');">
   {html_options options=$trustmodes selected=$trustmode}
  </select>
 {/render}
 {render acl=$trustmodeACL}
  {$trustList}
 {/render}
 {render acl=$trustmodeACL}
  <button type='submit' name='add_ws' id="add_ws">
  {msgPool type=addButton}</button>&nbsp;
 {/render}
</div>

{/if}
