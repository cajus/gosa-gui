<h3><input type="checkbox" value="1" name="is_account" {$is_account} {$opengwAccountACL} onClick="document.mainform.submit();">&nbsp;OpenGroupware.org</h3>
<table width="100%" summary="OpenGroupware.org">
	<tr>
		<td width="50%">
			<table summary="OpenGroupware.org">
				<tr>
					<td>
						{tr}Location team{/tr} &nbsp;
					</td>
					<td>
{render acl=$LocationTeamACL}
						<select size="1" id="LocationTeam" name="LocationTeam"
							{if $OGWstate!=""} disabled {/if}>
							{html_options values=$validLocationTeams output=$validLocationTeam selected=$LocationTeam}
						</select>
{/render}
					</td>
				</tr>
				<tr>
					<td>
						{tr}Template user{/tr} &nbsp;
					</td>
					<td>
{render acl=$TemplateUserACL}
						<select size="1" id="TemplateUser" name="TemplateUser" {if $OGWstate!=""} disabled {/if}>
							{html_options values=$validTemplateUsers output=$validTemplateUser selected=$TemplateUser}
						</select>
{/render}
					</td>
				</tr>	
				<tr>
					<td valign="top">
						{tr}Locked{/tr} &nbsp; 
					</td>
					<td valign="top">
{render acl=$LockedACL}
						<input type="checkbox" value="1" name="is_locked" {$is_lockedCHK}  
						   {if $OGWstate!=""} disabled {/if}>
{/render}
					</td>
				</tr>
			</table>
		</td>
		<td class='left-border'>

			<table summary="OpenGroupware.org">
				<tr>
					<td valign="top">
						{tr}Teams{/tr} &nbsp; 
					</td>
					<td valign="top">
{render acl=$TeamsACL}
						{$validTeams}	
{/render}
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
