{* GOsa dhcp sharedNetwork - smarty template *}
<hr>

{if $show_advanced}

 <button type='submit' name='hide_advanced'>{tr}Hide advanced settings{/tr}</button>

 <table width="100%" summary="{tr}DHCP advanced settings{/tr}">
  <tr>
   <td width="50%" class='right-border'>
    <hr>{tr}DHCP statements{/tr}</hr>

    {render acl=$acl}
     <select name='dhcpstatements' style="width:100%;" size="14">
      {html_options options=$dhcpstatements}
     </select>
    {/render}
    <br>
    {render acl=$acl}
     <input type='text' name='addstatement' size='25' maxlength='250'>&nbsp;
    {/render}
    {render acl=$acl}
     <button type='submit' name='add_statement'>{msgPool type=addButton}</button>&nbsp;
    {/render}
    {render acl=$acl}
     <button type='submit' name='delete_statement'>{msgPool type=delButton}</button>
    {/render}
   </td>
   <td>
    <h3>{tr}DHCP options{/tr}</h3>
    {render acl=$acl}
     <select name='dhcpoptions' style="width:100%;" size="14">
      {html_options options=$dhcpoptions}
     </select>
    {/render}
    <br>
    {render acl=$acl}
     <input type='text' name='addoption' size='25' maxlength='250'>&nbsp;
    {/render}
    {render acl=$acl}
     <button type='submit' name='add_option'>{msgPool type=addButton}</button>&nbsp;
    {/render}
    {render acl=$acl}
     <button type='submit' name='delete_option'>{msgPool type=delButton}</button>
    {/render}
   </td>
  </tr>
 </table>
 {else}
 <button type='submit' name='show_advanced'>{tr}Show advanced settings{/tr}</button>
{/if}
<hr>
