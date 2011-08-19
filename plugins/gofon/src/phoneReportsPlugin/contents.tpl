<div id="mainlist">
 <div class="mainlist-header">
  <p>{tr}Phone reports{/tr}</p>

  <div class="mainlist-nav">
   <table summary="{tr}Filter{/tr}" style="width: 100%;"
      id="t_scrolltable" cellpadding="0" cellspacing="0">
    <tr>
     <td>{tr}Server{/tr}
      <select size="1" name="selected_server" title="{tr}Select server to search on{/tr}" onChange="mainform.submit()">
       {html_options options=$servers selected=$selected_server}
      </select>
     </td>
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

{if $search_result}

 <div class="listContainer" id="d_scrollbody" style="min-height: 475px; height: 444px;">
  <table summary="{tr}Phone reports{/tr}" style="width:100%;" cellpadding="0" cellspacing="0">
   <thead class="fixedListHeader listHeaderFormat">
    <tr>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=0">{tr}Date{/tr}</a> {$mode0}</td>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=1">{tr}Source{/tr}</a> {$mode1}</td>
     <td class='listheader'><a href="main.php{$plug}&amp;sort=2">{tr}Destination{/tr}</a> {$mode2}</td>	
     <td class='listheader'><a href="main.php{$plug}&amp;sort=3">{tr}Channel{/tr}</a> {$mode3}</td>	
     <td class='listheader'><a href="main.php{$plug}&amp;sort=4">{tr}Application{/tr}</a> {$mode4}</td>	
     <td class='listheader'><a href="main.php{$plug}&amp;sort=5">{tr}Status{/tr}</a> {$mode5}</td>	
     <td class='listheader'  style='border-right: 0pt none;'><a href="main.php{$plug}&amp;sort=6">{tr}Duration{/tr}</a> {$mode6}</td>	
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
     </tr>
   </tbody>
  </table>

 </div>
 <div class="nlistFooter">
  <div style='width:100%;'>
   {$range_selector}
  </div>
 </div>

{else}
 <hr>
 <b>{tr}Search returned no results...{/tr}</b>
{/if}

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('search_for');
  -->
</script>
