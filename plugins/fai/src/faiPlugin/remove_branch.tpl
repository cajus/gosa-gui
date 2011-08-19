
<div style="font-size:18px;">
 {image path="images/warning.png" align="top"}&nbsp;{tr}Warning{/tr}
</div>
<p>
 {$info}{tr}This includes all account data, system access, etc. for this branch. Please double check if your really want to do this since there is no way for GOsa to get your data back.{/tr}
</p>
<p>{tr}So - if you're sure - press 'Delete' to continue or 'Cancel' to abort.{/tr}
</p>
<input type='hidden' name='release_hidden' value='{$release_hidden}'>
<hr>
<div class="plugin-actions">
 <button type='submit' name='delete_branch_confirm'>
 {msgPool type=delButton}</button>
 <button type='submit' name='delete_cancel'>
 {msgPool type=cancelButton}</button>
</div>