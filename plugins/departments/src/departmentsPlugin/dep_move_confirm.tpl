<div style="font-size:18px;">
 {image path="images/warning.png" align="top"}&nbsp;{tr}Warning{/tr} - {tr}You are currently moving/renaming this department.{/tr}

</div>
<p>
{tr}Modifying a departments naming attribute 'ou' or base may corrupt ACLs and snapshot entries for all entire objects.{/tr}
</p>
<p>
{tr}GOsa can NOT fix this for you, yet.{/tr}
</p>
<p>
{tr}Before you confirm this action, ensure that everything will be as expected, possibly the best solution is a backup.{/tr} 
</p>

<hr>
<div class="plugin-actions">
	<button type='submit' name='dep_move_confirm'>{msgPool type=saveButton}</button>

	<button type='submit' name='cancel_save'>{msgPool type=cancelButton}</button>

</div>
