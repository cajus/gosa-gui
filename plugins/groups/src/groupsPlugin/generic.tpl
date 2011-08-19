{if $multiple_support}
<input type="hidden" value="1" name="group_mulitple_edit">
{/if}


<table summary="" style="width:100%;">
 <tr>
  <td style="width:50%">
   <table summary="" style="width:100%">
    <tr>
     <td><LABEL for="cn">{tr}Group name{/tr}</LABEL>{$must}</td>
     <td>
{if $multiple_support}
	<input type='text' id="dummy1" name="dummy1" size=25 maxlength=60 value="{tr}Multiple edit{/tr}" disabled>
{else}
{render acl=$cnACL}
       <input type='text' id="cn" name="cn" size=25 maxlength=60 value="{$cn}" title="{tr}POSIX name of the group{/tr}">
{/render}
{/if}
     </td>
    </tr>
    <tr>
     <td>
      <LABEL for="description">{tr}Description{/tr}</LABEL>
     </td>
     <td>
{render acl=$descriptionACL checkbox=$multiple_support checked=$use_description}
      <input type='text' id="description" name="description" size=40 maxlength=80 value="{$description}" title="{tr}Descriptive text for this group{/tr}">
{/render}
     </td>
    </tr>
    <tr>
     <td colspan=2> 
      <div style="height:15px;"></div> 
     </td>
    </tr>
    <tr>
     <td>
      <LABEL for="base">{tr}Base{/tr}</LABEL>{$must}
     </td>
     <td>
{render acl=$baseACL checkbox=$multiple_support checked=$use_base}
       {$base}
{/render}
     </td>
    </tr>
    <tr>
      <td colspan=2><hr></td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
{if $multiple_support}

{else}
    <tr>
     <td colspan=2>
{render acl=$gidNumberACL}
      <input type=checkbox name="force_gid" value="1" title="{tr}Normally IDs are auto-generated, select to specify manually{/tr}" 
	{$force_gid} onclick="changeState('gidNumber')">
{/render}
	<LABEL for="gidNumber">{tr}Force GID{/tr}</LABEL>
      &nbsp;
{render acl=$gidNumberACL}
      <input type='text' name="gidNumber" size=9 maxlength=9 id="gidNumber" {$forceMode} value="{$gidNumber}" title="{tr}Forced ID number{/tr}">
{/render}
     </td>
    </tr>
{/if}

{if $multiple_support}
    <tr>
    <td colspan=2>
		{render acl=$sambaGroupTypeACL checkbox=$multiple_support checked=$use_smbgroup}
			<input class="center" type=checkbox name="smbgroup" value="1" {$smbgroup}>{tr}Select to create a samba conform group{/tr}
		{/render}
	</td>
	</tr>
	<tr>
	<td colspan=2>
		{render acl=$sambaGroupTypeACL checkbox=$multiple_support checked=$use_groupType}
			<select size="1" name="groupType">
				{html_options options=$groupTypes selected=$groupType}
			</select>
		{/render}
      &nbsp;
      <LABEL for="">{tr}in domain{/tr}</LABEL>
      &nbsp;

		{render acl=$sambaDomainNameACL checkbox=$multiple_support checked=$use_sambaDomainName}
			<select id="sambaDomainName" size="1" name="sambaDomainName">
		   		{html_options values=$sambaDomains output=$sambaDomains selected=$sambaDomainName}
		  	</select>
		{/render}
	</td>
	</tr>

{else}
    <tr>
     <td colspan=2>
{render acl=$sambaGroupTypeACL}
      <input type=checkbox name="smbgroup" value="1" {$smbgroup}  title="{tr}Select to create a samba conform group{/tr}">
{/render}
{render acl=$sambaGroupTypeACL}
      <select size="1" name="groupType">
       {html_options options=$groupTypes selected=$groupType}
      </select>
{/render}
      &nbsp;
      <LABEL for="">{tr}in domain{/tr}</LABEL>
      &nbsp;
{render acl=$sambaDomainNameACL}
      <select id="sambaDomainName" size="1" name="sambaDomainName">
       {html_options values=$sambaDomains output=$sambaDomains selected=$sambaDomainName}
      </select>
{/render}
     </td>
    </tr>
    {/if}

	{if $pickupGroup == "true"}
    <tr>
      <td colspan=2><hr></td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
    <tr>
     <td colspan=2>
{render acl=$fonGroupACL checkbox=$multiple_support checked=$use_fon_group}
      <input class="center" type=checkbox name="fon_group" value="1" {$fon_group}>{tr}Members are in a phone pickup group{/tr}
{/render}
     </td>
    </tr>
	{/if}
	{if $nagios == "true"}
    <tr>
      <td colspan=2><hr></td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
    <tr>
     <td colspan=2>
{render acl=$nagiosGroupACL checkbox=$multiple_support checked=$use_nagios_group}
      <input class="center" type=checkbox name="nagios_group" value="1" {$nagios_group}>{tr}Members are in a Nagios group{/tr}
{/render}
     </td>
    </tr>
	{/if}
    <tr>
      <td colspan=2><hr></td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
    <tr>
      <td colspan=2>{$trustModeDialog}</td>
    </tr>
   </table>

  </td>
  <td class='left-border'>

   &nbsp;
  </td>

  <td>

   <table summary="" style="width:100%">
    <tr>
     <td style="width:50%">

      {if $restrictedByDynGroup}
        <b>{tr}The group members are part of a dyn-group and cannot be managed!{/tr}</b>
        {if $multiple_support}
            {render acl=$memberUidACL}
                {$commonList}
            {/render}
        {else}
            {render acl=$memberUidACL}
                {$memberList}
            {/render}
        {/if}
      {else}

        {if $multiple_support}
            <h3>{tr}Common group members{/tr}</h3>
            {render acl=$memberUidACL}
                {$commonList}
            {/render}
            {render acl=$memberUidACL}
              <button type='submit' name='edit_membership'>{msgPool type=addButton}</button>
            {/render}
            
            <br>
            <h3>{tr}Partial group members{/tr}</h3>
            {render acl=$memberUidACL}
                {$partialList}
            {/render}
        {else}
            <h3>{tr}Group members{/tr}</h3>
            {render acl=$memberUidACL}
                {$memberList}
            {/render}
            {render acl=$memberUidACL}
              <button type='submit' name='edit_membership'>{msgPool type=addButton}</button>
            {/render}
        {/if}
      {/if}
     </td>
    </tr> 
   </table>
  </td>

 </tr>
</table>

<input type="hidden" name="groupedit" value="1">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
