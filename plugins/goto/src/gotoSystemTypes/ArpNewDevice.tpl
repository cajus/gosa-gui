<h3>{tr}Integrating unknown devices{/tr}</h3>
<p>
 {tr}The current device has been detected by the ARP monitor used by GOsa. You can integrate this device into your running DHCP/DNS infrastructure by submitting this form. The device entry will disappear from the list of the systems and move to the DNS/DHCP configuration.{/tr}
</p>
<table summary="{tr}Integrating unknown devices{/tr}" style="width:100%">
<tr>
 <td style>
  <LABEL for="cn">
   {tr}DNS name{/tr}{$must}
  </LABEL>
 </td>
 <td style='width:35%;' class='right-border'>

  <input type='text' name="cn" id="cn" size=18 maxlength=60 value="{$cn}">
 </td>
 <td style='width:15%'>
  <LABEL for="description">
   {tr}Description{/tr}
  </LABEL>
 </td>
 <td style='width:35%'>
  <input type='text' name="description" id="description" size=18 maxlength=60 value="{$description}">
 </td>
</tr>
</table>
<br>
<hr>
{$netconfig}

<hr>

<!--<h3>{tr}GOto{/tr}</h3>-->
<p>
<input type='checkbox' value='1' name='gotoIntegration'
    onChange="changeState('SystemType');changeState('ObjectGroup');"
    {if $gotoIntegration} checked {/if}>&nbsp;{tr}GOto integration{/tr}
</p>
<table summary="{tr}Target type selection{/tr}" style='width:100%'>
 <tr>
  <td style='width:49%'>
      {tr}System type{/tr}&nbsp;
	  <select {if !$gotoIntegration} disabled {/if}
      id="SystemType"
      name="SystemType" title="{tr}System type{/tr}" style="width:120px;"
			onChange="document.mainform.submit();">
       {html_options values=$SystemTypeKeys output=$SystemTypes selected=$SystemType}
      </select>
  </td>
  <td>
      {tr}Choose an object group as template{/tr}&nbsp;
	    <select {if !$gotoIntegration} disabled {/if}
        id="ObjectGroup"
        name="ObjectGroup" title="{tr}Object group{/tr}" style="width:120px;">
		  <option value='none'>{tr}none{/tr}</option>	
       {html_options options=$ogroups selected=$ObjectGroup}
      </select>
  </td>
 </tr>
</table>
<input type='hidden' name='ArpNewDevice_posted' value='1'>

<hr>
