<h3>{tr}Copy & paste wizard{/tr}</h3>

<b>{$message}</b>
<br>
<br>
{if $Complete == false}
	{tr}Some values need to be unique in the complete directory while some combinations make no sense. Please edit the values below to fulfill the policies.{/tr}
	<br>
{tr}Remember that some properties like taken snapshots will not be copied!{/tr}&nbsp;
{tr}Or if you copy or cut an entry within GOsa and delete the source object, you may get errors while pasting this object again!{/tr}

	<hr>
	<br>
	{$AttributesToFix}
	{if $SubDialog == false}
	<br>

	<div style='text-align:right;width:100%;'>
		<button type='submit' name='PerformCopyPaste'>{tr}Save{/tr}</button>
	    {if $type == "modified"}
		    <button type='submit' name='abort_current_cut-copy_operation'>{tr}Cancel{/tr}</button>
    	{/if}
		<button type='submit' name='abort_all_cut-copy_operations'>{tr}Cancel all{/tr}</button>
	</div>
	{/if}
{else}
	<hr>
	<h3>{tr}Operation complete{/tr}</h3>
	<div style='text-align:right;width:100%;'>
		<button type='submit' name='Back'>{tr}Finish{/tr}</button>
	</div>
{/if}
