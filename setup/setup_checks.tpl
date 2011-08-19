<p>
 {tr}This step checks if your PHP server has all required modules and configuration settings.{/tr}
</p>

<table style='width:100%;' summary='{tr}Inspection{/tr}'>
 <tr>
  <td style='text-align:top; width: 50%;'>
   <h2>{tr}PHP module and extension checks{/tr}</h2>

   <table cellspacing='0' class='sortableListContainer' style='border:1px solid #CCC; width:100%;' summary='{tr}Basic checks{/tr}'>
    {foreach from=$basic item=val key=key}
     {if $basic[$key].SOLUTION != "" && !$basic[$key].RESULT}
      <tr class='entry_container_info'>
     {else}
      <tr class='entry_container'>
     {/if}
       
     <td>{$basic[$key].NAME}</td>

     {if $basic[$key].RESULT}
       <td style='color:#0A0'>{tr}OK{/tr}</td>
      </tr>
     {else}
        {if $basic[$key].MUST}
         <td style='color:red'>{tr}Error{/tr}</td>
        {else}
         <td style='color:orange'>{tr}Warning{/tr}</td>
        {/if}
       </tr>

      {if $basic[$key].SOLUTION != ""}
       <tr>       
        <td colspan=2>{$basic[$key].SOLUTION}</td>
       </tr>
       <tr>       
        <td colspan=2>
         {if $basic[$key].MUST}
          <b>{tr}GOsa will NOT run without fixing this.{/tr}</b>
         {else}
          <b>{tr}GOsa will run without fixing this.{/tr}</b>
         {/if}
        </td>
       </tr>
      {/if}
     {/if}
    {/foreach}
   </table>
  </td>
  <td>
   <h2>{tr}PHP setup configuration{/tr} (<a style='text-decoration:underline' href='?info' target='_blank'>{tr}show information{/tr})</a></h2>
   <table cellspacing='0' class='sortableListContainer' style='border:1px solid #CCC; width:100%;' summary='{tr}Extended checks{/tr}'>
    {foreach from=$config item=val key=key}
     {if $config[$key].SOLUTION != "" && !$config[$key].RESULT}
      <tr class='entry_container_info'>
     {else}
      <tr class='entry_container'>
     {/if}
       
     <td>{$config[$key].NAME}</td>

     {if $config[$key].RESULT}
       <td style='color:#0A0'>{tr}OK{/tr}</td>
      </tr>
     {else}
        {if $config[$key].MUST}
         <td style='color:red'>{tr}Error{/tr}</td>
        {else}
         <td style='color:orange'>{tr}Warning{/tr}</td>
        {/if}
       </tr>

      {if $config[$key].SOLUTION != ""}
       <tr>       
        <td colspan=2>{$config[$key].SOLUTION}</td>
       </tr>
       <tr>       
        <td colspan=2>
         {if $config[$key].MUST}
          <b>{tr}GOsa will NOT run without fixing this.{/tr}</b>
         {else}
          <b>{tr}GOsa will run without fixing this.{/tr}</b>
         {/if}
        </td>
       </tr>
      {/if}
     {/if}
    {/foreach}
   </table>
  </td>
 </tr>
</table>

