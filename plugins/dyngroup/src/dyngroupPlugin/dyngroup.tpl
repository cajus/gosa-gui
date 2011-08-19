<h3>{tr}List of dynamic rules{/tr}</h3>

<table summary="{tr}Labeled URI definitions{/tr}" style='width:100%'>
 <tr>
  <td style='width:40%;'>{tr}Base{/tr}</td>
  <td>{tr}Scope{/tr}</td>
  <td>{tr}Attribute{/tr}</td>
  <td style='width:40%;'>{tr}Filter{/tr}</td>
  <td></td>
 </tr>
{foreach item=item key=key from=$labeledURIparsed}
 <tr>
  <td>
    <input style='width:98%;' type='text' value='{$item.base}' name='base_{$key}'>
  </td>
  <td>
    <select name='scope_{$key}' size='1'>
     {html_options options=$scopes selected=$item.scope}
    </select>
  </td>
  <td><input type='text' name='attr_{$key}' value='{$item.attr}'></td>
  <td><input name='filter_{$key}' type='text' style='width:98%;' value='{$item.filter}'></td>
  <td><button name='delUri_{$key}'>{msgPool type='delButton'}</button></td>
 </tr>
{/foreach}
 <tr>
  <td><button name='addUri'>{msgPool type='addButton'}</button></td>
  <td colspan="4"></td>
 </tr>
</table>
