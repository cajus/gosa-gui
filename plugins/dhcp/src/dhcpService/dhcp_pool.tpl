{* GOsa dhcp sharedNetwork - smarty template *}

<h3>{tr}Generic{/tr}</h3>
<table width="100%" summary="{tr}DHCP pool settings{/tr}">
 <tr>
  <td width="50%">
   {tr}Name{/tr}{$must}
   {render acl=$acl}
    <input id='cn' type='text' name='cn' size='25' maxlength='80' value='{$cn}'
      title='{tr}Name of pool{/tr}'>
   {/render}
  </td>
  <td>{tr}Range{/tr}
   {$must}&nbsp;
   {render acl=$acl}
    <input type='text' name='range_start' size='25' maxlength='30' value='{$range_start}'>
   {/render}&nbsp;-&nbsp;
   {render acl=$acl}
    <input type='text' name='range_stop' size='25' maxlength='30' value='{$range_stop}'>
   {/render}
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
