{* GOsa dhcp sharedNetwork - smarty template *}

<table width="100%" summary="{tr}Network configuration{/tr}">
 <tr>
  <td style='width:50%' class='right-border'>

   <h3>{tr}Network configuration{/tr}</h3>

   <table summary="{tr}Network configuration{/tr}">
    <tr>
     <td>{tr}Router{/tr}</td>
     <td>
      {render acl=$acl}
       <input id='routers' type='text' name='routers' value='{$routers}' 
         title='{tr}Enter name or IP address of router to be used in this section{/tr}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Net mask{/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='subnet_mask' value='{$subnet_mask}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Broadcast address{/tr}
     </td>
     <td>
      {render acl=$acl}
       <input type='text' name='broadcast_address' value='{$broadcast_address}'>
      {/render}
     </td>
    </tr>
   </table>

   <hr>

   <h3>{tr}Boot up{/tr}</h3>

   <table summary="{tr}Network configuration{/tr}">
    <tr>
     <td>{tr}Filename{/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='filename' value='{$filename}'
         title='{tr}Enter name of file that will be loaded via TFTP after client has started{/tr}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Next server{/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='nextserver' value='{$nextserver}' 
         title='{tr}Enter name of server to retrieve boot images from{/tr}'>
      {/render}
     </td>
    </tr>
   </table>

  </td>
  <td>

   <h3>{tr}Domain Name Service{/tr}</h3>

   <table summary="{tr}Network configuration{/tr}">
    <tr>
     <td>{tr}Domain{/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='domain' value='{$domain}' title='{tr}Name of domain{/tr}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td colspan=2>
      <br>{tr}DNS server{/tr}
      <br>
      {render acl=$acl}
       <select name='dnsserver' title='{tr}List of DNS servers to be propagated{/tr}' 
          style="width:350px;" size="4">
        {html_options options=$dnsservers}
       </select>
      {/render}
      <br>
      {render acl=$acl}
       <input type='text' name='addserver' title='{tr}DNS server do be added{/tr}'>&nbsp;
      {/render}
      {render acl=$acl}
       <button type='submit' name='add_dns' title="{tr}Click here add the selected server to the list{/tr}">
       {msgPool type=addButton}</button>
      {/render}
      {render acl=$acl}
       <button type='submit' name='delete_dns' 
        title="{tr}Click here remove the selected servers from the list{/tr}">{msgPool type=delButton}</button>
      {/render}

      <hr>

      <h3>{tr}Domain Name Service options{/tr}</h3>
      {render acl=$acl}
       <input type=checkbox name="autohost" value="1" {$autohost}>{tr}Assign host names found via reverse mapping{/tr}
      {/render}
      <br>
      {render acl=$acl}
       <input type=checkbox name="autohostdecl" value="1" {$autohostdecl}>{tr}Assign host names from host declarations{/tr}
      {/render}
     </td>
    </tr>
   </table>

  </td>
 </tr>
</table>

<!-- Place cursor in correct field -->
<script language="JavaScript" type="text/javascript">
 <!-- // First input field on page     
  focus_field('cn','routers');  
 -->
</script>
