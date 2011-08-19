<h3>{tr}Schema specific settings{/tr}</h3>

{if !$checkFailed}
 <font style="color:green">{tr}Schema check succeeded{/tr}</font>
{else}
 <img alt='' src='images/small_warning.png' class='center'>
 <font style="color:red">{tr}Schema check failed{/tr}</font>

 {if $ocCount == 0}
  <p>
   {tr}Could not read any schema information, all checks skipped. Adjust your LDAP ACLs.{/tr}
   {if !$database_initialised}
    {tr}It seems that your LDAP database wasn't initialized yet. This maybe the reason, why GOsa can't read your schema configuration!{/tr}
   {/if}
  </p>
 {else}
  {$message}
 {/if}
{/if}


<input type='hidden' value='1' name='step7_posted'>
