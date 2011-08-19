<h3>{tr}Personal information{/tr}</h3>

<table summary="{tr}Personal information{/tr}">
 <tr>
  <td>

   <!-- The users picture settings container -->
   <table summary="{tr}The users picture{/tr}">
    <tr>
     <td style='width:147px; height:200px; background-color:gray; vertical-align: middle;' >
      {if !$userPicture_is_readable}
      <img  src="plugins/users/html/images/default.jpg" alt=''>
      {else}
      <img  src="getbin.php?rand={$rand}" alt='' style='max-width:147px; max-height: 200px; vertical-align: middle;' >
      {/if}
     </td>
    </tr>
    <tr>
     <td>
      {render acl=$userPictureACL checkbox=$multiple_support checked=$use_edit_picture}
      <button type="submit" name="edit_picture">{tr}Change picture{/tr}...</button>
      {/render}
     </td>
    </tr>
   </table>
  <!-- /The users picture settings container -->

  </td> 
  <td style='width:45%'>

   {if $is_template ne "true"}

   <!-- The users personal settings container -->
   <table summary="{tr}Account settings{/tr}"> 
    <tr>
     <td>
      <label for="sn">{tr}Last name{/tr}{$must}</label>
     </td>
     <td>
      {if $multiple_support}
       <input type="text" id="sn" name="dummy2" maxlength=60 value="{tr}Multiple edit{/tr}" disabled>
      {else}
       {render acl=$snACL}
        <input type="text" id="sn" name="sn" maxlength=60 value="{$sn}">
       {/render}
      {/if}
     </td>
    </tr>
    <tr>
     <td>
      <label for="givenName">{tr}First name{/tr}{$must}</label>
     </td>
     <td>
      {if $multiple_support}
       <input type="text" id="givenName" name="dummy3" maxlength=60 value="{tr}Multiple edit{/tr}" disabled>
      {else}
       {render acl=$givenNameACL}
        <input type="text" id="givenName" name="givenName" maxlength=60 value="{$givenName}">
       {/render}
      {/if}
     </td>
    </tr>
    <tr>
     <td>
      <label for="uid">{tr}Login{/tr}{$must}</label>
     </td>
     <td>
      {if !$multiple_support}
       {render acl=$uidACL}
        <input type="text" id="uid" name="uid" maxlength=60  value="{$uid}">
       {/render}
      {else}
       <input type="text" id="uid" name="dummy1" maxlength=60  value="{tr}Multiple edit{/tr}" disabled>
      {/if}
     </td>
    </tr>

   {else}

   <!-- The template settings container -->
   <table summary="{tr}Account settings{/tr}"> 
    <tr>
     <td><label for="sn">{tr}Template name{/tr}{$must}</label></td>
     <td>{render acl=$snACL}<input type="text" id="sn" name="sn" maxlength=60 value="{$sn}">{/render}</td>
    </tr>

   {/if}
    
   <!-- Additional account/template settings -->
    <tr>
     <td>
      <label for="personalTitle">{tr}Personal title{/tr}</label>
     </td>
     <td>
      {render acl=$personalTitleACL checkbox=$multiple_support checked=$use_personalTitle}
       <input type="text" id="personalTitle" name="personalTitle" maxlength=60 value="{$personalTitle}">
      {/render}
     </td>
    </tr>
    <tr>
     <td>
      <label for="academicTitle">{tr}Academic title{/tr}</label>
     </td>
     <td>
      {render acl=$academicTitleACL checkbox=$multiple_support checked=$use_academicTitle}
       <input type="text" id="academicTitle" name="academicTitle" maxlength=60 value="{$academicTitle}">
      {/render}
     </td>
    </tr>

    {if !$multiple_support}

    <!-- Date of birth container (not visible in mutliple edit) -->
    <tr>
     <td>
      <div style="height:10px;"></div>
      <label for="dateOfBirth">{tr}Date of birth{/tr}</label>
     </td>
     <td>
      <div style="height:10px;"></div>
       {render acl=$dateOfBirthACL}
        <input type="text" id="dateOfBirth" name="dateOfBirth" class="date" value="{$dateOfBirth}">
         {if $dateOfBirthACL|regex_replace:"/[cdmr]/":"" == "w"}
          <script type="text/javascript">
           {literal}
            var datepicker  = new DatePicker(
                  { relative : 'dateOfBirth', 
                    language : '{/literal}{$lang}{literal}', 
                    keepFieldEmpty : true,
                    enableCloseEffect : false, 
                    enableShowEffect : false });
           {/literal}
          </script>
         {/if}
      {/render}
     </td>
    </tr>
    <tr>
     <td>
      <label for="gender">{tr}Sex{/tr}</label>
     </td>
     <td>
      {render acl=$genderACL}
       <select size="1" id="gender" name="gender">
        {html_options options=$gender_list selected=$gender}
       </select>
      {/render}
     </td>
    </tr>
    {/if}

    <tr>
     <td>
      <label for="preferredLanguage">{tr}Preferred language{/tr}</label>
     </td>
     <td>
      {render acl=$preferredLanguageACL checkbox=$multiple_support checked=$use_preferredLanguage}
      <select size="1" id="preferredLanguage" name="preferredLanguage">
       {html_options options=$preferredLanguage_list selected=$preferredLanguage}
      </select>
      {/render}
     </td>
    </tr>
    <tr>
     <td>
      <div style="height:10px;"> </div>
      {tr}Base{/tr}
     </td>
     <td>
      <div style="height:10px;"> </div>
      {render acl=$baseACL checkbox=$multiple_support checked=$use_base}
      {$base}
      {/render}
     </td>
    </tr>
   </table>

  </td>
  <td class='left-border'>   &nbsp;
  </td>

  <td>
   <table summary="{tr}Postal address{/tr}"> 
    <tr>
     <td><label for="homePostalAddress">{tr}Address{/tr}</label></td>
     <td>
      {render acl=$homePostalAddressACL checkbox=$multiple_support checked=$use_homePostalAddress}
        <textarea cols='200' id="homePostalAddress" name="homePostalAddress" rows="3" style="width:100%">{$homePostalAddress}</textarea>
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="homePhone">{tr}Private phone{/tr}</label>
      </td><td>
      {render acl=$homePhoneACL checkbox=$multiple_support checked=$use_homePhone}
      <input type="text" id="homePhone" name="homePhone" maxlength=60 value="{$homePhone}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="labeledURI">{tr}Homepage{/tr}</label></td>
     <td>
      {render acl=$labeledURIACL checkbox=$multiple_support checked=$use_labeledURI}
      <input type="text" id="labeledURI" name="labeledURI" maxlength=60 value="{$labeledURI}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="pw_storage">{tr}Password storage{/tr}</label></td>
     <td>
      {render acl=$passwordStorageACL checkbox=$multiple_support checked=$use_pw_storage}
      <select size="1" id="pw_storage" name="pw_storage" onchange='document.mainform.submit()'>
       {foreach from=$pwmode key=value item=desc}
       <option value="{$value}" {if $pwmode_select == $value}selected{/if} >{$desc}</option>
       {/foreach}
      </select>
      {if $pw_configurable eq "true"}
      &nbsp; <button id="edit_pw_method" type="submit" name="edit_pw_method">{tr}Configure{/tr}...</button>
      {/if}
      {/render}
     </td>
    </tr>
    
    {if $is_template ne "true" && !$multiple_support}
    <tr>
     <td><label for="edit_cert">{tr}Certificates{/tr}</label></td>
     <td>
      {render acl=$CertificatesACL mode=read_active}
      <button id="edit_cert" type="submit" name="edit_cert">{tr}Edit certificates{/tr}...</button>
      {/render}
     </td>
    </tr>
    {/if}
    
    <tr>
     <td colspan=2>
      <div style="height:10px;"></div>
     </td>
    </tr>
    <tr>
     <td colspan="2"><label for="res">{tr}Restrict login to{/tr}</label>
      
      {if !$multiple_support}
      {render acl=$gosaLoginRestrictionACL}
      {$gosaLoginRestrictionWidget}
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <input type="text" id="res" name="res" maxlength=33 
      value="{tr}IP or network{/tr}" onFocus='document.getElementById("res").value=""'>
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <button id="add_res" type="submit" name="add_res">{tr}Add{/tr}</button>
      {/render}
      
      {else}
      <input type='checkbox' name='use_gosaLoginRestriction' {if $use_gosaLoginRestriction} checked {/if}
      onClick='document.mainform.submit();'
      >
      {if !$use_gosaLoginRestriction}
      {render acl=$gosaLoginRestriction_ONLY_R_ACL}
      {$gosaLoginRestrictionWidget}
      {/render}
      {else}
      {render acl=$gosaLoginRestrictionACL}
      {$gosaLoginRestrictionWidget}
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <input type="text" id="res" name="res" maxlength=33 
      value="{tr}IP or network{/tr}" onFocus='document.getElementById("res").value=""'>
      {/render}
      {render acl=$gosaLoginRestrictionACL}
      <button id="add_res" type="submit" name="add_res">{tr}Add{/tr}</button>
      {/render}
      {/if}
      {/if}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<hr>

<table summary="{tr}Organizational information{/tr}">
 <tr>
  <td colspan="3">
   <h3>{tr}Organizational information{/tr}</h3>
  </td>
 </tr>
 <tr>

  {if $governmentmode ne "true"}
  <!-- Company, ... -->
  <td>
   <table summary="{tr}Organizational information{/tr} - {tr}part{/tr} 1">
    <tr>
     <td><label for="o">{tr}Organization{/tr}</label></td>
     <td>	
      {render acl=$oACL checkbox=$multiple_support checked=$use_o}
      <input type="text" id="o" name="o" maxlength=60 value="{$o}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="ou">{tr}Department{/tr}</label></td>
     <td>
      {render acl=$ouACL checkbox=$multiple_support checked=$use_ou}
      <input type="text" id="ou" name="ou" maxlength=60 value="{$ou}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="departmentNumber">{tr}Department No.{/tr}</label></td>
     <td>
      {render acl=$departmentNumberACL checkbox=$multiple_support checked=$use_departmentNumber}
      <input type="text" id="departmentNumber" name="departmentNumber" maxlength=60 value="{$departmentNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="employeeNumber">{tr}Employee No.{/tr}</label></td>
     <td>
      {render acl=$employeeNumberACL checkbox=$multiple_support checked=$use_employeeNumber}
      <input type="text" id="employeeNumber" name="employeeNumber" maxlength=60 value="{$employeeNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="employeeType">{tr}Employee type{/tr}</label></td>
     <td>
      {render acl=$employeeTypeACL checkbox=$multiple_support checked=$use_employeeType}
      <input type="text" id="employeeType" name="employeeType" maxlength=60 value="{$employeeType}">
      {/render}
     </td>
    </tr>
    {if !$multiple_support}
    <tr>
     <td><label for="manager_name">{tr}Manager{/tr}</label></td>
     <td>
      {render acl=$managerACL}
        <input type='text' name='manager_name' id='manager_name' value='{$manager_name}' disabled title='{$manager}'
          style='width:120px;'>
      {/render}

      {image path="images/lists/edit.png" action="editManager" acl=$managerACL}
      {if $manager!=""}
        {image path="images/info_small.png" title="{$manager}" acl=$managerACL}
        {image path="images/lists/trash.png" action="removeManager" acl=$managerACL}
      {/if}
     </td>
    </tr>
    {else}
    <tr>
     <td><label for="manager">{tr}Manager{/tr}</label></td>
     <td>
      <input type='checkbox' value="1" name="use_manager" id="use_manager" {if $use_manager} checked {/if}
      onClick="document.mainform.submit();">
      <input type='text' name='manager_name' id='manager_name' value='{$manager_name}' disabled
      title='{$manager}'>
      {if $use_manager}
      {image path="images/lists/edit.png" action="editManager"}

      {if $manager!=""}
      {image path="images/info_small.png" title="{$manager}"}

      {image path="images/lists/trash.png" action="removeManager"}

      {/if}
      {/if}
     </td>
    </tr>
    
    {/if}
   </table>
  </td>
  
  <td class='left-border'>   &nbsp;
  </td>
  
  <!-- Phone, ... -->
  <td>
   <table summary="{tr}Organizational information{/tr} - {tr}part{/tr} 2">
    <tr>
     <td><label for="roomNumber">{tr}Room No.{/tr}</label></td>
     <td>
      {render acl=$roomNumberACL checkbox=$multiple_support checked=$use_roomNumber}
      <input type="text" id="roomNumber" name="roomNumber" maxlength=60 value="{$roomNumber}">
      {/render}
     </td>
    </tr>
    {if $has_phoneaccount ne "true"}
    <tr>
     <td><label for="telephoneNumber">{tr}Phone{/tr}</label></td>
     <td>
      {render acl=$telephoneNumberACL checkbox=$multiple_support checked=$use_telephoneNumber}
      <input type="text" id="telephoneNumber" name="telephoneNumber" maxlength=60 value="{$telephoneNumber}">
      {/render}
     </td>
    </tr>
    {/if}
    <tr>
     <td><label for="mobile">{tr}Mobile{/tr}</label></td>
     <td>
      {render acl=$mobileACL checkbox=$multiple_support checked=$use_mobile}
      <input type="text" id="mobile" name="mobile" maxlength=60 value="{$mobile}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="pager">{tr}Pager{/tr}</label></td>
     <td>
      {render acl=$pagerACL checkbox=$multiple_support checked=$use_pager}
      <input type="text" id="pager" name="pager" maxlength=60 value="{$pager}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="facsimileTelephoneNumber">{tr}Fax{/tr}</label></td>
     <td>
      {render acl=$facsimileTelephoneNumberACL checkbox=$multiple_support checked=$use_facsimileTelephoneNumber}
      <input type="text" id="facsimileTelephoneNumber" name="facsimileTelephoneNumber" maxlength=60 value="{$facsimileTelephoneNumber}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  <td class='left-border'>   &nbsp;
  </td>
  
  <!-- Location, ... -->
  <td style='width:33%'>
   <table summary="{tr}Organizational information{/tr} - {tr}part{/tr} 3">
    <tr>
     <td><label for="l">{tr}Location{/tr}</label></td>
     <td>
      {render acl=$lACL checkbox=$multiple_support checked=$use_l}
      <input type="text" id="l" name="l" maxlength=60 value="{$l}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="st">{tr}State{/tr}</label></td>
     <td>
      {render acl=$stACL checkbox=$multiple_support checked=$use_st}
      <input type="text" id="st" name="st" maxlength=60 value="{$st}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="postalAddress">{tr}Address{/tr}</label></td>
     <td>
      {render acl=$postalAddressACL checkbox=$multiple_support checked=$use_postalAddress}
        <textarea cols="200" id="postalAddress" name="postalAddress" rows=3 style="width:100%">{$postalAddress}</textarea>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  {else} 
  
  <!-- Beschreibung, ... -->
  <td class="right-border">
   <table summary="{tr}Organizational information{/tr} - {tr}part{/tr} 1">
    <tr>
     <td><label for="vocation">{tr}Vocation{/tr}</label></td>
     <td>
      {render acl=$vocationACL checkbox=$multiple_support checked=$use_vocation}
      <input type="text" id="vocation" name="vocation" maxlength=60 value="{$vocation}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="gouvernmentOrganizationalUnitDescription">{tr}Unit description{/tr}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalUnitDescriptionACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalUnitDescription}
      <input type="text" id="gouvernmentOrganizationalUnitDescription" name="gouvernmentOrganizationalUnitDescription" maxlength=60
      value="{$gouvernmentOrganizationalUnitDescription}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="gouvernmentOrganizationalUnitSubjectArea">{tr}Subject area{/tr}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalUnitSubjectAreaACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalUnitSubjectArea}
      <input type="text" id="gouvernmentOrganizationalUnitSubjectArea" name="gouvernmentOrganizationalUnitSubjectArea" maxlength=60
      value="{$gouvernmentOrganizationalUnitSubjectArea}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="functionalTitle">{tr}Functional title{/tr}</label></td>
     <td>
      {render acl=$functionalTitleACL checkbox=$multiple_support checked=$use_functionalTitle}
      <input type="text" name="functionalTitle" id="functionalTitle"  maxlength=60
      value="{$functionalTitle}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="role">{tr}Role{/tr}</label></td>
     <td>
      {render acl=$roleACL checkbox=$multiple_support checked=$use_role}
      <input type="text" id="role" name="role" maxlength=60 value="{$role}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  <!-- Phone, ... -->
  <td class='right-border'>
   <table summary="{tr}Organizational information{/tr} - {tr}part{/tr} 2">
    <tr>
     <td><label for="gouvernmentOrganizationalPersonLocality">{tr}Person locality{/tr}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalPersonLocalityACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalPersonLocality}
      <input type="text" id="gouvernmentOrganizationalPersonLocality" name="gouvernmentOrganizationalPersonLocality" maxlength=60
      value="{$gouvernmentOrganizationalPersonLocality}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="gouvernmentOrganizationalUnit">{tr}Unit{/tr}</label></td>
     <td>
      {render acl=$gouvernmentOrganizationalUnitACL checkbox=$multiple_support checked=$use_gouvernmentOrganizationalUnit}
      <input type="text" id="gouvernmentOrganizationalUnit" name="gouvernmentOrganizationalUnit" maxlength=60 
      value="{$gouvernmentOrganizationalUnit}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="street">{tr}Street{/tr}</label></td>
     <td>
      {render acl=$streetACL checkbox=$multiple_support checked=$use_street}
      <input type="text" name="street" id="street" maxlength=60 value="{$street}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="postalCode">{tr}Postal code{/tr}</label></td>
     <td> 
      {render acl=$postalCodeACL checkbox=$multiple_support checked=$use_postalCode}
      <input type="text" name="postalCode" id="postalCode" maxlength=60 value="{$postalCode}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="houseIdentifier">{tr}House identifier{/tr}</label></td>
     <td>
      {render acl=$houseIdentifierACL checkbox=$multiple_support checked=$use_houseIdentifier}
      <input type="text" id="houseIdentifier" name="houseIdentifier" maxlength=60
      value="{$houseIdentifier}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  
  <!-- Location, ... -->
  <td>
   <table summary="{tr}Organizational information{/tr} - {tr}part{/tr} 3">
    <tr>
     <td><label for="roomNumber">{tr}Room No.{/tr}</label></td>
     <td>
      {render acl=$roomNumberACL checkbox=$multiple_support checked=$use_roomNumber}
      <input type="text" id="roomNumber" name="roomNumber" maxlength=60 value="{$roomNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="telephoneNumber">{tr}Phone{/tr}</label></td>
     <td>
      {render acl=$telephoneNumberACL checkbox=$multiple_support checked=$use_telephoneNumber}
      {if $has_phoneaccount ne "true"}
      <input type="text" id="telephoneNumber" name="telephoneNumber" maxlength=60 value="{$telephoneNumber}">
      {else}
      <i>{tr}Please use the phone tab{/tr}</i>
      {/if}
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="facsimileTelephoneNumber">{tr}Fax{/tr}</label></td>
     <td>
      {render acl=$facsimileTelephoneNumberACL checkbox=$multiple_support checked=$use_facsimileTelephoneNumber}
      <input type="text" id="facsimileTelephoneNumber" name="facsimileTelephoneNumber" maxlength=60 
      value="{$facsimileTelephoneNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="ivbbLastDeliveryCollective">{tr}Last delivery{/tr}</label></td>
     <td>
      {render acl=$ivbbLastDeliveryCollectiveACL checkbox=$multiple_support checked=$use_ivbbLastDeliveryCollective}
      <input type="text" name="ivbbLastDeliveryCollective" maxlength=60 id="ivbbLastDeliveryCollective" 
      value="{$ivbbLastDeliveryCollective}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="publicVisible">{tr}Public visible{/tr}</label></td>
     <td>
      {render acl=$publicVisibleACL checkbox=$multiple_support checked=$use_publicVisible}
      <select size="1" id="publicVisible" name="publicVisible">
       {html_options values=$ivbbmodes output=$ivbbmodes selected=$publicVisible}
      </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  {/if} 
 </tr>
</table>

{if $multiple_support}
<input type="hidden" name="user_mulitple_edit" value="1">
{/if}
<input type=hidden name="generic">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
<!-- // First input field on page
focus_field('sn');
-->
</script>
