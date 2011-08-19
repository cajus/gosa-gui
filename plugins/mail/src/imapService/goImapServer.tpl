<h3>{tr}Generic{/tr}</h3>
<table width="100%" summary="{tr}IMAP service{/tr}">
	<tr>
		<td style='width:50%;'>
			<table summary="{tr}Generic settings{/tr}">
				<tr>
					<td>{tr}Server identifier{/tr}{$must}
					</td>
					<td>
{render acl=$goImapNameACL}
						<input type='text' name="goImapName" id="goImapName" size=40 maxlength=60 value="{$goImapName}" >
{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Connect URL{/tr}{$must}
					</td>
					<td>
{render acl=$goImapConnectACL}
						<input type='text' name="goImapConnect" id="goImapConnect" size=40 maxlength=100 value="{$goImapConnect}" >
{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Administrator{/tr}{$must}
					</td>
					<td>
{render acl=$goImapAdminACL}
						<input type='text' name="goImapAdmin" id="goImapAdmin" size=30 maxlength=60 value="{$goImapAdmin}" >
{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Password{/tr}{$must}
					</td>
					<td>
{render acl=$goImapPasswordACL}
					<input type=password name="goImapPassword" id="goImapPassword" size=30 maxlength=60 value="{$goImapPassword}" >
{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Sieve connect URL{/tr}{$must}
					</td>
					<td>
{render acl=$goImapSieveServerACL}
						<input type='text' name="goImapSieveServer" id="goImapSieveServer" size=30 maxlength=60 value="{$goImapSieveServer}">
{/render}
					</td>
				</tr>
			</table>
		</td>
		<td class='left-border'>
      {render acl=$cyrusImapACL}
        <input type='checkbox' name='cyrusImap' value=1 {if $cyrusImap} checked {/if} > 
      {/render}
      {tr}Start IMAP service{/tr}
      <br>

      {render acl=$cyrusImapSSLACL}
       <input type='checkbox' name='cyrusImapSSL' value=1 {if $cyrusImapSSL} checked {/if}> 
      {/render}
      {tr}Start IMAP SSL service{/tr}
      <br>

      {render acl=$cyrusPop3ACL}
        <input type='checkbox' name='cyrusPop3' value=1 {if $cyrusPop3} checked {/if} > 
      {/render}
      {tr}Start POP3 service{/tr}
      <br>

      {render acl=$cyrusPop3SSLACL}
        <input type='checkbox' name='cyrusPop3SSL' value=1 {if $cyrusPop3SSL} checked {/if} > 
      {/render}
      {tr}Start POP3 SSL service{/tr}
		</td>
	</tr>
</table>
<hr>
<br>
<h3>Action</h3>

{if $is_new == "new"}
 {tr}The server must be saved before you can use the status flag.{/tr}
{elseif !$is_acc}
 {tr}The service must be saved before you can use the status flag.{/tr}
{/if}

<br>
<select name="action" title='{tr}Set new status{/tr}'
	{if $is_new =="new" || !$is_acc} disabled {/if}>
	<option value="none">&nbsp;</option>
    {html_options options=$Actions}
</select>

<button type='submit' name='ExecAction' title="{tr}Set status{/tr}"
	{if $is_new == "new" || !$is_acc} disabled {/if}>{tr}Execute{/tr}</button>

<hr>

<div class="plugin-actions">
 <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
 <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>

<input type="hidden" name="goImapServerPosted" value="1">
