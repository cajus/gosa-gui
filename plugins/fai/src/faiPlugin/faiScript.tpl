
<table width="100%" summary="{tr}FAI script{/tr}">
 <tr>
  <td width="50%" valign="top">
   <h3>{tr}Generic{/tr}
   </h3>
   <table summary="{tr}Generic settings{/tr}" cellspacing="4">
    <tr>
     <td><LABEL for="cn">{tr}Name{/tr}
      {$must}</LABEL>
     </td>
     <td>
      {render acl=$cnACL}
       <input type='text' value="{$cn}"  maxlength="80" size="45" disabled id="cn">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL>
     </td>
     <td>
      {render acl=$descriptionACL}
       <input type='text' size="45" maxlength="80" value="{$description}" name="description" id="description" >
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<hr>
<table width="100%" summary="{tr}List of scripts{/tr}">
 <tr>
  <td>
   <h3>{tr}List of scripts{/tr}
   </h3>
   {$Entry_listing}
   <hr>
   
   {if $sub_object_is_addable}
    <button type='submit' name='AddSubObject' title="{msgPool type=addButton}">
    {msgPool type=addButton}</button>
    {else}
    <button type='submit' name='Dummy2' title="{msgPool type=addButton}">
    {msgPool type=addButton}</button>
    
   {/if}
  </td>
 </tr>
</table>
<input type="hidden" value="1" name="FAIscript_posted" ><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!--	focus_field("cn","description");--></script>