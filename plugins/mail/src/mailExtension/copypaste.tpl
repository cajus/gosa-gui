<h3>{tr}Mail settings{/tr}</h3>


<table style='width:100%;' cellspacing=0  summary="{tr}Address configuration{/tr}">
  <tr>
     <td><label for="mail">{tr}Primary address{/tr}</label>{$must}
      {if !$isModifyableMail && $initially_was_account}
      <input type='text' disabled size=30 value="{$mail}">
      {else}
      {if $domainSelectionEnabled}
      <input type='text' id="mail" name="mail" size=20 maxlength=65 value="{$mail}">
      @<select name='MailDomain' size=1>
       {html_options values=$MailDomains output=$MailDomains selected=$MailDomain}
      </select>
      {else}
      <input type='text' id="mail" name="mail" size=35 maxlength=65 value="{$mail}">
      {/if}
      {/if}
     </td>
    </tr>

	<tr>
		<td>
 		<h3>
      <label for="forwarder_list">{tr}Forward messages to{/tr}</label></h3>
					   	<select id="gosaMailForwardingAddress" style="width:100%; height:100px;" name="forwarder_list[]" size=15 multiple >
								{html_options values=$gosaMailForwardingAddress output=$gosaMailForwardingAddress}
								<option disabled>&nbsp;</option>
					   	</select>
						<br>
					    <input type='text' name="forward_address" size=20 align="middle" maxlength=65 	value="">
					    <button type='submit' name='add_forwarder'>{msgPool type=addButton}</button>&nbsp;

					    <button type='submit' name='add_local_forwarder'>{tr}Add local{/tr}</button>&nbsp;

					    <button type='submit' name='delete_forwarder'>{msgPool type=delButton}</button>

		</td>
		<td class='left-border'>

  	  <h3><label for="alternates_list">{tr}Alternative addresses{/tr}</label></h3>
					   	<select id="alternates_list" style="width:100%;height:100px;" name="alternates_list[]" size="15"
							 multiple title="{tr}List of alternative mail addresses{/tr}"> 
								{html_options values=$gosaMailAlternateAddress output=$gosaMailAlternateAddress}
								<option disabled>&nbsp;</option>
					   	</select>
					   	<br/>
					   	<input type='text' name="alternate_address" size="30" align="middle" maxlength="65" value="">
			   			<button type='submit' name='add_alternate'>{msgPool type=addButton}</button>

			   			<button type='submit' name='delete_alternate'>{msgPool type=delButton}</button>

		</td>		
	</tr>
</table>
<br>
<br>
