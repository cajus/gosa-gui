
<input type="hidden" name="TableEntryFrameSubmitted" value="1">
<h3>{tr}Device{/tr}
</h3>
<table style='width:100%' summary="{tr}FAI disk entry{/tr}">
 <tr>
  <td style='width:50%;' class='right-border'>
   <table summary="{tr}Disk options{/tr}">
    <tr>
     <td><LABEL for="DISKcn">{tr}Name{/tr}</LABEL>
      {$must}&nbsp;
     </td>
     <td>
      {render acl=$DISKcnACL}
       <input type='text' value="{$DISKcn}" size="45" maxlength="80" name="DISKcn" id="DISKcn">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="fstabkey">{tr}fstab key{/tr}</LABEL>
     </td>
     <td>
      {render acl=$DISKFAIdiskOptionACL}
       <select name="fstabkey" size="1">
        {html_options options=$fstabkeys selected=$fstabkey}
       </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td>
   <table summary="{tr}Generic settings{/tr}">
    <tr>
     <td><LABEL for="DISKdescription">{tr}Description{/tr}</LABEL>&nbsp;
     </td>
     <td>
      {render acl=$DISKdescriptionACL}
       <input value="{$DISKdescription}" type="text" name="DISKdescription" id="DISKdescription">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="disklabel">{tr}Disk label{/tr}</LABEL>
     </td>
     <td>
      {render acl=$DISKFAIdiskOptionACL}
       <select name="disklabel" size="1">
        {html_options options=$disklabels selected=$disklabel}
       </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

{if $FAIdiskType == "lvm"}
 <hr>
 <h3>{tr}Combined physical partitions{/tr}
 </h3>
 <select style='font-family: monospace; width: 100%;'         name='physicalPartition[]' size=5 multiple>
  {html_options options=$plist}
 </select>
 <br>
 <select name='lvmPartitionAdd' style='width:240px;' size=1>
  {html_options options=$physicalPartitionList}
 </select>
 <button type='submit' name='addLvmPartition'>
 {msgPool type="addButton"}</button>&nbsp;
 <button type='submit' name='delLvmPartition'>
 {msgPool type="delButton"}</button>&nbsp;
 
{/if}
<hr>
<br>
<h3>{tr}Partition entries{/tr}
</h3>
{$setup}
<br>

{if !$freeze}
 
 {if $sub_object_is_createable}
  <button type='submit' name='AddPartition'>{tr}Add partition{/tr}</button>
  {else}
  <button type='submit' name='restricted'>{tr}Add partition{/tr}</button>
  
 {/if}
 
{/if}
<br>
<br>
<hr>
<br>
<div class="plugin-actions">
 
 {if !$freeze}
  <button type='submit' name='SaveDisk'>
  {msgPool type=saveButton}</button>
  
 {/if}
 <button type='submit' name='CancelDisk'>
 {msgPool type=cancelButton}</button>
</div><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!-- // First input field on page	focus_field('DISK_cn');  --></script>
