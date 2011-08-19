{if $LDIFError != FALSE || $type == FALSE}
<p style="margin-top:5px;">
  {tr}The XLS export plug-in provides methods to download a complete snapshot of the running LDAP directory as XLS. You may save these files for documentation.{/tr}
</p>
<hr>

<table summary="" style="width:100%;">
<tr>
	<td width="30%">
		<LABEL for="single" >{tr}Export single entry{/tr}</LABEL>
	</td>
	<td>
		{*<input id="text" type="text" value="" name="single">*}
		<select id="single" name="single" size="1" title="{tr}Choose the data you want to export{/tr}">
			{html_options options=$choicelist selected=0}
		</select>
	</td>
	<td>
		<button type='submit' name='sfrmgetsingle'>{tr}Export{/tr}</button>

	</td>
</tr>
<tr>
	<td width="30%">
		<LABEL for="selfull">{tr}Export complete XLS for{/tr}</LABEL>
	</td>
	<td>
        {$base}
	</td>
	<td>
		<button type='submit' name='sfrmgetfull'>{tr}Export{/tr}</button>

	</td>
</tr>
	
{if $govmode eq "true"}
<tr>
	<td width="30%">
		<LABEL for="selivbb">{tr}Export IVBB LDIF for{/tr}</LABEL>
	</td>
	<td>
		<select id="selivbb" name="selivbb" size="1" title="{tr}Choose the department you want to export{/tr}">
			{html_options options=$deplist selected=$depselectivbb}
		</select>
	</td>
	<td>
		<button type='submit' name='sfrmgetivbb'>{tr}Export{/tr}</button>

	</td>
</tr>
{/if}
</table> 


{else}


<br>
	<h3>{tr}Export successful{/tr}</h3>
<br>
	<div>
		{image path="images/filesaveas.png"}

		<a href = "plugins/ldapmanager/getxls.php{$para}" title="{tr}Click here to save the complete LDAP database to a XLS file{/tr} ">{tr}Click here to save the LDAP export to a XLS file{/tr}</a>


		<br>
		<br>
	</div>
	<div align="right">
		<button type='submit' name='back'>{msgPool type=backButton}</button>

	</div>
{/if}

<hr>

<input type="hidden" name="ignore">
