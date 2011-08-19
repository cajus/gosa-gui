<table summary="{tr}Printer{/tr}" width="100%">
 <tr>
  <td style='width:50%; ' class='right-border'>

{if $StandAlone}
   <h3>{tr}General{/tr}</h3>
   <table summary="{tr}Generic settings{/tr}">
    <tr>
     <td><LABEL for="cn" >{tr}Printer name{/tr}</LABEL>{$must}</td>
     <td>
{render acl=$cnACL}
      <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
     <td>
{render acl=$descriptionACL}
      <input type='text' id="description" name="description" size=25 maxlength=80 value="{$description}">
{/render}
     </td>
    </tr>
    <tr>
      <td colspan=2>&nbsp;</td>
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
  <td>
{/if}
   <h3>{tr}Details{/tr}</h3>
   <table summary="{tr}Details{/tr}">
{if !$StandAlone}
      <tr> 
	 <td><LABEL for="description">{tr}Description{/tr}</LABEL></td> 
	 <td> 
	{render acl=$descriptionACL} 
	   <input type='text' id="description" name="description" size=25 maxlength=80 value="{$description}"> 
	{/render} 
	 </td> 
      </tr> 
{/if} 
     <tr>
       <td><LABEL for="l">{tr}Printer location{/tr}</LABEL></td>
       <td>
{render acl=$lACL}
        <input type='text' id="l" name="l" size=30 maxlength=80 value="{$l}">
{/render}
       </td>
     </tr>
     <tr>
       <td><LABEL for="labeledURI">{tr}Printer URL{/tr}</LABEL>{$must}</td>
       <td>
{render acl=$labeledURIACL}
        <input type='text' id="labeledURI" name="labeledURI" size=30 maxlength=80 value="{$labeledURI}">
{/render}
       </td>
     </tr>
{if $displayServerPath && 0}
    <tr>
     <td>{tr}PPD Provider{/tr}
     </td>
     <td>
      <input size=30 type='text' value='{$ppdServerPart}' name='ppdServerPart'>
     </td>
    </tr>
{/if}
   </table>
   <table summary="{tr}Driver configuration{/tr}">
    <tr> 
     <td>
      <br>
      {tr}Driver{/tr}: <i>{$driverInfo}</i>&nbsp;
{render acl=$gotoPrinterPPDACL mode=read_active}
       <button type='submit' name='EditDriver'>{tr}Edit{/tr}</button>

{/render}
{render acl=$gotoPrinterPPDACL}
       <button type='submit' name='RemoveDriver'>{tr}Remove{/tr}</button>

{/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<hr>

<h3>{tr}Permissions{/tr}</h3>
<table summary="{tr}Permissions{/tr}" width="100%">
 <tr>
  <td style='width:50%' class='right-border'>

   <table style="width:100%" summary='{tr}Permissions{/tr}'>
    <tr>
     <td>
      {tr}Users which are allowed to use this printer{/tr}<br>
{render acl=$gotoUserPrinterACL}
      <select size="1" name="UserMember[]" title="{tr}Users{/tr}" style="width:100%;height:120px;"  multiple>
       {html_options options=$UserMembers values=$UserMemberKeys}
      </select><br>
{/render}
{render acl=$gotoUserPrinterACL}
      <button type='submit' name='AddUser'>{msgPool type=addButton}</button>

{/render}
{render acl=$gotoUserPrinterACL}
      <button type='submit' name='DelUser'>{msgPool type=delButton}</button>

{/render}
     </td>
    </tr>
   </table> 
 
  </td>
  <td>
   <table style="width:100%" summary='{tr}Permissions{/tr}'>
    <tr>
     <td>
      {tr}Users which are allowed to administrate this printer{/tr}<br>
{render acl=$gotoUserPrinterACL}
           <select size="1" name="AdminMember[]" title="{tr}Administrators{/tr}" style="width:100%;height:120px;"  multiple>
                    {html_options options=$AdminMembers values=$AdminMemberKeys}
                   </select><br>
{/render}
{render acl=$gotoUserPrinterACL}
       <button type='submit' name='AddAdminUser'>{msgPool type=addButton}</button>

{/render}
{render acl=$gotoUserPrinterACL}
       <button type='submit' name='DelAdmin'>{msgPool type=delButton}</button>

{/render}
  
     </td>
    </tr>
   </table>
   
  </td>
 </tr>
</table>


{if $netconfig ne ''}
<hr>
{$netconfig}
{/if}

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">

  <!-- // First input field on page
  if(document.mainform.cn)
	focus_field('cn');
  -->
</script>
