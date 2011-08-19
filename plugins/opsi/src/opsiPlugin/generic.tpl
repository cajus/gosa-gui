
<h3>{tr}OPSI host{/tr}</h3>

{if $init_failed}<font style='color: #FF0000;'>

 {msgPool type=siError p=$message}</font>
 <button type='submit' name='reinit'>{tr}Retry{/tr}</button>

{else}

 <table style="width: 100%;" summary="{tr}OPSI host{/tr}">
  <tr>
   <td style="width:50%;" class="right-border">
    <table summary="{tr}Generic{/tr}">
     
     {if $standalone}
      <tr>
       <td>{tr}Name{/tr}{$must}</td>
       <td>
        {render acl=$hostIdACL}
         <input style='width:300px;' type='text' name='hostId' value='{$hostId}'>
        {/render}
       </td>
      </tr>

      {else}

      <tr>
       <td>{tr}Name{/tr}</td>
       <td>
        {render acl=$hostIdACL}
         <input style='width:300px;' type='text' disabled value="{$hostId}">
        {/render}
       </td>
      </tr>
      
     {/if}
     <tr>
      <td>{tr}Net boot product{/tr}</td>
      <td>

       {render acl=$netbootProductACL}
        <select name="opsi_netboot_product" onChange="document.mainform.submit();" size=1>
         {foreach from=$ANP item=item key=key}
          <option {if $key == $SNP} selected {/if} value="{$key}">{$key}</option>
         {/foreach}
        </select>
       {/render}
       
       {if $netboot_configurable}
        {image path="images/lists/edit.png" action="configure_netboot" title="{tr}Configure product{/tr}"}
       {/if}
      </td>
     </tr>
    </table>

   </td>
   <td>

    <table summary="{tr}Generic{/tr}">
     <tr>
      <td>{tr}Description{/tr}</td>
      <td>
       {render acl=$descriptionACL}
        <input type='text' name='description' value='{$description}'>
       {/render}
      </td>
     </tr>
     <tr>
      <td>{tr}Notes{/tr}</td>
      <td>
       {render acl=$descriptionACL}
        <input type='text' name='note' value='{$note}'>
       {/render}
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>

 <hr>

 <table width="100%" summary="{tr}Package settings{/tr}">
  <tr>
   <td style="width:50%;" class="right-border">
    <h3>{tr}Installed products{/tr}</h3>
    {render acl=$localProductACL}
     {$divSLP}
    {/render}
   </td>
   <td style="width:50%;">
    <h3>{tr}Available products{/tr}</h3>
    {render acl=$localProductACL}
     {$divALP}
    {/render}
   </td>
  </tr>
 </table>
    
 {if $standalone}

  <hr> 

  <h3>{tr}Action{/tr}</h3>
  <select name='opsi_action' size=1>
   <option>&nbsp;</option>
    {if $is_installed}
     <option value="install">{tr}Reinstall{/tr}</option>
    {else}
     <option value="install">{tr}Install{/tr}</option>
    {/if}
    <option value="wake">{tr}Wake{/tr}</option>
   </select>

   {render acl=$triggerActionACL}
    <button type='submit' name='opsi_trigger_action'>{tr}Execute{/tr}</button>
   {/render}
 {/if}

 <hr>
 {$netconfig}
 <input type='hidden' name='opsiGeneric_posted' value='1'>
{/if}
