<font color='red'>Temporary disabled</font>
<!--
<p>
  {tr}The CSV import plug-in provides methods to generate user accounts from a file containing Comma Separated Values. The administrator can decide which columns should be transfered to which attribute. Note that you must have at least the UID, GIVENNAME and SURNAME set.{/tr}
</p>
<hr>

{if $fileup != TRUE}
<table summary="{tr}CSV export{/tr}">
	<tr>
		<td>
			<LABEL for="userfile">{tr}Select CSV file to import{/tr}</LABEL>
		</td>
		<td>
		<input type="hidden" name="MAX_FILE_SIZE" value="2097152">
		<input id="userfile" name="userfile" type="file" value="{tr}Browse{/tr}">
		</td>
	</tr>
	<tr>
		<td>
		<LABEL for="template">{tr}Select template{/tr}</LABEL>
		</td>
		<td>
		<select id="template" name="template" size="1" title="">
			{html_options options=$templates selected=""}	
		</select>
		</td>
		
	</tr>
</table>
{elseif $sorted != FALSE}


<br>
    {if $error == FALSE}
    	 <b>{tr}All entries have been written to the LDAP database successfully.{/tr}</b>
    {else}
    	 <b style="color:red">{tr}There was an error during the import of your data.{/tr}</b>
	{/if}

<b>{tr}Here is the status report for the import:{/tr} </b>
<br>
<br>


	<table summary="{tr}Status report{/tr}" cellspacing="1" border=0 cellpadding="4"  bgcolor="#FEFEFE">
		<tr>
			{foreach from=$head item=h}
			<td bgcolor="#BBBBBB">
				<b>{$h}</b>
			</td>
			{/foreach}
		</tr>
		{if $pointsbefore == TRUE}
		<tr>
			<td colspan={$i} bgcolor = "#EEEEEE">
				...	
			</td>
		</tr>
		{/if}
		
		{foreach from=$data item=row key=key}	
		<tr>
			{foreach from=$data[$key] item=col key=key2}
			<td bgcolor="#EEEEEE">
				{$data[$key][$key2]}
			</td>
			{/foreach}
		</tr>
		{/foreach}
	    {if $pointsafter == TRUE}
	    <tr>
	        <td colspan={$i} bgcolor = "#EEEEEE">
	        ...
	        </td>
	    </tr>
	    {/if}
																		   
	</table>

{else}
<br><b>{tr}Selected Template{/tr}:</b> {$tpl}
<br>
<br>
	<table summary="{tr}Template selection{/tr}" cellspacing="1" border=0 cellpadding="4" bgcolor="#FEFEFE">
		<tr>
			{foreach from=$data[0] item=item key=key}
			<td bgcolor="#BBBBBB">
				<select name="row{$key}" size="1" title="">
		    		 {html_options options=$attrs selected=$selectedattrs[$key]}
				</select>
			</td>
			{/foreach}
		</tr>
		{foreach from=$data item=val key=key}
		<tr>
			{foreach from=$data[$key] item=val2 key=key2}
			<td bgcolor="#EEEEEE">
				{$data[$key][$key2]}&nbsp;
			</td>
			{/foreach}
		</tr>
		{/foreach}
		
	</table>

< ! - - {html_table loop=$data cols=$anz table_attr='border="1"'}- - >
{/if}

<hr>
<div class="plugin-actions">
  {if $fileup != TRUE}
    <button type='submit' name='fileup'>{tr}Import{/tr}</button>

  {else}
    {if $sorted == FALSE}
      <input name="sorted" value="{tr}Import{/tr}" type ="submit">
    {else}
      <button type='submit' name='back{$plug}'>{msgPool type=backButton}</button>

    {/if}
  {/if}
</div>
<input type="hidden" name="ignore">
-->
