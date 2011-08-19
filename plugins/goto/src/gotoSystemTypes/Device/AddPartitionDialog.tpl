{if $error}

    <p>
    {$errorMsg}
    </p>
    <button type='submit' name='retry'>{tr}Retry{/tr}</button>

    <hr>
    <div class="clear"></div>

    <div class="plugin-actions">
      <button type='submit' name='cancel_partition_add'>{msgPool type=cancelButton}</button>
    </div>

{else}

    <h3>{tr}Type{/tr}</h3>

    <input {if $selected_type==0} checked {/if} onClick="document.mainform.submit();"
            type="radio" value="0" name="selected_type">{tr}Disk{/tr}<br>
    <input {if $selected_type==1} checked {/if} onClick="document.mainform.submit();"
            {if !count($disks)} disabled {/if}
            type="radio" value="1" name="selected_type">{tr}Physical partition{/tr}<br>
    <input  {if count($freeRaidPartitions) < 1} disabled {/if}
            {if $selected_type==2} checked {/if} onClick="document.mainform.submit();"
            type="radio" value="2" name="selected_type">{tr}Raid device{/tr}<br>
    <input  {if !count($freeLvmPartitions)} disabled {/if}
            {if $selected_type==3} checked {/if} onClick="document.mainform.submit();"
            type="radio" value="3" name="selected_type">{tr}LVM Volume group{/tr}<br>
    <input {if $selected_type==4} checked {/if} onClick="document.mainform.submit();"
            {if !count($volumeGroupList)} disabled {/if}
            type="radio" value="4" name="selected_type">{tr}LVM Volume{/tr}<br>

    <hr>

    {if $selected_type==4}
        
        <h3>{tr}LVM Volume{/tr}</h3>
        <table>
            <tr>
                <td>{tr}Volume name{/tr}</td>
                <td>
                    <input type="text" name="v_name" value="{$v_name}">
                </td>
            </tr>
            <tr>
                <td>{tr}Volume group{/tr}</td>
                <td>
                    <select name="v_group">
                        {foreach from=$volumeGroupList item=item}
                            <option value="{$item}"
                                {if $item==$v_group} selected {/if}
                                >{$item} {if isset($deviceUsage.vg[$item])} - ({$deviceUsage.vg[$item].size - $deviceUsage.vg[$item].usage} {tr}MB{/tr} {tr}free{/tr}){/if}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr>
                <td>{tr}Mount point{/tr}</td>
                <td>
                    {if $v_fsType == "swap"}
                        <input disabled type="text" name="v_mountPoint" value=" - ">
                    {else}
                        <input type="text" name="v_mountPoint" value="{$v_mountPoint}">
                    {/if}
                </td>
            </tr>
            <tr>
                <td>{tr}File system type{/tr}</td>
                <td>
                    <select name="v_fsType" onChange="document.mainform.submit();">
                        {html_options options=$fsTypes selected=$v_fsType}
                    </select>
                </td>
            </tr>
            <tr>
                <td>{tr}Size{/tr}</td>
                <td>
                    <input name="v_size" value="{$v_size}">
                </td>
            </tr>
            <tr>
                <td>{tr}Encrypt{/tr}</td>
                <td><input type="checkbox" name="v_encrypt" {if $v_encrypt_selected} checked {/if}></td>
            </tr>
        </table>

    {elseif $selected_type==3}
        
        <h3>{tr}LVM Volume group{/tr}</h3>
        <table>
            <tr>
                <td>{tr}Volume group name{/tr}</td>
                <td>
                    <input type="text" name="vg_name" value="{$vg_name}">
                </td>
            </tr>
            <tr>
                <td>{tr}Use LVM partitions{/tr}</td>
                <td>
                    {foreach from=$freeLvmPartitions item=item key=key}
                        <input type="checkbox" name="vg_partition_{$key}" 
                            {if in_array($item, $vg_partitions)} checked {/if}>&nbsp;{$item}
                            {if isset($deviceUsage.part[$item])} &nbsp;&nbsp; {$deviceUsage.part[$item].size} {tr}MB{/tr}
                            {elseif isset($deviceUsage.raid[$item])} &nbsp;&nbsp; {$deviceUsage.raid[$item].size} {tr}MB{/tr}{/if}    
                            <br>
                    {/foreach}
                </td>
            </tr>
        </table>

    {elseif $selected_type==2}
        <h3>{tr}Add raid device{/tr}</h3>

        <table>
            <tr>
                <td>{tr}Mount point{/tr}</td>
                <td>
                    {if $r_fsType == "swap" || $r_fsType == "pv"}
                        <input disabled type="text" name="r_mountPoint" value=" - ">
                    {else}
                        <input type="text" name="r_mountPoint" value="{$r_mountPoint}">
                    {/if}
                </td>
            </tr>
            <tr>
                <td>{tr}File system type{/tr}</td>
                <td>
                    <select name="r_fsType" onChange="document.mainform.submit();">
                        {html_options options=$fsTypes selected=$r_fsType}
                    </select>
                </td>
            </tr>
            <tr>
                <td>{tr}Raid level{/tr}</td>
                <td>
                    <select name="r_raidLevel">
                        {html_options options=$raidLevelList selected=$r_raidLevel}
                    </select>
                </td>
            </tr>
            <tr>
                <td>{tr}Use raid partitions{/tr}</td>
                <td>
                    {foreach from=$freeRaidPartitions item=item key=key}
                        <input type="checkbox" name="r_partition_{$key}" 
                            {if in_array($item, $r_partitions)} checked {/if}>&nbsp;{$item}
                            {if isset($deviceUsage.part[$item])} &nbsp;&nbsp;{$deviceUsage.part[$item].size} {tr}MB{/tr}
                            {elseif isset($deviceUsage.raid[$item])} &nbsp;&nbsp;{$deviceUsage.raid[$item].size} {tr}MB{/tr}{/if}    
                            <br>
                    {/foreach}
                </td>
            </tr>
            <tr>
                <td>{tr}Number of spares{/tr}</td>
                <td>
                    <input type="text" value="{$r_spares}" name="r_spares">
                </td>
            </tr>
            <tr>
                <td>{tr}Encrypt{/tr}</td>
                <td><input type="checkbox" name="r_encrypt" {if $r_encrypt_selected} checked {/if}></td>
            </tr>
        </table>

    {elseif $selected_type==1}

        <table width="100%">
            <tr>
                <td style="width:50%">
                    <h3>{tr}Add Partition{/tr}</h3>
                    <table>
                        <tr>
                            <td>{tr}Mount point{/tr}</td>
                            <td>
                                {if $p_fsType == "raid" || $p_fsType == "swap" || $p_fsType == "pv"}
                                    <input disabled type="text" name="p_mountPoint" value=" - ">
                                {else}
                                    <input type="text" name="p_mountPoint" value="{$p_mountPoint}">
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{tr}File system type{/tr}</td>
                            <td>
                                <select name="p_fsType" onChange="document.mainform.submit();">
                                    {html_options options=$fsTypes selected=$p_fsType}
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>{tr}Allowable drives{/tr}</td>
                            <td>
                                <select name="p_used_disk" onChange="document.mainform.submit();">
                                {foreach from=$disks item=disk}
                                    <option value="{$disk}"
                                        {if $disk==$p_used_disk} selected {/if}
                                        >{$disk} {if isset($deviceUsage.disk[$p_used_disk])} - ({$deviceUsage.disk[$p_used_disk].size - $deviceUsage.disk[$p_used_disk].usage} {tr}MB{/tr} {tr}free{/tr}){/if}</option>
                                {/foreach}
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>{tr}Size{/tr}</td>
                            <td>
                                <input name="p_size" value="{$p_size}">
                            </td>
                        </tr>
                        <tr>
                            <td>{tr}Force to be primary partition{/tr}</td>
                            <td><input type="checkbox" name="p_forcePrimary" {if $p_forcePrimary_selected} checked {/if}></td>
                        </tr>
                        <tr>
                            <td>{tr}Bootable{/tr}</td>
                            <td><input type="checkbox" name="p_bootable" {if $p_bootable_selected} checked {/if}></td>
                        </tr>
                        <tr>
                            <td>{tr}Encrypt{/tr}</td>
                            {if $p_fsType == "raid" || $p_fsType == "swap" || $p_fsType == "pv"}
                                <td><input disabled type="checkbox" name="p_encrypt"></td>
                            {else}
                                <td><input type="checkbox" name="p_encrypt" {if $p_encrypt_selected} checked {/if}></td>
                            {/if}
                        </tr>
                        <tr>
                            <td>{tr}Format{/tr}</td>
                            {if $p_fsType == "raid" || $p_fsType == "swap" || $p_fsType == "pv"}
                                <td><input disabled type="checkbox" name="p_format"></td>
                            {else}
                                <td><input type="checkbox" name="p_format" {if $p_format_selected} checked {/if}></td>
                            {/if}
                        </tr>
                    </table>
                </td>
                <td class="left-border"></td>
                <td>

                    <h3>{tr}Additional size options{/tr}</h3>
                    <table>
                        <tr>
                            <td><input type="radio" name="p_size_options" value="0" 
                                    onClick="document.mainform.submit();"
                                    {if $p_size_options==0} checked {/if}></td>
                            <td>{tr}Fixed size{/tr}</td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="p_size_options" value="2" 
                                    onClick="document.mainform.submit();"
                                    {if $p_size_options==2} checked {/if}></td>
                            <td>{tr}Fill to maximum allowable size{/tr}</td>
                        </tr>
                        <tr>
                            <td><input type="radio" name="p_size_options" value="1" 
                                    onClick="document.mainform.submit();"
                                    {if $p_size_options==1} checked {/if}></td>
                            <td>{tr}Fill all space up to{/tr} 
                                <input {if $p_size_options != 1} disabled {/if}
                                        id="p_size_max_value"
                                        name="p_size_max_value"
                                        type="text" value="{$p_size_max_value}">&nbsp;{tr}MB{/tr}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    {elseif $selected_type==0}
        <h3>{tr}Add disk{/tr}</h3>
        <table>
            <tr>
                <td>{tr}Disk name{/tr}</td>
                <td>
                    <input type="text" name="d_name" value="{$d_name}">
                </td>
            </tr>
        </table>
    {/if}

    <hr>
    <div class="clear"></div>

    <div class="plugin-actions">
      <button type='submit' name='save_partition_add'>{msgPool type=addButton}</button>
      <button type='submit' name='cancel_partition_add'>{msgPool type=cancelButton}</button>
    </div>

{/if}
