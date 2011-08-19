{* GOsa dhcp sharedNetwork - smarty template *}

<h3>{tr}Generic{/tr}</h3>

<table summary="{tr}DHCP group settings{/tr}">
 <tr>
  <td>{tr}Name{/tr}{$must}</td>
  <td>
   {render acl=$acl}
    <input id='cn' type='text' name='cn' value='{$cn}' title='{tr}Name of group{/tr}'>
   {/render}
  </td>
 </tr>
</table>

<hr>

<!-- Place cursor in correct field -->
<script language="JavaScript" type="text/javascript">
 <!-- // First input field on page	 
  focus_field('cn');  
 -->
</script>
