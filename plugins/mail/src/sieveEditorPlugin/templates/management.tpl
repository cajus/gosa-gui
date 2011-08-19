<h3>{tr}List of sieve scripts{/tr}</h3>
<!--
{if $uattrib_empty}
		
	<font color='red'><b>{tr}Connection to the sieve server could not be established, the authentication attribute is empty.{/tr}</b></font><br>
	{tr}Please verify that the attributes UID and mail are not empty and try again.{/tr}
	<br>
	<br>

{elseif $Sieve_Error != ""}

	<font color='red'><b>{tr}Connection to the sieve server could not be established.{/tr}</b></font><br>
	{$Sieve_Error}
	<br>
	{tr}Possibly the sieve account has not been created yet.{/tr}
	<br>
	<br>
{/if}
	{tr}Be careful. All your changes will be saved directly to sieve, if you use the save button below.{/tr}
-->

	{$List}


<button type='submit' name='create_new_script'>{msgPool type='addButton'}</button>
<div class="plugin-actions">
 <button type=submit name="sieve_finish">{msgPool type=saveButton}</button>
 <button type=submit name="sieve_cancel">{msgPool type=cancelButton}</button>
</div>
