<input type="hidden" name="MAX_FILE_SIZE" value="2000000">

<h3>{tr}Certificates{/tr}</h3>

<table summary="{tr}The users standard certificate{/tr}" style="width:100%">
 <tr>
  <td style="width:25%">
   {tr}Standard certificate{/tr}
  </td>
  <td>
   <label for="userCertificate_file">
   {if $Certificate_readable}{$userCertificateinfo}{/if}</label>
  </td>
  <td style="text-align:right">
   {if $userCertificate_state ne "true"}
   {render acl=$CertificateACL}
   <input id="userCertificate_file" name="userCertificate_file" type="file" size="20" maxlength="255" accept="text/*.*">
   {/render}
   {else}
   {render acl=$CertificateACL}
   <button type='submit' name='remove_userCertificate'>
   {tr}Remove{/tr}</button>
   {/render}
   {/if}
  </td>
 </tr>
</table>

<hr>

<table summary="{tr}The users S/MIME certificate{/tr}" style="width:100%">
 <tr>
  <td style="width:25%">
   {tr}S/MIME certificate{/tr} 
  </td>
  <td>
   <label for="userSMIMECertificate_file">
   {if $Certificate_readable}{$userSMIMECertificateinfo}{/if}</label>
  </td>
  <td style="text-align:right">
   {if $userSMIMECertificate_state ne "true"}
   {render acl=$CertificateACL}
   <input id="userSMIMECertificate_file" name="userSMIMECertificate_file" type="file" size="20" maxlength="255" accept="text/*.*">
   {/render}
   {else}
   {render acl=$CertificateACL}
   <button type='submit' name='remove_userSMIMECertificate'>
   {tr}Remove{/tr}</button>
   {/render}
   {/if}
  </td>
 </tr>
</table>

<hr>

<table summary="{tr}The users PKCS12 certificate{/tr}" style="width:100%">
 <tr>
  <td style="width:25%">
   {tr}PKCS12 certificate{/tr} 
  </td>
  <td>
   <label for="userPKCS12_file">
   {if $Certificate_readable}{$userPKCS12info}{/if}</label>
  </td>
  <td style="text-align:right">
   {if $userPKCS12_state ne "true"}
   {render acl=$CertificateACL}
   <input id="userPKCS12_file" name="userPKCS12_file" type="file" size="20" maxlength="255" accept="text/*.*">
   {/render}
   {else}
   {render acl=$CertificateACL}
   <button type='submit' name='remove_userPKCS12'>
   {tr}Remove{/tr}</button>
   {/render}
   {/if}
  </td>
 </tr>
 {if $governmentmode eq "true"}
 <tr>
  <td>
   <label for="certificateSerialNumber">
   {tr}Certificate serial number{/tr}</label>
  </td>
  <td>
   {render acl=$CertificateACL}
   <input type='text' id="certificateSerialNumber" name="certificateSerialNumber" size=10 maxlength=20 value="{$certificateSerialNumber}">
   {/render}
  </td>
 </tr>
 {/if}
</table>
<hr>
<div class='plugin-actions'>
 {render acl=$CertificateACL}
 <button type='submit' name='cert_edit_finish'>
 {msgPool type=saveButton}</button>
 {/render}
 <button type='submit' name='cert_edit_cancel'>
 {msgPool type=cancelButton}</button>
</div>
