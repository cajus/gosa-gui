
<div id="mainlist">
 <div class="mainlist-header">
  <p>{tr}Mail queue{/tr}
  </p>
  <div class="mainlist-nav">
   <table summary="{tr}Filter{/tr}" style="width: 100%;"      id="t_scrolltable" cellpadding="0" cellspacing="0">
    <tr>
     <td>{tr}Search on{/tr}
      <select size="1" name="p_server" title="{tr}Select a server{/tr}" onchange="mainform.submit()">
       {html_options values=$p_serverKeys output=$p_servers selected=$p_server}
      </select>
     </td>
     <td>{tr}Search for{/tr}
      <input type='text' name="search_for" size=25 maxlength=60        
        value="{$search_for}" title="{tr}Enter user name to search for{/tr}"        
        onChange="mainform.submit()">
     </td>
     <td>{tr}within the last{/tr}&nbsp;
      <select size="1" name="p_time" onchange="mainform.submit()">
       {html_options values=$p_timeKeys output=$p_times selected=$p_time}
      </select>
     </td>
     <td>
      <button type='submit' name='search'>{tr}Search{/tr}</button>
     </td>
     <td>
      {if $delAll_W}
       <input name="all_del"  src="images/lists/trash.png"							
        value="{tr}Remove all messages{/tr}" type="image" 					
        title="{tr}Remove all messages from selected servers queue{/tr}">
      {/if}
      {if $holdAll_W}
       <input name="all_hold" src="plugins/mail/html/images/mailq_hold.png"					
        value="{tr}Hold all messages{/tr}" type="image"					
        title="{tr}Hold all messages in selected servers queue{/tr}">
      {/if}
      {if $unholdAll_W}
       <input name="all_unhold" src="plugins/mail/html/images/mailq_unhold.png"							
        value="{tr}Release all messages{/tr}" 	type="image"					
        title="{tr}Release all messages in selected servers queue{/tr}">
      {/if}
      {if $requeueAll_W}
       <input name="all_requeue" src="images/lists/reload.png"							
        value="{tr}Re-queue all messages{/tr}" type="image"					
        title="{tr}Re-queue all messages in selected servers queue{/tr}">
      {/if}
     </td>
    </tr>
   </table>
  </div>
 </div>
</div>

<br>

{if !$query_allowed}
<b>{msgPool type=permView}</b>

{else}

 {if $all_ok != true}

  <b>{tr}Search returned no results{/tr}...</b>

 {else}

  <div class="listContainer" id="d_scrollbody" style="min-height: 475px; height: 444px;">
   <table summary="{tr}Phone reports{/tr}" style="width:100%;" cellpadding="0" cellspacing="0">
    <thead class="fixedListHeader listHeaderFormat">
     <tr>
      <td class='listheader'>
       <input type='checkbox' id='select_all' name='select_all' 
          title='{tr}Select all{/tr}' onClick="toggle_all_('^selected_.*$','select_all');">
      </td> 
      <td class='listheader'><a href="{$plug}&amp;sort=MailID">{tr}ID{/tr}{if $OrderBy == "MailID"} {$SortType}{/if}</a></td>
      <td class='listheader'><a href="{$plug}&amp;sort=Server">{tr}Server{/tr}{if $OrderBy == "Server"}{$SortType}{/if}</a></td>
      <td class='listheader'><a href="{$plug}&amp;sort=Size">{tr}Size{/tr}{if $OrderBy == "Size"} {$SortType}{/if}</a></td>
      <td class='listheader'><a href="{$plug}&amp;sort=Arrival">{tr}Arrival{/tr}{if $OrderBy == "Arrival"}{$SortType}{/if}</a></td>
      <td class='listheader'><a href="{$plug}&amp;sort=Sender">{tr}Sender{/tr}{if $OrderBy == "Sender"}{$SortType}{/if}</a></td>
      <td class='listheader'><a href="{$plug}&amp;sort=Recipient">{tr}Recipient{/tr}{if $OrderBy == "Recipient"}{$SortType}{/if}</a></td>
      <td class='listheader'><a href="{$plug}&amp;sort=Status">{tr}Status{/tr}{if $OrderBy == "Status"}{$SortType}{/if}</a></td>
      <td class='listheader'>&nbsp;</td>
     </tr>
    </thead>
    <tbody class="listScrollContent listBodyFormat" id="t_nscrollbody">


     {foreach from=$entries item=val key=key}
      <tr>
       <td class="list0">
        <input id="selected_{$entries[$key].MailID}" type='checkbox' 
         name='selected_{$entries[$key].MailID}_{$entries[$key].Server}' class='center'>
       </td>
       <td class="list0">
        {if $entries[$key].Active == true}
         {image path="plugins/mail/html/images/mailq_active.png"}
        {/if}
        {$entries[$key].MailID}
       </td>
       <td class="list0">{$entries[$key].ServerName}</td>
       <td class="list0">{$entries[$key].Size}</td>
       <td class="list0">{$entries[$key].Arrival|date_format:"%d.%m.%Y %H:%M:%S"}</td>
       <td class="list0">{$entries[$key].Sender}</td>
       <td class="list0">{$entries[$key].Recipient}</td>
       <td class="list0">{$entries[$key].Status}</td>
       <td class="list0" style='border-right: 0pt none;'>
        {if $del_W}
         {image action="del__{$entries[$key].MailID}__{$entries[$key].Server}" 
           path="images/lists/trash.png" title="{tr}Delete this message{/tr}"}
        {else}
         {image path="images/empty.png"}
        {/if}
        
        {if $entries[$key].Hold == true}
         {if $unhold_W}
          {image action="unhold__{$entries[$key].MailID}__{$entries[$key].Server}" 
            path="plugins/mail/html/images/mailq_unhold.png" title="{tr}Release message{/tr}"}
          {else}
           {image path="images/empty.png"}
          {/if}
         {else}
          {if $hold_W}
           {image action="hold__{$entries[$key].MailID}__{$entries[$key].Server}" 
             path="plugins/mail/html/images/mailq_hold.png" title="{tr}Hold message{/tr}"}
          {else}
           {image path="images/empty.png"}
          {/if}
         {/if}
        
         {if $requeue_W}
          {image action="requeue__{$entries[$key].MailID}__{$entries[$key].Server}" 
            path="images/lists/reload.png" title="{tr}Re-queue this message{/tr}"}
         {else}
          {image path="images/empty.png"}
         {/if}
        
         {if $header_W}
          {image action="header__{$entries[$key].MailID}__{$entries[$key].Server}" 
            path="plugins/mail/html/images/mailq_header.png" title="{tr}Display header of this message{/tr}"}
         {else}
          {image path="images/empty.png"}
         {/if}
       </td>
      </tr>
     {/foreach}
     <tr>
      <td class="list0">&nbsp;</td>
      <td class="list0">&nbsp;</td>
      <td class="list0">&nbsp;</td>
      <td class="list0">&nbsp;</td>
      <td class="list0">&nbsp;</td>
      <td class="list0">&nbsp;</td>
      <td class="list0" style='border-right: 0pt none;'>
</td>
     </tr>
    </tbody>
   </table>
   <table style='width:100%; text-align:center;' summary="{tr}Page selector{/tr}">
    <tr>
     <td>{$range_selector}</td>
    </tr>
   </table>
  </div>
  <hr>
 {/if}
{/if}
