<br>
<p class="seperator">
{tr}This system has no system type configured. Please choose a system type for this object and an optional inheritance group. Press the 'continue' button to proceed.{/tr}
<br>
<br>
</p>
<p class="seperator">
<br>
{if $dns_cnt == 1}
<b>{tr}Please select a system type and an optional bundle of predefined settings to be inherited.{/tr}</b>
{else}
<b>{tr}Please select a system type and a bundle of predefined settings to be inherited.{/tr}</b>
{/if}
<br>
<br>
</p>
<table summary="{tr}System activation{/tr}" style='width:100%'>
 <tr>
  <td style='width:49%'>
   <table summary="{tr}Target system type selection{/tr}">
    <tr>
     <td> 
      {tr}System type{/tr}&nbsp;
	  <select name="SystemType" title="{tr}System type{/tr}" style="width:120px;"
			onChange="document.mainform.submit();">
       {html_options values=$SystemTypeKeys output=$SystemTypes selected=$SystemType}
      </select>
     </td>
    </tr>
   </table>
  </td>
  <td>
   <table summary="{tr}Object group selection{/tr}">
    <tr>
     <td> 
      {tr}Choose an object group as template{/tr}&nbsp;
	  <select name="ObjectGroup" title="{tr}Object group{/tr}" style="width:120px;" size=1>
		{if $dns_cnt == 1}
		<option value='none'>{tr}none{/tr}</option>	
		{/if}
       {html_options options=$ogroups selected=$ObjectGroup}
      </select>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<hr>
<div style="align: right;" align="right"><p>
	<button type='submit' name='systemTypeChosen'>{tr}Continue{/tr}</button>

	<button type='submit' name='SystemTypeAborted'>{msgPool type=cancelButton}</button>

</p></div>
