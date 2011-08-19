<table width="100%" summary="{tr}Macro{/tr}">
  <tr>
    <td>
   			<table summary="{tr}Macro generic{/tr}">
     			<tr>
      				<td><LABEL for="cn">{tr}Macro name{/tr}</LABEL>{$must}</td>
      				<td>
{render acl=$cnACL}
					<input type='text' name="cn" id="id" size=13 maxlength=13 value="{$cn}" title="{tr}Macro name{/tr}">
{/render}
				</td>
    			</tr>
    			<tr>
     				<td><LABEL for="displayName">{tr}Display name{/tr}</LABEL>{$must}</td>
     				<td>
{render acl=$displayNameACL}
        				<input name="displayName" id="displayName" size=35 maxlength=60 value="{$displayName}" type='text' 
						title="{tr}Macro name to be displayed{/tr}">
{/render}
     				</td>
    			</tr>
    			<tr>
					<td colspan=2>
					</td>
				</tr>
    			<tr>
      				<td><LABEL for="base">{tr}Base{/tr}</LABEL>{$must}</td>
      				<td>
					{render acl=$baseACL}
                                          {$base}
					{/render}
		      		</td>
	     		</tr>
   			</table>
		</td>
		<td class='left-border'>
		     &nbsp;
		</td>
		<td>
			<table summary="{tr}Visibility{/tr}">
    			<tr>
     				<td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
     				<td>
{render acl=$descriptionACL}
      					<input type='text' name="description" id="description" size=35 maxlength=80 value="{$description}">
{/render}
     				</td>
    			</tr>
    			<tr>
     				<td colspan=2>
{render acl=$goFonMacroVisibleACL}
      					<input type="checkbox" name="goFonMacroVisible" size=35 maxlength=60 value="1" 
						{$goFonMacroVisibleChecked}> {tr}Visible for user{/tr}
{/render}
     				</td>
    			</tr>
			</table>
		</td>
	</tr>
</table>
<hr>
<br>
{tr}Macro text{/tr}
<br>
{render acl=$goFonMacroContentACL}
<textarea id='goFonMacroContent' name="goFonMacroContent" style="width:99%;height:300px;font-size:14px;font-family:Arial;">{$goFonMacroContent}</textarea>
{/render}

<input type='hidden' name='gofonMacroGenericPosted' value='1'>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
