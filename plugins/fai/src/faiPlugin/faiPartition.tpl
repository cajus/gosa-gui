
<h3>{tr}Partition{/tr}
</h3>
<table style='width: 100%;' width="100%" summary="{tr}FAI partition{/tr}">
 <tr>
  
  {if $FAIdiskType == "lvm"}
   <td>{tr}Name{/tr}
   </td>
   <td width="35%">
    <input type='text' name="cn" value="{$cn}">
   </td>
   {else}
   <td>{tr}Type{/tr}
   </td>
   <td width="35%">
    <select name="FAIpartitionType" onChange='document.mainform.submit();' size=1>
     {html_options options=$partitionTypes selected=$FAIpartitionType}
    </select>
    
    {if $cn != ""}&nbsp;(
     {$cn})
     
    {/if}
   </td>
   
  {/if}
  <td>{tr}Description{/tr}
  </td>
  <td width="35%">
   <input type="text" value="{$description}" name="description">
  </td>
 </tr>
 
 {if $FAIdiskType == "disk" || $FAIdiskType == "lvm"}
  <tr>
   <td>{tr}Size{/tr}
   </td>
   <td colspan=3>
    <select name="FAIpartitionSizeType" onChange='document.mainform.submit();' size=1>
     {html_options options=$partitionSizeTypes selected=$FAIpartitionSizeType}
    </select>
    
    {if $FAIpartitionSizeType != "remaining"}
     <input type='text' name='sizeStart' value='{$sizeStart}' size='5'>
     <select name='sizeStart_Type' size=1>
      {html_options options=$sizeTypes selected=$sizeStart_Type}
     </select>
     {else}
     <input type='text' name='dummy3' value='' size='5' disabled>
     <select name='dummy4' disabled size=1>
      {html_options options=$sizeTypes}
     </select>
     
    {/if}&nbsp;-&nbsp;
    
    {if $FAIpartitionSizeType != "fixed" && $FAIpartitionSizeType != "remaining"}
     <input type='text' name='sizeStop' value='{$sizeStop}' size='5'>
     <select name='sizeStop_Type' size=1>
      {html_options options=$sizeTypes selected=$sizeStop_Type}
     </select>
     {else}
     <input type='text' name='dummy1' value='' size='5' disabled>
     <select name='dummy2' disabled size=1>
      {html_options options=$sizeTypes}
     </select>
     
    {/if}
   </td>
  </tr>
  <tr>
   <td colspan="4">
    <hr>
   </td>
  </tr>
  <tr>
   <td colspan="2">
    
    
    <input id="resize" type='checkbox' value='1' name='resize' {if $resize} checked {/if}>      &nbsp;<label for='resize'>{tr}Resize existing partition{/tr}</label>
   </td>
   <td colspan="2">
    
    
    <input id="bootable" type='checkbox' value='1' name='bootable' {if $bootable} checked {/if}>      &nbsp;<label for='bootable'>{tr}Boot able{/tr}</label>
   </td>
  </tr>
  <tr>
   <td colspan="4">
    
    
    <input id="preserve" type='checkbox' value='1' name='preserve' {if $preserve} checked {/if}>      &nbsp;<label for="preserve">{tr}Preserve{/tr}</label>
    <select name='preserveType' size=1>
     {html_options options=$preserveTypes selected=$preserveType}
    </select>
   </td>
  </tr>
  
 {/if}
 <tr>
  <td colspan="4">
   <hr>
  </td>
 </tr>
 
 {if $FAIdiskType == "raid"}
  <tr>
   <td colspan="4">
    <h3>{tr}Combined physical partitions{/tr}
    </h3>
    <select name='physicalPartition[]' size=5 style="width:100%; font-family: monospace;"        multiple>
     {html_options options=$plist}
    </select>
    <br>
    <select name='physicalPartitionAdd' style='width:240px;' size=1>
     {html_options options=$physicalPartitionList}
    </select>
    <button type='submit' name='addPhysicalPartition'>
    {msgPool type=addButton}</button>&nbsp;
    <button type='submit' name='delPhysicalPartition'>
    {msgPool type=delButton}</button>&nbsp;
    <button type='submit' name='toggleMissing'>{tr}Toggle missing{/tr}</button>&nbsp;
    <button type='submit' name='toggleSpare'>{tr}Toggle spare{/tr}</button>&nbsp;
   </td>
  </tr>
  <tr>
   <td colspan="4">
    <hr>
   </td>
  </tr>
  
 {/if}
 <tr>
  <td>{tr}File system{/tr}
  </td>
  <td>
   <select name='FAIfsType' onChange="document.mainform.submit();" size=1>
    {html_options options=$FAIfsTypes selected=$FAIfsType}
   </select>
  </td>
  <td>{tr}File system create options{/tr}
  </td>
  <td>
   <input type='text' name="FAIfsCreateOptions" value="{$FAIfsCreateOptions}">
  </td>
 </tr>
 <tr>
  <td colspan=2>
   
   
   <input id="encrypted" type='checkbox' name='encrypted' value='1' {if $encrypted} checked {/if}>      &nbsp;<label for="encrypted">{tr}Encrypted{/tr}</label>
  </td>
  <td>{tr}Tune options{/tr}
  </td>
  <td>
   <input type='text' name="FAIfsTuneOptions" value="{$FAIfsTuneOptions}">
  </td>
 </tr>
 <tr>
  <td colspan="4">
   <hr>
  </td>
 </tr>
 <tr>
  <td>{tr}Mount point{/tr}{$must}
  </td>
  <td>
   
   {if $FAIfsType != "swap"}
    <input type='text' name="FAImountPoint" value="{$FAImountPoint}">
    {else}
    <input type='text' name="dummy10" value="swap" disabled>
    
   {/if}
  </td>
  <td>{tr}Mount options{/tr}
  </td>
  <td>
   <input type='text' name="FAImountOptions" value="{$FAImountOptions}">
  </td>
 </tr><!-- Table cell sizing  -->
 <tr>
  <td colspan=2 style='width:50%;'>
  </td>
  <td colspan=2 style='width:50%;'>
  </td>
 </tr>
</table>
<input type='hidden' name='faiPartition' value='1'>
<hr>
<div style='text-align:right; width:100%; padding:5px'>
 
 {if !$freeze}
  <button type='submit' name='PartitionSave'>
  {msgPool type=okButton}</button>&nbsp;
  
 {/if}
 <button type='submit' name='PartitionCancel'>
 {msgPool type=cancelButton}</button>
</div>
