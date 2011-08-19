
<input type="hidden" name="SubObjectFormSubmitted" value="1">
<table width="100%" summary="{tr}FAI variable entry{/tr}">
 <tr>
  <td valign="top" width="50%">
   <h3>{tr}Generic{/tr}
   </h3>
   <table summary="{tr}Generic settings{/tr}">
    <tr>
     <td>{tr}Name{/tr}
      {$must}&nbsp;
     </td>
     <td>
      {render acl=$cnACL}
       <input type='text' value="{$cn}" size="45" maxlength="80" name="cn">
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Description{/tr}&nbsp;
     </td>
     <td>
      {render acl=$descriptionACL}
       <input type='text' value="{$description}" size="45" maxlength="80" name="description">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>&nbsp;
  </td>
  <td valign="top">
   <h3>{tr}Variable attributes{/tr}
   </h3>
   <table  summary="{tr}Variable attributes{/tr}" width="100%">
    <tr>
     <td><LABEL for="Content">{tr}Variable content{/tr}
      {$must}&nbsp;</LABEL>
     </td>
     <td>
      {render acl=$FAIvariableContentACL}
       <input type="text" name="FAIvariableContent" value="{$FAIvariableContent}" id="Content" style="width:250px;">
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<hr>
<br>
<div class="plugin-actions">
 
 {if !$freeze}
  <button type='submit' name='SaveSubObject'>
  {msgPool type=applyButton}</button>&nbsp;
  
 {/if}
 <button type='submit' name='CancelSubObject'>
 {msgPool type=cancelButton}</button>
</div><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!-- // First input field on page	focus_field('cn','description');  --></script>