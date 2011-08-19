<h3>{tr}Filter editor{/tr}</h3>

<table summary="{tr}Generic settings{/tr}">
    <tr>
        <td><LABEL for='NAME'>{tr}Name{/tr}</LABEL>:</td>
        <td>
            {render acl=$acl}
                <input style='width:300px;' type='text' id='NAME' name="NAME" value="{$NAME}">
            {/render}
        </td>
    </tr>
    <tr>
        <td><LABEL for='DESC'>{tr}Description{/tr}:</LABEL></td>
        <td>
            {render acl=$acl}
                <input style='width:300px;' type='text' id='DESC' name="DESC" value="{$DESC}">
            {/render}
        </td>
    </tr>
</table>

<hr>
{render acl=$acl}
    {$filterStr}
{/render}
<hr>

<div class="plugin-actions">
    {render acl=$acl}
        <button name='filterEditor_ok'>{msgPool type='okButton'}</button>
    {/render}
    <button name='filterEditor_cancel'>{msgPool type='cancelButton'}</button>
</div>
<input type='hidden' value='1' name='filterEditorPosted'>
