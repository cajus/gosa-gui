
{if $type == "FOLDER"}
<h3>{$entry.NAME}</h3>

<table summary="{tr}Edit application image{/tr}" >
	<tr>
		<td>
			{tr}Folder image{/tr}
		</td>
		<td>
			{if $image_set}
				<img src="getbin.php?{$rand}" alt='{tr}Could not load image.{/tr}'>
			{else}
				<i>{tr}None{/tr}</i>
			{/if}
		</td>
	</tr>
	<tr>
		<td colspan=2>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>{tr}Upload image{/tr}
		</td>
		<td>
			<input type="FILE" name="folder_image">
			<button type='submit' name='folder_image_upload'>{tr}Upload{/tr}</button>

		</td>
	</tr>
	<tr>
		<td>{tr}Reset image{/tr}</td>
		<td><button type='submit' name='edit_reset_image'>{tr}Reset{/tr}</button>
</td>
	</tr>
</table>
<br>
{/if}

{if $type == "ENTRY"}
<h3>{tr}Application settings{/tr}</h3>
<table summary="{tr}Edit application settings{/tr}">
	<tr>
		<td>{tr}Name{/tr}</td>
		<td>{$entry.NAME}</td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>{tr}Application options{/tr}</b>
		</td>
	</tr>
{foreach from=$paras item=item key=key}
	<tr>
		<td>{$key}&nbsp;</td>
		<td><input style='width:200px;' type='text' name="parameter_{$key}" value="{$item}"></td>
	</tr>
{/foreach}
</table>
{/if}
<p class="seperator">
</p>
<div style="width:100%; text-align:right; padding:3px;">
	<button type='submit' name='app_entry_save'>{msgPool type=saveButton}</button>

	&nbsp;
	<button type='submit' name='app_entry_cancel'>{msgPool type=cancelButton}</button>

</div>
