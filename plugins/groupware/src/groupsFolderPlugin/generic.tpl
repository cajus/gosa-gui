
<table summary="{tr}Groupware shared folder{/tr}" width="100%">
    <tr>
        <td style='width:50%; vertical-align: top;'>
            <h3>{tr}Groupware shared folder{/tr}</h3>

            {render acl=$folderListACL}
                {tr}Edit folder list{/tr}&nbsp;<button name='configureFolder'>{msgPool type=editButton}</button>
            {/render}
        </td>
        <td style='width:50%; vertical-align: top; padding-left:5px;'>
        </td>
    </tr>
</table>

<input type="hidden" name="GroupwareSharedFolder_posted" value="1">
