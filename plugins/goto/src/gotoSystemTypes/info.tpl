
{if !$ACL}
	<h3>{msgPool type=permView}</h3>
{else}

<h3>{tr}System information{/tr}</h3>
<table summary="{tr}System information{/tr}" style="width:100%;">
 <tr>
  <td style='width:50%'>

   <table summary="{tr}Hardware information{/tr}">
    <tr>
     <td>
<b>{tr}CPU{/tr}</b></td><td>{$ghCpuType}</td>
    </tr>
    <tr>
     <td><b>{tr}Memory{/tr}</b></td><td>{$ghMemSize}</td>
    </tr>
    <tr>
     <td><b>{tr}Boot MAC{/tr}</b></td><td>{$macAddress}</td>
    </tr>
    <tr>
     <td>
<b>{tr}USB support{/tr}</b></td><td>{$ghUsbSupport}<div style="height:20px;"></div></td>
    </tr>
    <tr>
     <td><b>{tr}Inventory number{/tr}</b></td>
     <td>{$ghInventoryNumber}</td>
    </tr>
    <tr>
     <td><b>{tr}Last login{/tr}</b></td>
     <td>{$gotoLastUser}</td>
    </tr>
   </table>
  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td>
   <table summary="{tr}Device information{/tr}">
    <tr>
     <td>
<b>{tr}Network devices{/tr}</b></td>
     <td>
      {foreach item=netcard from=$ghNetNic}
        {$netcard}<br>
      {/foreach}
     </td>
    </tr>
    <tr><td colspan=2><div style="height:10px;"></div></td></tr>
    <tr>
     <td>
<b>{tr}IDE devices{/tr}</b></td>
     <td>
       {foreach item=idedev from=$ghIdeDev}
         {$idedev}<br>
       {/foreach}
     </td>
    </tr>
    <tr><td colspan=2><div style="height:10px;"></div></td></tr>
    <tr>
     <td>
<b>{tr}SCSI devices{/tr}</b></td>
     <td>
       {foreach item=scsidev from=$ghScsiDev}
         {$scsidev}<br>
       {/foreach}
     </td>
    </tr>
    <tr>
     <td><b>{tr}Floppy device{/tr}</b></td>
     <td>{$FloppyDevice}</td>
    </tr>
    <tr>
     <td><b>{tr}CD-ROM device{/tr}</b></td>
     <td>{$CdromDevice}</td>
    </tr>
    <tr><td colspan=2><div style="height:10px;"></div></td></tr>
    <tr>
     <td>
<b>{tr}Graphic device{/tr}</b></td>
     <td>{$ghGfxAdapter}</td>
    </tr>
    <tr>
     <td>
<b>{tr}Audio device{/tr}</b></td>
     <td>{$ghSoundAdapter}</td>
    </tr>
   </table>
  </td>
 </tr>
</table>

{/if}
