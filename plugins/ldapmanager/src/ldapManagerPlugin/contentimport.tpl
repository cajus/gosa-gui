<font color='red'>Temporary disabled</font>
<!--





{if $type == FALSE || $LDIFError != FALSE}
<p style="margin-top:5px;">
  {tr}The LDIF import plug-in provides methods to upload a set of entries to your running LDAP directory as LDIF. You may use this to add new or modify existing entries. Remember that GOsa will not check your LDIF for GOsa conformance.{/tr}
</p>

<hr>
<table summary="" width="100%">
<tr>
    <td width="180">
		<LABEL for="userfile">{tr}Import LDIF File{/tr}</LABEL>
    </td>
    <td>
			<input type="hidden" name="ignore">
			<input type="hidden" name="MAX_FILE_SIZE" value="2097152">
			<input name="userfile" id="userfile" type="file" value="{tr}Browse{/tr}">
    </td>
</tr>
<tr>
	<td>
		&nbsp;
	</td>
	<td>
    <input type="checkbox" name="overwrite" value="1" id="overwrite"> - - >
		<input type="radio" name="overwrite" value="1" checked>{tr}Modify existing objects, keep untouched attributes{/tr}<br>
		<input type="radio" name="overwrite" value="0">{tr}Overwrite existing objects, all not listed attributes will be removed{/tr}
	</td>
</tr>
<tr>
   	<td>
		&nbsp;
   	</td>
   	<td>
        <input type="checkbox" name="cleanup" value="1" id="cleanup">
		<LABEL for="cleanup">{tr}Remove existing entries first{/tr}</LABEL>
	</td>
</tr>
</table>
{else}

<br>
    <h3>{tr}Import successful{/tr}</h3>
<br>

<div align="right">
		<button type='submit' name='back'>{msgPool type=backButton}</button>

</div>
		
{/if}

<hr>
<div class="plugin-actions">
  <button type='submit' name='fileup'>{tr}Import{/tr}</button>

</div>

<input type="hidden" name="ignore">
-->
