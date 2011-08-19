{if !$init_successfull}
<br>
<b>{msgPool type=siError}</b><br>
{tr}Check if the GOsa support daemon (gosa-si) is running.{/tr}&nbsp;
<button type='submit' name='retry_init'>{tr}Retry{/tr}</button>

<br>
<br>
{else}

<!-- GENERIC -->
<h3>{tr}License usage{/tr}</h3>

{$licenseUses}

<input name='opsiLicenseUsagePosted' value='1' type='hidden'>
{/if}
