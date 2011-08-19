
{if $isNew}

<h3>{tr}Create folder{/tr}</h3>
<table>
    <tr>
        <td>{tr}Name{/tr}:&nbsp;</td>
        <td><input name='folderName' value="{$folderItem.name}" type="text"></td>
    </tr>
</table>

{else}

<h3>{tr}Edit folder{/tr}</h3>
<table>
    <tr>
        <td>{tr}Name{/tr}:&nbsp;</td>
        <td>{$folderName}</td>
    </tr>
    <tr>
        <td>{tr}Path{/tr}:&nbsp;</td>
        <td>{$folderPath}</td>
    </tr>
</table>
{/if}

<hr>

<h3>{tr}Permissions{/tr}</h3>

<table>
    <tr>
        <td style='width:100px;'>{tr}Type{/tr}</td>
        <td style='width:180px;'>{tr}Name{/tr}</td>
        <td style='width:180px;'>{tr}Permission{/tr}</td>
    </tr>
    {foreach from=$folderItem.acls item=item key=key}
        <tr>
            <td>{$item.type}</td>
            <td><input type='text' name="permission_{$key}_name" value="{$item.name}"></td>
            <td>
                {if $permissionCnt == 0 || !isset($permissions[$item.acl])}
                    <input type='text' name="permission_{$key}_acl" value="{$item.acl}">
                {else}
                    <select name="permission_{$key}_acl" size=1>
                        {html_options options=$permissions selected=$item.acl}
                    </select>
                {/if}
            </td>
            <td><button name="permission_{$key}_del">{msgPool type=delButton}</button></td>
        </tr>
    {/foreach}
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td><button name="permission_add">{msgPool type=addButton}</button></td>
    </tr>
</table>

<hr>
<div class='plugin-actions'>
    <button name="FolderEditDialog_ok">{msgPool type='okButton'}</button>
    <button name="FolderEditDialog_cancel">{msgPool type='cancelButton'}</button>
</div>
