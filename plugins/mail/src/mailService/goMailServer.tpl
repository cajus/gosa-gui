<h3>{tr}Generic{/tr}</h3>

<table  style="width:100%;" summary="{tr}Mail settings{/tr}">
	<tr>
		<td>

			<table summary="{tr}Generic settings{/tr}">
				<tr>
					<td>{tr}Visible fully qualified host name{/tr}</td>
					<td>
{render acl=$postfixMyhostnameACL}
						<input type="text" name='postfixMyhostname' value='{$postfixMyhostname}' title='{tr}The fully qualified host name.{/tr}'>
{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Max mail header size{/tr}
					</td>
					<td>
{render acl=$postfixMyhostnameACL}
						<input type="text" name='postfixHeaderSizeLimit' value='{$postfixHeaderSizeLimit}' 
									title='{tr}This value specifies the maximal header size.{/tr}'>&nbsp;{tr}KB{/tr}
{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Max mailbox size{/tr}
					</td>
					<td>
{render acl=$postfixMailboxSizeLimitACL}
						<input type="text" name='postfixMailboxSizeLimit' value='{$postfixMailboxSizeLimit}' 
									title='{tr}Defines the maximal size of mail box.{/tr}'>&nbsp;{tr}KB{/tr}
{/render}					</td>
				</tr>
				<tr>
					<td>{tr}Max message size{/tr}
					</td>
					<td>
{render acl=$postfixMessageSizeLimitACL}
						<input type="text" name='postfixMessageSizeLimit' value='{$postfixMessageSizeLimit}' 
									title='{tr}Specify the maximal size of a message.{/tr}'>&nbsp;{tr}KB{/tr}
{/render}
					</td>
				</tr>
				<tr>
					<td>{tr}Relay host{/tr}
					</td>
					<td>
{render acl=$postfixRelayhostACL}
						<input type="text" name='postfixRelayhost' value='{$postfixRelayhost}' 
									title='{tr}Relay messages to following host:{/tr}'>
{/render}
					</td>
				</tr>
			</table>
		</td>
		<td class='left-border'>

			<table summary="{tr}Network settings{/tr}">
				<tr>
					<td>
						{tr}Local networks{/tr}<br>
{render acl=$postfixMyNetworksACL}
						<select name='Select_postfixMyNetworks[]' multiple size=6 style='width:100%;' title='{tr}Postfix networks{/tr}'>
							{html_options options=$postfixMyNetworks}
						</select>
{/render}
{render acl=$postfixMyNetworksACL}
						<input type="text" name="NewString_postfixMyNetworks" value="">
{/render}
{render acl=$postfixMyNetworksACL}
						<button type='submit' name='AddpostfixMyNetworks'>{msgPool type=addButton}</button>

{/render}
{render acl=$postfixMyNetworksACL}
						<button type='submit' name='DelpostfixMyNetworks'>{tr}Remove{/tr}</button>

{/render}
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<hr>
			<h3>{tr}Domains and routing{/tr}</h3>
		</td>
	</tr>	
	<tr>
		<td>
			<table summary="{tr}Domains and routing{/tr}">
                <tr>
                    <td>
                        {tr}Domains to accept mail for{/tr}<br>
{render acl=$postfixMyDestinationsACL}
                        <select name='Select_postfixMyDestinations[]' multiple size=6 style='width:100%;' title='{tr}Postfix is responsible for the following domains:{/tr}'>
{/render}
                            {html_options options=$postfixMyDestinations}
                        </select>
{render acl=$postfixMyDestinationsACL}
                        <input type="text" name="NewString_postfixMyDestinations" value="">
{/render}
{render acl=$postfixMyDestinationsACL}
                        <button type='submit' name='AddpostfixMyDestinations'>{msgPool type=addButton}</button>

{/render}
{render acl=$postfixMyDestinationsACL}
                        <button type='submit' name='DelpostfixMyDestinations'>{tr}Remove{/tr}</button>

{/render}
                    </td>
                </tr>
            </table>
		</td>
		<td class='left-border'>

			  <table style="width:100%;" summary="{tr}Transports{/tr}">
                <tr>
                    <td>
                        {tr}Transports{/tr}<br>
{render acl=$postfixTransportTableACL}
						{$postfixTransportTableList}
{/render}

{render acl=$postfixTransportTableACL}
                        <input type="text" name="Source_postfixTransportTable" value="">
{/render}
{render acl=$postfixTransportTableACL}
                        <select name='TransportProtocol' title='{tr}Select a transport protocol.{/tr}' size=1>
                            {html_options options=$TransportProtocols}
                        </select>
{/render}
{render acl=$postfixTransportTableACL}
                        <input type="text" name="Destination_postfixTransportTable" value="">
{/render}
{render acl=$postfixTransportTableACL}
                        <button type='submit' name='AddpostfixTransportTable'>{msgPool type=addButton}</button>

{/render}
                    </td>
                </tr>
            </table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<hr>
			<h3>{tr}Restrictions{/tr}</h3>
		</td>
	</tr>	
	<tr>
		<td>
            <table style="width:100%;" summary="{tr}Restrictions for sender{/tr}">
                <tr>
                    <td>
                        {tr}Restrictions for sender{/tr}<br>
{render acl=$postfixSenderRestrictionsACL}
						{$postfixSenderRestrictionsList}
{/render}
{render acl=$postfixSenderRestrictionsACL}
                        <input type="text" name="Source_postfixSenderRestrictions" value="">
{/render}
{render acl=$postfixSenderRestrictionsACL}
                        <select name='SenderRestrictionFilter' title='{tr}Restriction filter{/tr}' size=1>
                            {html_options options=$RestrictionFilters}
                        </select>
{/render}
{render acl=$postfixSenderRestrictionsACL}
                        <input type="text" name="Destination_postfixSenderRestrictions" value="">
{/render}
{render acl=$postfixSenderRestrictionsACL}
                        <button type='submit' name='AddpostfixSenderRestrictions'>{msgPool type=addButton}</button>

{/render}
                    </td>
                </tr>
            </table>
		</td>
		<td class='left-border'>

            <table style="width:100%;" summary="{tr}Restrictions for recipient{/tr}">
                <tr>
                    <td>
                        {tr}Restrictions for recipient{/tr}<br>
{render acl=$postfixRecipientRestrictionsACL}
						{$postfixRecipientRestrictionsList}
{/render}
{render acl=$postfixRecipientRestrictionsACL}
                        <input type="text" name="Source_postfixRecipientRestrictions" value="">
{/render}
{render acl=$postfixRecipientRestrictionsACL}
                        <select name='RecipientRestrictionFilter' title='{tr}Restriction filter{/tr}' size=1>
                            {html_options options=$RestrictionFilters}
                        </select>
{/render}
{render acl=$postfixRecipientRestrictionsACL}
                        <input type="text" name="Destination_postfixRecipientRestrictions" value="">
{/render}
{render acl=$postfixRecipientRestrictionsACL}
                        <button type='submit' name='AddpostfixRecipientRestrictions'>{msgPool type=addButton}</button>

{/render}
                    </td>
                </tr>
            </table>
		</td>
	</tr>	
</table>

<hr>
<br>
<h3>Action</h3>
{if $is_new == "new"}
	{tr}The server must be saved before you can use the status flag.{/tr}
{elseif !$is_acc}
	{tr}The service must be saved before you can use the status flag.{/tr}
{/if}
<br>
<select name="action" title='{tr}Set new status{/tr}' 
	{if $is_new == "new" || $is_acc == false} disabled {/if}
>
	<option value="none">&nbsp;</option>
	{html_options options=$Actions}	
</select>
<button type='submit' name='ExecAction' title="{tr}Set status{/tr}"
	{if $is_new == "new" || $is_acc == false} disabled {/if}
>{tr}Execute{/tr}</button>

<hr>

<div class="plugin-actions">
    <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
    <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>

