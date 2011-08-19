<div id="mainlist">
 <div class="mainlist-header">
  <p>{tr}Fax reports{/tr}</p>

  <div class="mainlist-nav">
   <table summary="{tr}Filter{/tr}" style="width: 100%;"
      id="t_scrolltable" cellpadding="0" cellspacing="0">
    <tr>
     <td>{tr}Date{/tr}
      <select size="1" name="month" onChange="mainform.submit()">
       {html_options options=$months selected=$month_select}
      </select>
      <select size="1" name="year" onChange="mainform.submit()">
       {html_options values=$years output=$years selected=$year_select}
      </select>
     </td>
     <td>{tr}Search for{/tr}
      <input type='text' name="search_for" size=25 maxlength=60
        value="{$search_for}" title="{tr}Enter user name to search for{/tr}"
        onChange="mainform.submit()">
     </td>
     <td>
      <button type='submit' name='search'>{tr}Search{/tr}</button>
     </td>
    </tr>
   </table>

  </div>
 </div>
</div>

{if $search_result ne ""}
 <div class="listContainer" id="d_scrollbody" style="min-height: 475px; height: 444px;">
  <table summary="{tr}Phone reports{/tr}" style="width:100%;" cellpadding="0" cellspacing="0">
   <thead class="fixedListHeader listHeaderFormat">
    <tr>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=0">{tr}User{/tr}</a> {$mode0}</td>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=1">{tr}Date{/tr}</a> {$mode1}</td>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=2">{tr}Status{/tr}</a> {$mode2}</td>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=3">{tr}Sender{/tr}</a> {$mode3}</td>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=4">{tr}Receiver{/tr}</a> {$mode4}</td>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=5">{tr}# pages{/tr}</a> {$mode5}</td>
     <td class='listheader' style='border-right: 0pt none;'>&nbsp;</td>
    </tr>
   </thead>
   <tbody class="listScrollContent listBodyFormat" id="t_nscrollbody">
    {$search_result}
    <tr>
     <td class="list0">&nbsp;</td>
     <td class="list0">&nbsp;</td>
     <td class="list0">&nbsp;</td>
     <td class="list0">&nbsp;</td>
     <td class="list0">&nbsp;</td>
     <td class="list0">&nbsp;</td>
     <td class="list0" style='border-right: 0pt none;'>&nbsp;</td>
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

{else}
  <b>{tr}Search returned no results...{/tr}</b>
{/if}


<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('search_for');
  -->
</script>
