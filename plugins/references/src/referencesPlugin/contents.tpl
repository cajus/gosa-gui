
<h3>{tr}Object information{/tr}</h3>
<table width='100%' summary='{tr}Object information{/tr}'>
    <tr>
        <td style='width:48%;'>
            {if $completeACL|regex_replace:"/[cdmw]/":"" == "r"}
                <button type='submit' name='viewLdif'>{tr}Show raw object entry{/tr}</button>
            {/if}
        </td>
        <td class='right-border' style='width:2px'>
          &nbsp;
        </td>
        <td>
            {if !$someACL|regex_replace:"/[cdmw]/":"" == "r"}
                {msgPool type='permView'}
            {else}
                {if $modifyTimestamp==""}
                    {tr}Last modification{/tr}: {tr}Unknown{/tr}
                {else}
                    {tr}Last modification{/tr}: {$modifyTimestamp}
                {/if}
            {/if}
        </td>
    </tr>
</table>

<hr>

<table summary='{tr}Object references{/tr}' class='reference-tab'>
    <tr>
        {if $objectList!=""}
        <td style='width:48%'>
            {if !$completeACL|regex_replace:"/[cdmw]/":"" == "r"}
                {msgPool type='permView'}
            {else}
                {$objectList}
            {/if}
        </td>
        <td class='right-border'  style='width:2px'>
          &nbsp;
        </td>
        {/if}
        <td>
            {if !$aclREAD}
                <h3>{tr}ACL trace{/tr}</h3>
                {msgPool type='permView'}
            {else}
                <div style='height:350px; overflow: scroll;'>
                {$acls}
                </div>
            {/if}
        </td>
    </tr>
</table>
