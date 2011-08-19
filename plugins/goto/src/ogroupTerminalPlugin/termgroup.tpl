
<p>
<b>{tr}Warning{/tr}:</b>&nbsp;{tr}Actions you choose here influence all systems in this object group. Additionally, all values editable here can be inherited by the clients assigned to this object group.{/tr}
</p>

<hr>

<h3>{tr}Generic{/tr}</h3>

<table width="100%" summary="{tr}System settings{/tr}">
 <tr>
  <td style='width:50%;'><!-- Upper left -->

   <LABEL for="gotoNtpServerSelected">{tr}NTP server{/tr}</LABEL>
   <br>

   {render acl=$gotoNtpServerACL}
    <select name="gotoNtpServerSelected[]" id="gotoNtpServerSelected" 
      multiple size=5 style="width:100%;"						
      title="{tr}Choose server to use for synchronizing time{/tr}" 
      {if $inheritTimeServer} disabled {/if}>
     {html_options options=$gotoNtpServer_select}
    </select>
   {/render}

   <br>
   {render acl=$gotoNtpServerACL}
    <select name="gotoNtpServers" id="gotoNtpServers" {if $inheritTimeServer} disabled {/if}size=1>
     {html_options output=$gotoNtpServers values=$gotoNtpServers}
    </select>
   {/render}

   {render acl=$gotoNtpServerACL}
    <button type='submit' name='addNtpServer' id="addNtpServer"    
     {if ($inheritTimeServer) || (!$gotoNtpServers)}disabled{/if}
      >{msgPool type=addButton}</button>
   {/render}

   {render acl=$gotoNtpServerACL}
    <button type='submit' name='delNtpServer' id="delNtpServer"
      {if ($inheritTimeServer) || (!$gotoNtpServer_select)}disabled{/if}
      >{msgPool type=delButton}</button>
    {/render}

  </td>
  <td class='left-border'><!-- Upper right -->

   <table summary="{tr}Goto settings{/tr}"> 
    <tr>
     <td>{tr}Mode{/tr}</td>
     <td>
      {render acl=$gotoModeACL}
       <select name="gotoMode" title="{tr}Select terminal mode{/tr}" size=1>
        {html_options options=$modes selected=$gotoMode_select}
       </select>
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoSyslogServer">{tr}Syslog server{/tr}</LABEL></td>
     <td>
      {render acl=$gotoSyslogServerACL}
       <select id="gotoSyslogServer" name="gotoSyslogServer" 
          title="{tr}Choose server to use for logging{/tr}" size=1>
        {html_options values=$syslogservers output=$syslogservers selected=$gotoSyslogServer_select}
       </select>
      {/render}
     </td>
    </tr>
    
    {if $is_termgroup}
     <tr>
      <td><LABEL for="gotoTerminalPath">{tr}Root server{/tr}</LABEL></td>
      <td>
       {render acl=$gotoTerminalPathACL}
        <select name="gotoTerminalPath" id="gotoTerminalPath" 
          title="{tr}Select NFS root file system to use{/tr}" size=1>
         {html_options options=$nfsservers selected=$gotoTerminalPath_select}
        </select>
       {/render}
      </td>
     </tr>
     <tr>
      <td><LABEL for="gotoSwapServer">{tr}Swap server{/tr}</LABEL></td>
      <td>
       {render acl=$gotoSwapServerACL}
        <select name="gotoSwapServer" id="gotoSwapServer" 
          title="{tr}Choose NFS file system to place swap files on{/tr}" size=1>
         {html_options options=$swapservers selected=$gotoSwapServer_select}
        </select>
       {/render}
      </td>
     </tr>
     
    {/if}
   </table>

  </td>
 </tr>
</table>

<hr>

<input type='checkbox' value='1' {if $members_inherit_from_group} checked {/if}name='members_inherit_from_group'>&nbsp;{tr}Inherit all values to group members{/tr}
<input name="workgeneric_posted" value="1" type="hidden">
<hr>

<h3>{tr}Action{/tr}</h3>

{render acl=$FAIstateACL}
 <select size="1" name="saction" title="{tr}Select action to execute for this terminal{/tr}">
  <option>&nbsp;</option>
  {html_options options=$actions}
 </select>
{/render}
{render acl=$FAIstateACL}
 <button type='submit' name='action'>{tr}Execute{/tr}</button>
{/render}
