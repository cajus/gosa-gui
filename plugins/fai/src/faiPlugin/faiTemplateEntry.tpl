
<input type="hidden" name="SubObjectFormSubmitted" value="1">
<h3>{tr}Generic{/tr}
</h3>
<table width="100%" summary="{tr}FAI template entry{/tr}">
 <tr>
  <td style='width:50%;padding-right:10px;' class='right-border'>
   <table style='width:100%;' summary="{tr}Generic settings{/tr}">
    <tr>
     <td>{tr}File name{/tr}{$must}&nbsp;</td>
     <td style='width:100%;'>
      {render acl=$cnACL}
       <input value="{$templateFile}" type='text' name="templateFile">
      {/render}
     </td>
    </tr>
    <tr>
     <td>
        <LABEL for="templatePath">{tr}Destination path{/tr}{$must}&nbsp;</LABEL></td>
     <td>
      {render acl=$FAItemplatePathACL}
       <input type="text" name="templatePath" value="{$templatePath}" id="templatePath" >
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td>{tr}Description{/tr}
   {render acl=$descriptionACL}
    <input value="{$description}" name="description" type='text'>
   {/render}
  </td>
 </tr>
</table>
<hr>
<table width="100%" summary="{tr}Template attributes{/tr}">
 <tr>
  <td colspan=2>
   <h3>{tr}Template attributes{/tr}</h3>
  </td>
 </tr>
 <tr>
  <td style='width:50%;' class='right-border'>
   <table summary="{tr}Template file status{/tr}">
    <tr>
     <td>{tr}File{/tr}{$must}:&nbsp;
      {$status}
      
      {if $bStatus}
        {image path='images/save.png' action='getFAItemplate' title='{tr}Save template{/tr}...'}
        {image path='images/lists/edit.png' action='editFAItemplate' title='{tr}Edit template{/tr}...'}
      {/if}
     </td>
    </tr>
    
    {if $bStatus}
     <tr>
      <td>{tr}Full path{/tr}:&nbsp;<i>
       {$FAItemplatePath}</i>
      </td>
     </tr>
     
    {/if}
    <tr>
     <td class='center'>
      {render acl=$FAItemplateFileACL}
       <input type="file" name="FAItemplateFile" value="" id="FAItemplateFile">
      {/render}
      {render acl=$FAItemplateFileACL}
       <button type='submit' name='TmpFileUpload'>{tr}Upload{/tr}</button>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td>
   <table summary="{tr}File attributes{/tr}">
    <tr>
     <td><LABEL for="user">{tr}Owner{/tr}{$must}&nbsp;</LABEL>
     </td>
     <td>
      {render acl=$FAIownerACL}
       <input type="text" name="user" value="{$user}" id="user" size="15">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="group">{tr}Group{/tr}{$must}&nbsp;</LABEL>
     </td>
     <td>
      {render acl=$FAIownerACL}
       <input type="text" name="group" value="{$group}" id="group" size="15">
      {/render}
      <br>
      <br>
     </td>
    </tr>
    <tr>
     <td>{tr}Access{/tr}{$must}&nbsp;
     </td>
     <td>
      <table summary="{tr}File permissions{/tr}"><colgroup width="55" span="3"></colgroup>
       <tr><th>{tr}Class{/tr}</th><th>{tr}Read{/tr}</th><th>{tr}Write{/tr}</th><th>{tr}Execute{/tr}</th><th>&nbsp;</th><th>{tr}Special{/tr}</th><th>&nbsp;</th>
       </tr>
       <tr>
        <td>{tr}User{/tr}
        </td>
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="u4" value="4" {$u4}>
         </td>
        {/render}
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="u2" value="2" {$u2}>
         </td>
        {/render}
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="u1" value="1" {$u1}>
         </td>
        {/render}
        <td>&nbsp;
        </td>
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="s4" value="4" {$s4}>
         </td>
        {/render}
        <td>(SUID)
        </td>
       </tr>
       <tr>
        <td>{tr}Group{/tr}
        </td>
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="g4" value="4" {$g4}>
         </td>
        {/render}
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="g2" value="2" {$g2}>
         </td>
        {/render}
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="g1" value="1" {$g1}>
         </td>
        {/render}
        <td>&nbsp;
        </td>
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="s2" value="2" {$s2}>
         </td>
        {/render}
        <td>(SGID)
        </td>
       </tr>
       <tr>
        <td>{tr}Others{/tr}
        </td>
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="o4" value="4" {$o4}>
         </td>
        {/render}
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="o2" value="2" {$o2}>
         </td>
        {/render}
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="o1" value="1" {$o1}>
         </td>
        {/render}
        <td>&nbsp;
        </td>
        {render acl=$FAImodeACL}
         <td align="center">
          <input type="checkbox" name="s1" value="1" {$s1}>
         </td>
        {/render}
        <td>({tr}sticky{/tr})
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td colspan=2>
   <br>
   <hr>
   <br>
   <div class="plugin-actions">
    
    {if !$freeze}
     <button type='submit' name='SaveSubObject'>
     {msgPool type=applyButton}</button>&nbsp;
     
    {/if}
    <button type='submit' name='CancelSubObject'>
    {msgPool type=cancelButton}</button>
   </div>
  </td>
 </tr>
</table>
<input type='hidden' name='FAItemplateEntryPosted' value='1'><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!-- // First input field on page	focus_field('cn','description');  --></script>
