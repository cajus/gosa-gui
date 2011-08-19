<h3>{tr}Import jobs{/tr}</h3>
<p>
{tr}You can import a list of jobs into the GOsa job queue. This should be a semicolon separated list of items in the following format:{/tr}
</p>
<i>{tr}time stamp{/tr} ; {tr}MAC-address{/tr} ; {tr}job type{/tr} ; {tr}object group{/tr} [ ; {tr}import base{/tr} ; {tr}full host name{/tr} ; {tr}IP address{/tr} ; {tr}DHCP group{/tr} ]</i>
<br>
<br>
{if !$count}
{tr}Example{/tr}:
<br>
20080626162556 <b>;</b> 00:0C:29:99:1E:37 <b>;</b> job_trigger_activate_new <b>;</b> goto-client <b>;</b> dc=test,dc=gonicus,dc=de
<br>
<br>
{/if}

<hr>
&nbsp;
<table summary="{tr}Goto import{/tr}">
	<tr>	
		<td>
			{tr}Select list to import{/tr}
		</td>
		<td>
			<input type='file' name='file' value="{tr}Browse{/tr}">
			<button type='submit' name='import'>{tr}Upload{/tr}</button>

		</td>
	</tr>
</table>

	{if  $count}
		<hr>
		<br>
		<br>
		<div style='width:100%; height:300px; overflow: scroll;'>
		<table style='width:100%; background-color: #CCCCCC; ' summary="{tr}Import summary{/tr}">

			<tr>
				<td><b>{tr}Time stamp{/tr}</b></td>
				<td><b>{tr}MAC{/tr}</b></td>
				<td><b>{tr}Event{/tr}</b></td>
				<td><b>{tr}Object group{/tr}</b></td>
				<td><b>{tr}Base{/tr}</b></td>
				<td><b>{tr}FQDN{/tr}</b></td>
				<td><b>{tr}IP{/tr}</b></td>
				<td><b>{tr}DHCP{/tr}</b></td>
			</tr>
		{foreach from=$info item=item key=key}
			{if $item.ERROR}
				<tr style='background-color: #F0BBBB;'>
					<td>{$item.TIMESTAMP}</td>
					<td>{$item.MAC}</td>
					<td>{$item.HEADER}</td>
					<td>{$item.OGROUP}</td>
					<td>{$item.BASE}</td>
					<td>{$item.FQDN}</td>
					<td>{$item.IP}</td>
					<td>{$item.DHCP}</td>
				</tr>	
				<tr style='background-color: #F0BBBB;'>
					<td colspan="7"><b>{$item.ERROR}</b></td>
				</tr>
			{else}
				{if ($key % 2)}
					<tr class="rowxp0"> 
				{else}
					<tr class="rowxp1"> 
				{/if}
					<td>{$item.TIMESTAMP}</td>
					<td class='left-border'>{$item.MAC}
</td>
					<td class='left-border'>{$item.HEADER}
</td>
					<td class='left-border'>{$item.OGROUP}
</td>
					<td class='left-border'>{$item.BASE}
</td>
					<td class='left-border'>{$item.FQDN}
</td>
					<td class='left-border'>{$item.IP}
</td>
					<td class='left-border'>{$item.DHCP}
</td>
				</tr>
			{/if}
		{/foreach}
		</table>
		</div>
	{/if}
<br>
<hr>
<div style='text-align:right;width:99%; padding-right:5px; padding-top:5px;'>
	<button type='submit' name='start_import'>{tr}Import{/tr}</button>&nbsp;

	<button type='submit' name='import_abort'>{msgPool type=backButton}</button>

</div>
<br>
