<h3>{tr}Advanced phone settings{/tr}</h3>

<table summary="{tr}Advanced phone settings{/tr}" style="width:100%" border=0>
	<tr>
		<td colspan="2">
		<LABEL for="selected_category">{tr}Phone type{/tr}</LABEL>{$must}
{render acl=$categoryACL}
		<select id="selected_category" size="1" name="selected_category" title="{tr}Choose a phone type{/tr}" onchange="mainform.submit();">
			{html_options options=$categorys selected=$selected_category}
		</select>
{/render}
		{if $javascript eq 'false'}
			<button type='submit' name='refresh'>{tr}refresh{/tr}</button>

		{/if}
		<br>
		<br>
	</td>
	</tr>
{if $selected_category eq '0'}
	<tr>
		<td style='width:50%; ' class='right-border'>

			<table summary="{tr}Generic settings{/tr}" border=0>
			 <tr>
				<td>
					<LABEL for="goFonType">{tr}Mode{/tr}</LABEL>{$must}
					
				</td>
				<td>
{render acl=$goFonTypeACL}
					<select id="goFonType" size="1" name="goFonType" title="{tr}Choose a phone type{/tr}" style="width:200px;" {$goFonTypeUSED}>
						{html_options options=$goFonTypes selected=$goFonType}
					</select>
{/render}
				</td>
			 </tr>
			 <tr>
				<td >
					<LABEL for="goFonDmtfMode">{tr}DTMF mode{/tr}</LABEL>
				</td>
				<td>
{render acl=$goFonDmtfModeACL}
					<select size="1" id="goFonDmtfMode" name="goFonDmtfMode" title="{tr}Choose a phone type{/tr}" style="width:200px;" {$goFonDmtfModeUSED}>
						{html_options options=$goFonDmtfModes selected=$goFonDmtfMode}
					</select>
{/render}
				</td>
			</tr>
		</table>
	   </td>
	   <td>
		<table summary="{tr}Additional settings{/tr}" border=0>
			<tr>
				<td >
					<LABEL for="goFonDefaultIP">{tr}Default IP{/tr}</LABEL>
				</td>
                <td>
{render acl=$goFonDefaultIPACL}
                    <select id="goFonDefaultIP" size="1" name="goFonDefaultIP" title="{tr}Choose a phone type{/tr}" style="width:200px;" >
                        {html_options options=$goFonDefaultIPs selected=$goFonDefaultIP}
                    </select>
{/render}
                   </td>
			</tr>
			<tr>
				<td >
					<LABEL for="goFonQualify">{tr}Response timeout{/tr}</LABEL>
				</td>
				<td>
{render acl=$goFonQualifyACL}
					<input type='text' id="goFonQualify" style="width:200px" name="goFonQualify" value="{$goFonQualify}" {$goFonQualifyUSED}>
{/render}
				</td>
			</tr>
			</table>
		</td>
	 </tr>
</table>
{/if}

{if $selected_category eq '1'}
		
	<tr>
		<td style='width:50%; ' class='right-border'>

			<table summary="{tr}Advanced phone settings{/tr}" width="100%">
			 <tr>
				<td>
					<LABEL for="goFonType">{tr}Modus{/tr}{$must}</LABEL>
				</td>
				<td >
{render acl=$goFonTypeACL}
					<select size="1" id="goFonType" name="goFonType" title="{tr}Choose a phone type{/tr}" style="width:200px;" {$goFonTypeUSED}>
						{html_options options=$goFonTypes selected=$goFonType}
					</select>
{/render}
				</td>
			 </tr>
			<tr>
				<td >
					<LABEL for="goFonDefaultIP">{tr}Default IP{/tr}</LABEL>
				</td>
				<td>
{render acl=$goFonDefaultIPACL}
					<input type='text' id="goFonDefaultIP" style="width:200px" name="goFonDefaultIP" value="{$goFonDefaultIP}" {$goFonDefaultIPUSED}>
{/render}
				</td>
			</tr>
			<tr>
				<td >
					<LABEL for="goFonQualify">{tr}Response timeout{/tr}</LABEL>
				</td>
				<td>
{render acl=$goFonQualifyACL}
					<input type='text' id="goFonQualify" style="width:200px" name="goFonQualify" value="{$goFonQualify}" {$goFonQualifyUSED}>
{/render}
				</td>
			</tr>
			<tr>
				<td colspan=2>
					&nbsp;					
				</td>
			</tr>
			<tr>
				<td>
					<LABEL for="goFonAuth">{tr}Authentication type{/tr}</LABEL>
				</td>
				<td>
{render acl=$goFonAuthACL}
					<select size="1" id="goFonAuth" name="goFonAuth" title="{tr}Choose a phone type{/tr}" style="width:200px;" {$goFonAuthUSED}>
						{html_options options=$goFonAuths selected=$goFonAuth}
					</select>
{/render}
				</td>
			</tr>
			<tr>
				<td>	
					 <LABEL for="goFonSecret">{tr}Secret{/tr}</LABEL>
				</td>
				<td>
{render acl=$goFonSecretACL}
					<input type='text' id="goFonSecret" style="width:200px" name="goFonSecret" value="{$goFonSecret}" {$goFonSecretUSED}>
{/render}
				</td>
			</tr>
<!--			<tr>
				<td>
					 GoFonInkeys
				</td>
				<td>
					<input type='text' style="width:200px" name="goFonInkeys" value="{$goFonInkeys}" {$goFonInkeysUSED}>
				</td>
			</tr>
			<tr>
				<td>
					 GoFonOutKeys
				</td>
				<td>
					<input type='text' style="width:200px" name="goFonOutkey" value="{$goFonOutkey}" {$goFonOutkeyUSED}>
				</td>
			</tr> -->
			<tr>
                <td colspan=2>
					&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <LABEL for="goFonAccountCode">{tr}Account code{/tr}</LABEL>
                </td>
                <td>
{render acl=$goFonAccountCodeACL}
                    <input type='text' id="goFonAccountCode" style="width:200px" name="goFonAccountCode" value="{$goFonAccountCode}" {$goFonAccountCodeUSED}>
{/render}
                </td>
            </tr>
            <tr>
                <td>
                    <LABEL for="goFonTrunk">{tr}Trunk lines{/tr}</LABEL>
                </td>
                <td>
{render acl=$goFonTrunkACL}
                     <select size="1" id="goFonTrunk" name="goFonTrunk" title="{tr}Choose a phone type{/tr}" {$goFonTrunkUSED}>
                        {html_options options=$goFonTrunks selected=$goFonTrunk}
                     </select>
{/render}
                 </td>
            </tr>

			</table>
		</td>
		<td>

			 <table summary="{tr}Permissions{/tr}" width="100%">
               <tr>
                    <td>

                        <LABEL for="goFonPermitS">{tr}Hosts that are allowed to connect{/tr}</LABEL><br>
{render acl=$goFonPermitACL}
                        <select id="goFonPermitS" style="width:100%; height:80px;" name="goFonPermitS" size=15
                            multiple title="{tr}List of alternative mail addresses{/tr}">
                            {html_options values=$goFonPermit output=$goFonPermit}
                            <option disabled>&nbsp;</option>
                        </select>
{/render}
                        <br>
{render acl=$goFonPermitACL}
                            <input type='text' name="goFonPermitNew" size=30 align="middle" maxlength="65" value="">
{/render}
{render acl=$goFonPermitACL}
                        <button type='submit' name='goFonPermitAdd'>{msgPool type=addButton}</button>

{/render}
{render acl=$goFonPermitACL}
                        <button type='submit' name='goFonPermitDel'>{msgPool type=delButton}</button>

{/render}
						<br><br>
                    </td>
                </tr>
				<tr>
                    <td>

             	        <LABEL for="goFonDenyS">{tr}Hosts that are not allowed to connect{/tr}</LABEL><br>
{render acl=$goFonDenyACL}
                        <select id="goFonDenyS" style="width:100%; height:80px;" name="goFonDenyS" size=15
                            multiple title="{tr}List of alternative mail addresses{/tr}">
                            {html_options values=$goFonDeny output=$goFonDeny}
                            <option disabled>&nbsp;</option>
                        </select>
{/render}
                        <br>
{render acl=$goFonDenyACL}
                            <input type='text' name="goFonDenyNew" size=30 align="middle" maxlength="65" value="">
{/render}
{render acl=$goFonDenyACL}
                        <button type='submit' name='goFonDenyAdd'>{msgPool type=addButton}</button>

{/render}
{render acl=$goFonDenyACL}
                        <button type='submit' name='goFonDenyDel'>{msgPool type=delButton}</button>

{/render}
                    </td>
                </table>
    </tr>
</table>
{/if}

{if $selected_category eq '2'}
	<tr>
		<td style="width:50%">
			<table summary="{tr}Advanced phone settings{/tr}" width="100%">
				<tr>
					<td>
						<LABEL for="goFonMSN">{tr}MSN{/tr}</LABEL>&nbsp;
{render acl=$goFonMSNACL}
						<input type='text' id="goFonMSN" style="width:200px" name="goFonMSN" value="{$goFonMSN}" {$goFonMSNUSED}>
{/render}
					</td>
				</tr>
			</table>
		</td>
		<td>
			&nbsp;
		</td>
	</tr>
</table>
{/if}
