<div class='default'>
	<p>
		<b>{tr}Create your configuration file{/tr}</b>
	</p>
	<p>	
		{$msg2}
	</p>

      {if $webgroup == ""}
{tr}Depending on the user name your web server is running on:{/tr}
<tt>
<pre> chown root:www-data {$CONFIG_DIR}/{$CONFIG_FILE}
 chmod 640 {$CONFIG_DIR}/{$CONFIG_FILE}

or

 chown root:apache {$CONFIG_DIR}/{$CONFIG_FILE}
 chmod 640 {$CONFIG_DIR}/{$CONFIG_FILE}
</pre>
{else}
<pre>
 chown root:{$webgroup} {$CONFIG_DIR}/{$CONFIG_FILE}
 chmod 640 {$CONFIG_DIR}/{$CONFIG_FILE}
</pre>
{/if} 
	<p>	
		<button type='submit' name='getconf'>{tr}Download configuration{/tr}</button>

	</p>
		{if $err_msg != ""}
			<hr>
			<br>
			{tr}Status: {/tr}
			<a style='color:red ; font-weight:bold '>{$err_msg}</a>
		{/if}

</div>
<input type='hidden' value='1' name='step8_posted'>
