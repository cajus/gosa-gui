
<table width="100%" summary="{tr}FAI package{/tr}">
 <tr>
  <td class='right-border'>
   <h3>{tr}Generic{/tr}
   </h3>
   <table summary="{tr}Generic settings{/tr}" cellspacing="4">
    <tr>
     <td><LABEL for="cn">{tr}Name{/tr}</LABEL>
     </td>
     <td>
      {render acl=$cnACL}
       <input type='text' value="{$cn}" size="45" disabled id="cn">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL>
     </td>
     <td>
      {render acl=$descriptionACL}
       <input type='text' value="{$description}" size="45" name="description" id="description">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td width="50%" valign="top">
   <h3>{tr}Repository{/tr}
   </h3>
   <table summary="{tr}Repository settings{/tr}" cellspacing="4">
    <tr>
     <td>{tr}Release{/tr}:
     </td>
     <td>
      {$release}
     </td>
    </tr>
    <tr>
     <td>{tr}Section{/tr}:
     </td>
     <td>
      {$section}
     </td>
    </tr>
    <tr>
     <td>{tr}Install method{/tr}:
     </td>
     <td>
      {render acl=$FAIinstallMethodACL}
       <select name="FAIinstallMethod" title='{tr}Please select the installation method{/tr}' size=1>
        {html_options options=$FAIinstallMethods output=$FAIinstallMethod selected=$FAIinstallMethod}
       </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<hr>
<table width="99%" summary="{tr}Package settings{/tr}">
 <tr>
  <td>
   <h3>{tr}Used packages{/tr}
   </h3>
   {$listing}
  </td>
 </tr>
 {render acl=$FAIpackageACL}
  <tr>
   <td>
    <input type="text" size="25" name="addPpkgsText" value="" />
    <button type='submit' name='AddManualpkg'>
    {msgPool type=addButton}</button>&nbsp;
    <button type='submit' name='Addpkg'>{tr}Add from list{/tr}</button>
   </td>
  </tr>
 {/render}
</table><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!-- // First input field on page	focus_field('cn','description');  --></script>