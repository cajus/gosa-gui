
<div style="font-size:18px;">
 {image path="images/warning.png" align="top"}&nbsp;{tr}Warning{/tr}
</div>
<p>
 {$warning}{tr}This includes 'all' DHCP subsections that are located within this section. Please double check if your really want to do this since there is no way for GOsa to get your data back.{/tr}
</p>
<p>{tr}Best thing to do before performing this action would be to save the current contents of your LDAP tree in a file. So - if you've done so - press 'Delete' to continue or 'Cancel' to abort.{/tr}
</p>
<hr>
<div class="plugin-actions">
 <button type='submit' name='delete_dhcp_confirm'>{msgPool type=delButton}</button>
 <button type='submit' name='cancel_section'>{msgPool type=cancelButton}</button>
</div>
