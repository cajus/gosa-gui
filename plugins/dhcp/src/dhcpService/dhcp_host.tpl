{* GOsa dhcp host - smarty template *}

<table width="100%" summary="{tr}DHCP host configuration{/tr}">
 <tr>
  <td class='right-border' style='width:50%;'>

   <h3>{tr}Generic{/tr}</h3>
   <table  summary="{tr}DHCP host configuration{/tr}">
    <tr>
     <td>{tr}Name{/tr}{$must}</td>
     <td>
      {render acl=$acl}
       <input {if $realGosaHost} disabled {/if} id='cn' type='text' name='cn' 
         value='{$cn}' title='{tr}Name of host{/tr}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Fixed address{/tr}</td>
     <td>
      {render acl=$acl}
       <input {if $realGosaHost} disabled {/if} type='text' name='fixedaddr'
         value='{$fixedaddr}' title='{tr}Use host name or IP-address to assign fixed address{/tr}'>
      {/render}
     </td>
    </tr>
   </table>

  </td>
  <td>
   <h3>{tr}Hardware{/tr}</h3>

   <table summary="{tr}DHCP host configuration{/tr}">
    <tr>
     <td>{tr}Hardware type{/tr}</td>
     <td>
      {render acl=$acl}
       <select name='hwtype'  {if $realGosaHost} disabled {/if}size=1>
       {html_options options=$hwtypes selected=$hwtype}
      </select>
     {/render}
    </td>
   </tr>
   <tr>
    <td>{tr}Hardware address{/tr}{$must}</td>
    <td>
     {render acl=$acl}
      <input  {if $realGosaHost}  disabled {/if} type='text' 
        name='dhcpHWAddress' value='{$dhcpHWAddress}'>
     {/render}
    </td>
   </tr>
  </table>

 </td>
</tr>
</table>

<input type='hidden' name='dhcp_host_posted' value='1'>

<hr>
<!-- Place cursor in correct field -->
<script language="JavaScript" type="text/javascript">
 <!-- // First input field on page	 
  focus_field('cn');  
 -->
</script>
