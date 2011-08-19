<h3>{tr}Raw LDAP entry{/tr}</h3>
<hr>

{if $success}
<pre>
{$ldif}
</pre>
{else}
  <p>{msgPool type=ldapError err=$error}</p>
{/if}
<hr>
<div class="plugin-actions">
    <button name='cancelLdifViewer'>{msgPool type='cancelButton'}</button>
</div>
