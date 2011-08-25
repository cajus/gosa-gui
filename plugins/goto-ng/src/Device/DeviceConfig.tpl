{if $error}

    <p>
    {$errorMsg}
    </p>
    <button type='submit' name='retry'>{tr}Retry{/tr}</button>

{else}

    <table width='100%'>
        <tr>
            <td style='width:50%; vertical-align: top;padding-right:5px;'>
                <h3>{tr}Assignable items{/tr}</h3>
                {$assignableElementsList}
            </td>
            <td style='width:50%; vertical-align: top;padding-left:5px;' class='left-border'>
                <h3>{tr}Assigned items{/tr}</h3>
                {$usedElementsList}
            </td>
        </tr>
        <tr>
            <td colspan=2>
                <hr>
            </td>
        </tr>
        <tr>
            <td colspan=2>
                <h3>{tr}Parameters{/tr}</h3>
                {$parameterList}
            </td>
        </tr>
    </table>

{/if}
