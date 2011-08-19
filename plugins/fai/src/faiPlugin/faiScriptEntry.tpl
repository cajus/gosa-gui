<input type="hidden" name="SubObjectFormSubmitted" value="1">
<table width="100%" summary="{tr}FAI script{/tr}">
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
       <input type='text' size="45" maxlength="80" value="{$description}" name="description">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>&nbsp;
  </td>
  <td valign="top">
   <h3>{tr}Script attributes{/tr}
   </h3>
   <table summary="{tr}Priority configuration{/tr}" width="100%">
    <tr>
     <td><LABEL for="FAIpriority">{tr}Priority{/tr}</LABEL>
     </td>
     <td>
      {render acl=$FAIpriorityACL}
       <select id="FAIpriority" name="FAIpriority" title="{tr}Choose a priority. Low values result in an earlier, high values in a later execution.{/tr}" size=1>
        {html_options options=$FAIprioritys selected=$FAIpriority}
       </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<hr>
<h3><LABEL for="FAIscript">{tr}Script{/tr}</LABEL></h3>

{if $write_protect}
  {tr}This FAI script is write protected, due to its encoding. Editing may break it!{/tr}
  <br>
  <button type='submit' name='editAnyway'>{tr}Edit anyway{/tr}</button>
{/if}

{render acl=$FAIscriptACL}
<textarea {if $write_protect} disabled {/if} {if !$write_protect} name="FAIscript" {/if} 
    style="width:100%;height:300px;" id="FAIscript"
    rows="20" cols="120">{$FAIscript}</textarea>
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
<br>
<hr>
<div class="plugin-actions">
 
 {if !$freeze}
  <button type='submit' name='SaveSubObject'>
  {msgPool type=applyButton}</button>&nbsp;
  
 {/if}
 <button type='submit' name='CancelSubObject'>
 {msgPool type=cancelButton}</button>
</div><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!-- // First input field on page	focus_field('cn','description');  --></script>
