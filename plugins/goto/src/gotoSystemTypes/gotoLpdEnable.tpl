{if !$is_account}

<table style='width:100%;' summary="{tr}Printer settings{/tr}">
	<tr>
		<td style='width:55%;'>
      {render acl=$acl}
      <input class="center" type='checkbox' onChange="document.mainform.submit();" 
        {if $is_account} checked {/if}
        name='gotoLpdEnable_enabled'>&nbsp;{tr}Enable printer settings{/tr}</td>
      {/render}
		</td>
	</tr>
</table>
{else}
<table style='width:100%;' summary="{tr}Generic settings{/tr}">
	<tr>
		<td>
			<table summary="{tr}Generic settings{/tr}">
				<tr>
					<td colspan="2">
						{render acl=$acl}
						<input class="center" type='checkbox' onChange="document.mainform.submit();" 
							{if $is_account} checked {/if}
							name='gotoLpdEnable_enabled'>&nbsp;{tr}Enable printer settings{/tr}</td>
						{/render}
					</TD>
				</tr>
				<tr>
					<td>{tr}Type{/tr}</td>
					<td>	
						{render acl=$acl}
						<select name='s_Type'  onChange="document.mainform.submit();" size=1>
							{html_options options=$a_Types selected=$s_Type}
						</select>
						{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Device{/tr}</td>
					<td>	
						{render acl=$acl}
						<input type='text' name='s_Device' value='{$s_Device}'>
						{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Port{/tr}</td>
					<td>
						{render acl=$acl}
						<input type='text' name='i_Port' value='{$i_Port}'>
						{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Options{/tr}</td>
					<td>
						{render acl=$acl}
						<input type='text' name='s_Options' value='{$s_Options}'>
						{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Write only{/tr}</td>
					<td>
						{render acl=$acl}
						<input {if $s_WriteOnly == "Y"} checked {/if} type='checkbox' name='s_WriteOnly' value='Y' >
						{/render}
					</td>
				</tr>
			</table>
		</td>
		<td>
{if $s_Type == "S"}
			<table summary="{tr}Generic settings{/tr}">
				<tr>
					<td>{tr}Bit rate{/tr}</td>
					<td>
						{render acl=$acl}
						<select name='s_Speed' size=1>
							{html_options options=$a_Speeds selected=$s_Speed}
						</select>
						{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Flow control{/tr}</td>
					<td>
						{render acl=$acl}
						<select name='s_FlowControl' size=1>
							{html_options options=$a_FlowControl selected=$s_FlowControl}
						</select>
						{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Parity{/tr}</td>
					<td>
						{render acl=$acl}
						<select name='s_Parity' size=1>
							{html_options options=$a_Parities selected=$s_Parity}
						</select>
						{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Bits{/tr}</td>
					<td>
						{render acl=$acl}
						<select name='i_Bit' size=1>
							{html_options options=$a_Bits selected=$i_Bit}
						</select>
						{/render}
					</td>
				</tr>
			</table>
{/if}
		</td>
	</tr>
</table>
{/if}
<input type='hidden' name="gotoLpdEnable_entry_posted" value="1">
