{if $type == 'Distribution'}

<table width="100%">
    <tr>
        <td style='width: 50%'>
            <table>
                <tr>
                    <td>{$nameName}</td>
                    <td>{$name}</td>
                </tr>
                <tr>
                    <td>{$originName}</td>
                    <td>{$origin}</td>
                </tr>
                <tr>
                    <td>{$installation_typeName}</td>
                    <td>{$installation_type}</td>
                </tr>
                <tr>
                    <td>{$installation_methodName}</td>
                    <td>{$installation_method}</td>
                </tr>
                <tr>
                    <td>{$mirror_sourcesName}</td>
                    <td>{$mirror_sources}</td>
                </tr>
            </table>
        </td>
        <td class="left-border">
        </td><td>
            <table width="100%">
                <tr>
                    <td>{$architecturesName}</td>
                    <td>{$architectures}</td>
                </tr>
                <tr>
                    <td>{$componentsName}</td>
                    <td>{$components}</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
{else if $type == 'Release'}
<table>
    <tr>
        <td>{$nameName}</td>
        <td>{$name}</td>
    </tr>
</table>
{else if $type == 'Template'}
<table>
    <tr>
        <td>{$nameName}</td>
        <td>{$name}</td>
    </tr>
    <tr>
        <td>{$descriptionName}</td>
        <td>{$description}</td>
    </tr>
    <tr>
        <td>{$methodName}</td>
        <td>{$method}</td>
    </tr>
    <tr>
        <td>{$dataName}</td>
        <td>{$data}</td>
    </tr>
</table>
{/if}
