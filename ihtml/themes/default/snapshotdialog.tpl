{if $RestoreMode}

<h3>{tr}Restoring object snapshots{/tr}</h3>
<hr>
<br>
{tr}This procedure will restore a snapshot of the selected object. It will replace the existing object after pressing the restore button.{/tr}
<br>
<br>
{tr}DNS configuration and some database entries cannot be restored. They need to be recreated manually.{/tr}
<br>
<br>
{tr}Don't forget to check references to other objects, for example does the selected printer still exists ?{/tr}
<br>
<hr>
<br>
<table summary="" style="width:100%">
	{if !$restore_deleted}
	<tr>
		<td>
		<b>{tr}Object{/tr}</b>&nbsp;
		{$CurrentDN}
		</td>
	</tr>
	{/if}
	<tr>
		<td>
			<br>
			{if $CountSnapShots==0}
				{tr}There is no snapshot available that can be restored{/tr}
			{else}
				{tr}Choose a snapshot and click the folder image, to restore the snapshot{/tr}
			{/if}
		</td>
	</tr>
	<tr>
		<td>
			{$SnapShotList}
		</td>
	</tr>
</table>

<hr>
<div class="plugin-actions">
    <button type='submit' name='CancelSnapshot'>{tr}Cancel{/tr}</button>

</div>

{else}

<h2>{tr}Creating object snapshots{/tr}</h2>
<hr>
<br>
{tr}This procedure will create a snapshot of the selected object. It will be stored inside a special branch of your directory system and can be restored later on.{/tr}
<br>
<br>
{tr}Remember that database entries, DNS configurations and possibly created zones in server extensions will not be stored in the snapshot.{/tr}
<br>
<hr>
<br>
<table summary="" style="width:100%">
	<tr>
		<td>
			<b>{tr}Object{/tr}</b>
		</td>
		<td style="width:95%"> 
		   {$CurrentDN}
		</td>
	</tr>
	<tr>
		<td>
			<b>{tr}Time stamp{/tr}</b> 
		</td>
		<td> 
		   {$CurrentDate}
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<br>
			{tr}Reason for generating this snapshot{/tr}<br> 
			<textarea name="CurrentDescription" style="width:100%;height:160px;" rows=10 cols=100>{$CurrentDescription}</textarea>
		</td>
	</tr>
</table>

<hr>
<div class="plugin-actions">
    <button type='submit' name='CreateSnapshot'>{tr}Continue{/tr}</button>

    <button type='submit' name='CancelSnapshot'>{tr}Cancel{/tr}</button>

</div>

<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
  document.mainform.CurrentDescription.focus();
  -->
</script>
{/if}
