
<input type="hidden" name="SubObjectFormSubmitted" value="1">
<table width="100%" summary="{tr}FAI hook entry{/tr}">
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
       <input type='text' value="{$cn}" size="45" name="cn">
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Description{/tr}&nbsp;
     </td>
     <td>
      {render acl=$descriptionACL}
       <input type='text' value="{$description}" size="45" name="description">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>&nbsp;
  </td>
  <td>
   <h3>{tr}Hook attributes{/tr}
   </h3><LABEL for="FAItask">{tr}Task{/tr}&nbsp;</LABEL>
   {render acl=$FAItaskACL}
    <select id="FAItask" name="FAItask" title="{tr}Choose an existing FAI task{/tr}" size=1>
     {html_options values=$tasks output=$tasks selected=$FAItask}
    </select>
   {/render}
  </td>
 </tr>
</table>
<hr>
<h3><LABEL for="FAIscript">{tr}Script{/tr}</LABEL>
</h3>

{if $write_protect}
  {tr}This FAI script is write protected, due to its encoding. Editing may break it!{/tr}
  <br>
  <button type='submit' name='editAnyway'>{tr}Edit anyway{/tr}</button>
{/if}


{render acl=$FAIscriptACL}
    <textarea {if $write_protect} disabled {/if} {if !$write_protect} name="FAIscript" {/if} 
        style="width:100%;height:300px;" id="FAIscript" rows=20 cols=120>{$FAIscript}</textarea>
{/render}
<br>
<div>
 {render acl=$FAIscriptACL}
  <input type="file" name="ImportFile">&nbsp;
 {/render}
 {render acl=$FAIscriptACL}
  <button type='submit' name='ImportUpload'>{tr}Import script{/tr}</button>
 {/render}
 {render acl=$FAIscriptACL}
  {$DownMe}
 {/render}
</div>
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
