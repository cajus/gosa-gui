{* GOsa dhcp sharedNetwork - smarty template *}

<h3>{tr}Generic{/tr}</h3>

<table width="100%" border="0" summary="{tr}DHCP shared network{/tr}">
 <tr>
  <td width="50%">

   <table summary="{tr}DHCP shared network{/tr}">
    <tr>
     <td>{tr}Name{/tr}{$must}</td>
     <td>
      {render acl=$acl}
       <input id='cn' type='text' name='cn' 
        value='{$cn}' title='{tr}Name for shared network{/tr}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Server identifier{/tr}
     </td>
     <td>
      {render acl=$acl}
       <input type='text' name='server-identifier' 
        value='{$server_identifier}'	title='{tr}Propagated server identifier for this shared network{/tr}'>
      {/render}
     </td>
    </tr>
   </table>

  </td>
  <td>

    {render acl=$acl}
     <input type=checkbox name="authoritative" 
      value="1" {if $authoritative} checked {/if} 
      title="{tr}Select if this server is authoritative for this shared network{/tr}">{tr}Authoritative server{/tr}
    {/render}

  </td>
 </tr>
</table>

<hr>
<table width="100%"  summary="{tr}DHCP shared network{/tr}">
 <tr>
  <td width="50%">
   <h3>{tr}Leases{/tr}</h3>

   <table  summary="{tr}DHCP shared network{/tr}">
    <tr>
     <td>{tr}Default lease time{/tr}
     </td>
     <td>
      {render acl=$acl}
       <input type='text' name='default-lease-time'
        value='{$default_lease_time}' title='{tr}Default lease time{/tr}'>&nbsp;{tr}seconds{/tr}
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Max. lease time{/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='max-lease-time'
        value='{$max_lease_time}' title='{tr}Maximum lease time{/tr}'>&nbsp;{tr}seconds{/tr}
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Min. lease time{/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='min-lease-time'
        value='{$min_lease_time}' title='{tr}Minimum lease time{/tr}'>&nbsp;{tr}seconds{/tr}
      {/render}
     </td>
    </tr>
   </table>

  </td>
  <td>

   <h3>{tr}Access control{/tr}</h3>
   <table  summary="{tr}DHCP shared network{/tr}">
    <tr>
     <td>
      {render acl=$acl}
       <input type=checkbox name="unknown-clients" 
        value="1" {$allow_unknown_state} title="{tr}Select if unknown clients should get dynamic IP addresses{/tr}">{tr}Allow unknown clients{/tr}
      {/render}
     </td>
    </tr>
    <tr>
     <td>
      {render acl=$acl}
       <input type=checkbox name="bootp" 
        value="1" {$allow_bootp_state} title="{tr}Select if BOOTP clients should get dynamic IP addresses{/tr}">{tr}Allow BOOTP clients{/tr}
      {/render}
     </td>
    </tr>
    <tr>
     <td>
      {render acl=$acl}
       <input type=checkbox name="booting" 
        value="1" {$allow_booting_state} title="{tr}Select if clients are allowed to boot using this DHCP server{/tr}">{tr}Allow booting{/tr}
      {/render}
     </td>
    </tr>
   </table>

  </td>
 </tr>
</table>
<hr>

<!-- Place cursor in correct field -->
<script language="JavaScript" type="text/javascript">
 <!-- // First input field on page  
  document.mainform.cn.focus();  
 -->
</script>
