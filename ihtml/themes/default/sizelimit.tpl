<h3>{$warning}</h3>
<p>
{tr}The size limit option makes LDAP operations faster and saves the LDAP server from getting too much load. The easiest way to handle big databases without long timeouts would be to limit your search to smaller values and use filters to get the entries you are looking for.{/tr}
</p>

<hr>

<b>{tr}Please choose the way to react for this session{/tr}:</b>
<p>
<input type="radio" name="action" value="ignore">{tr}ignore this error and show all entries the LDAP server returns{/tr}<br>
<input type="radio" name="action" value="limited" checked>{tr}ignore this error and show all entries that fit into the defined size limit{/tr}<br>
<input type="radio" name="action" value="newlimit">{$limit_message}
</p>
<hr>
<div class="plugin-actions">
 <button type='submit' name='set_size_action'>{tr}Set{/tr}</button>
</div>

<input type="hidden" name="ignore">
