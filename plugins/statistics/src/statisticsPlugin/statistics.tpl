
<h3>{tr}Usage statistics{/tr}</h3>
{if $registrationNotWanted}
    
    {tr}This feature is disabled. To enable it you have to register GOsa, you can initiate a registration using the dash-board plugin.{/tr}
    <button type='button' onClick="openPlugin({$dashBoardId});">{tr}Dash board{/tr}</button>

{else if !$instanceRegistered}

    {tr}This feature is disabled. To enable it you have to register GOsa, you can initiate a registration using the dash-board plugin.{/tr}

    <button type='button' onClick="openPlugin({$dashBoardId});">{tr}Dash board{/tr}</button>

{else if !$serverAccessible || !$validRpcHandle || $rpcHandle_Error}

    {tr}Communication with the GOsa-backend failed. Please check the RPC configuration!{/tr}

{else}

    {if $unsbmittedFiles != 0}
        {$unsbmittedFilesMsg}
        <button name='transmitStatistics'>{tr}Send{/tr}</button>
        <hr>
    {/if}

    <table>
        <tr>
            <td><b>{tr}Generate report for{/tr}:</b></td>
            <td style='width:220px;'>
                 <input type="text" id="graph1DatePicker1" name="graph1DatePicker1" class="date" value="{$graph1DatePicker1}">
                 <script type="text/javascript">
                  {literal}
                   var datepicker  = new DatePicker(
                         { relative : 'graph1DatePicker1',
                           language : '{/literal}{$lang}{literal}',
                           keepFieldEmpty : true,
                           enableCloseEffect : false,
                           enableShowEffect : false });
                  {/literal}
                 </script>
            </td>
            <td style='width:220px;'>
                <input type="text" id="graph1DatePicker2" name="graph1DatePicker2" class="date" value="{$graph1DatePicker2}">
                <script type="text/javascript">
                 {literal}
                  var datepicker  = new DatePicker(
                        { relative : 'graph1DatePicker2',
                          language : '{/literal}{$lang}{literal}',
                          keepFieldEmpty : true,
                          enableCloseEffect : false,
                          enableShowEffect : false });
                 {/literal}
                </script>
            </td>
            <td>
                <button name='receiveStatistics'>{tr}Update{/tr}</button>
            </td>
        </tr>
    </table>
    <hr>

    <table>
        <tr>
            <td>
                {if isset($staticChart1_ID) && $staticChart1_ID}
                    <img src='plugins/statistics/getGraph.php?id={$staticChart1_ID}'>
                {else}
                    <div style='height:200px; width: 400px;'>
                        <i>{tr}No statistic data for given period{/tr}</i>
                    </div>
                {/if}
            </td>
            <td>
                {if isset($staticChart2_ID) && $staticChart2_ID}
                    <img src='plugins/statistics/getGraph.php?id={$staticChart2_ID}'>
                {else}
                    <div style='height:200px; width: 400px;'>
                        <i>{tr}No statistic data for given period{/tr}</i>
                    </div>
                {/if}
            </td>
        </tr>
    </table>

    {if isset($curGraphID) && $curGraphID}
        <hr>
        <b>{tr}Select report type{/tr}:</b>&nbsp;
        <select name='selectedGraphType' onChange="document.mainform.submit();" size='1'>
            {html_options options=$availableGraphs selected=$selectedGraphType}
        </select>
        {$curGraphOptions}
        <table>
            <tr>
                <td>
                    <input type='hidden' name='currentGraphPosted' value='1'>
                    <img src='plugins/statistics/getGraph.php?id={$curGraphID}'>
                </td>
            </tr>
            <tr>
                <td>
                    {$curSeriesSelector}
                </td>
            </tr>
        </table>
    {/if}
{/if}
