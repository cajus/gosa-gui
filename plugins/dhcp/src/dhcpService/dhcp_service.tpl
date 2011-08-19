
<h3>{tr}Generic{/tr}</h3>

<table width="100%" summary="{tr}DHCP service{/tr}">
 <tr>
  <td width="50%">
   {render acl=$acl}
    <input id='authoritative' type=checkbox name="authoritative" 
      value="1" {if $authoritative} checked {/if}>{tr}Authoritative service{/tr}
    <br>
   {/render}

   <br>{tr}Dynamic DNS update{/tr}
   {render acl=$acl}
    <select name='ddns_update_style'  title='{tr}Dynamic DNS update style{/tr}' size="1">
     {html_options values=$ddns_styles output=$ddns_styles selected=$ddns_update_style}
    </select>
   {/render}
  </td>
  <td>

   <table summary="{tr}DHCP settings{/tr}">
    <tr>
     <td>{tr}Default lease time (s){/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='default_lease_time' size='25' maxlength='80' 
        value='{$default_lease_time}' title='{tr}Enter default lease time in seconds.{/tr}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Maximum lease time (s){/tr}</td>
     <td>
      {render acl=$acl}
       <input type='text' name='max_lease_time' size='25' maxlength='80' 
        value='{$max_lease_time}' title='{tr}Enter maximum lease time in seconds.{/tr}'>
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
  focus_field('authoritative');  -->
</script>
