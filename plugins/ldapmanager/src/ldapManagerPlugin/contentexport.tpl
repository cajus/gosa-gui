<p style="margin-top:5px;">
  {tr}The LDIF export plug-in provides methods to download a complete snapshot of the running LDAP directory as LDIF. You may save these files for backup purpose or when initializing a new server.{/tr}
</p>
<hr>

<table summary="" style="width:100%;">
<tr>
	<td width="30%">
		<LABEL for="text" >{tr}Export single entry{/tr}</LABEL>
	</td>
	<td>
		<input id="text" type="text" value="{$single}" name="single">
	</td>
	<td>
		<button type='submit' name='sfrmgetsingle'>{tr}Export{/tr}</button>

	</td>
</tr>
<tr>
	<td width="30%">
		<LABEL for="selfull">{tr}Export complete LDIF for{/tr}</LABEL>
	</td>
	<td>
        {$base}
	</td>
	<td>
		<button type='submit' name='sfrmgetfull'>{tr}Export{/tr}</button>

	</td>
</tr>
</table> 

<hr>

<input type="hidden" name="ignore">
