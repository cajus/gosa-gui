<table summary="{tr}Workstation startup{/tr}" style="width:100%;">
 <tr>
  <td style='width:50%; '>


   <!--
    - Boot parameters 
    -->
   <h3>{tr}Boot parameters{/tr}</h3>
   <table summary="{tr}Boot parameters{/tr}">
    

   <!--
    - Kernel parameters 
    -->
    <tr>
     <td>
      <label for="gotoKernelParameters">{tr}Custom options{/tr}</label>
     </td>
     <td>
      {render acl=$gotoKernelParametersACL}
       <input name="gotoKernelParameters" id="gotoKernelParameters" 
          size=25 maxlength=500 value="{$gotoKernelParameters}"  type='text'
          title="{tr}Enter any parameters that should be passed to the kernel as append line during boot up{/tr}">
      {/render}
     </td>
    </tr>
   </table>

   <!--
    - LDAP servers  
    -->
      <hr><h3><label for="gotoLdapServer">{tr}LDAP server{/tr}</label></h3>
      {render acl=$gotoLdapServerACL}
        {if $member_of_ogroup}
          (<input type='checkbox' name='gotoLdap_inherit' {if $gotoLdap_inherit} checked {/if} value="1"
            onClick="document.mainform.submit();" class='center'>
            &nbsp;{tr}inherit from group{/tr}
          )
        {/if}
      {/render}
      {render acl=$gotoLdapServerACL_inherit}
        {$gotoLdapServers}	
      {/render}

      {render acl=$gotoLdapServerACL_inherit}
        <select name='ldap_server_to_add' id='ldap_server_to_add' size=1>
         {html_options options=$gotoLdapServerList}	
        </select>
      {/render}

      {render acl=$gotoLdapServerACL_inherit}
        <button type='submit' name='add_ldap_server' id="add_ldap_server">
        {msgPool type=addButton}</button>
      {/render}

     </td>
    </tr>
   </table>


<hr>

<table summary="{tr}Boot options{/tr}" style="width:100%;">
 <tr>
  <td style='width:50%; ' class='right-border'>


   <!--
    - Kernel modules
    -->
   <h3>{tr}Kernel modules (format: name parameters){/tr}</h3>
   {render acl=$gotoModulesACL}
    <select style="width:100%; height:100px;" name="modules_list[]" size=15 multiple 
      title="{tr}Add additional modules to load on startup{/tr}">
     {html_options values=$gotoModules output=$gotoModules}
     <option disabled>&nbsp;</option>
    </select>
   {/render}

   <br>
   {render acl=$gotoModulesACL}
    <input type='text' name="module" size=30 align=middle maxlength=30>
   {/render}

   {render acl=$gotoModulesACL}
    <button type='submit' name='add_module'>
   {msgPool type=addButton}</button>
    &nbsp;
   {/render}

   {render acl=$gotoModulesACL}
    <button type='submit' name='delete_module'>
    {msgPool type=delButton}</button>
   {/render}
  </td>
  <td>
   <!--
    - Shares
    -->
   <h3><label for="gotoShare">{tr}Shares{/tr}</label></h3>
    
   {render acl=$gotoShareACL}
    <select style="width:100%;height:100px;" name="gotoShare" multiple size=4 id="gotoShare">
     {html_options values=$gotoShareKeys output=$gotoShares}
     <option disabled>&nbsp;</option>
    </select>
   {/render}

   <br>
   
   {render acl=$gotoShareACL}
    <select name="gotoShareSelection" size=1>
     {html_options values=$gotoShareSelectionKeys output=$gotoShareSelections}
     <option disabled>&nbsp;</option>
    </select>
   {/render}

   {render acl=$gotoShareACL}
    <input type="text" size=15 name="gotoShareMountPoint" value="{tr}Mount point{/tr}">
   {/render}

   {render acl=$gotoShareACL} 
    <button type='submit' name='gotoShareAdd'>
    {msgPool type=addButton}</button>
   {/render}

   {render acl=$gotoShareACL}
    <button type='submit' name='gotoShareDel' {if $gotoSharesCount == 0} disabled {/if}>{tr}Remove{/tr}</button>
   {/render}

  </td>
 </tr>
</table>
<input name="WorkstationStarttabPosted" type="hidden" value="1">

<script language="JavaScript" type="text/javascript">
<!-- // First input field on page
focus_field('gotoLdapServer');
-->
</script>

