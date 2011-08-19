<table style="width:100%;" summary="{tr}Terminal service{/tr}">
 <tr>
  <td style='width:33%; '>

   <h3>{tr}Keyboard{/tr}</h3>
   <table summary="{tr}Keyboard settings{/tr}">
    <tr>
     <td><LABEL for="gotoXKbModel">{tr}Model{/tr}</LABEL></td>
     <td>
{render acl=$gotoXKbModelACL}
      <select id="gotoXKbModel" name="gotoXKbModel" title="{tr}Choose keyboard model{/tr}"  size=1>
       {html_options options=$XKbModels selected=$gotoXKbModel_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXKbLayout">{tr}Layout{/tr}</LABEL></td>
     <td>
{render acl=$gotoXKbLayoutACL}
      <select id="gotoXKbLayout" name="gotoXKbLayout" title="{tr}Choose keyboard layout{/tr}"  size=1>
       {html_options options=$XKbLayouts selected=$gotoXKbLayout_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXKbVariant">{tr}Variant{/tr}</LABEL></td>
     <td>
{render acl=$gotoXKbVariantACL}
      <select id="gotoXKbVariant" name="gotoXKbVariant" title="{tr}Choose keyboard variant{/tr}"  size=1>
       {html_options options=$XKbVariants selected=$gotoXKbVariant_select}
      </select>
{/render}
     </td>
    </tr>
   </table>

  </td>

  <td class='left-border'>

   &nbsp;
  </td>
  
  <td style='width:32%'>

   <h3>{tr}Mouse{/tr}</h3>
   <table summary="{tr}Mouse{/tr}">
    <tr>
     <td><LABEL for="gotoXMouseType">{tr}Type{/tr}</LABEL></td>
     <td>
{render acl=$gotoXMouseTypeACL}
      <select name="gotoXMouseType" id="gotoXMouseType" title="{tr}Choose mouse type{/tr}"  size=1>
       {html_options options=$MouseTypes selected=$gotoXMouseType_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXMouseport">{tr}Port{/tr}</LABEL></td>
     <td>
{render acl=$gotoXMouseportACL}
      <select id="gotoXMouseport" name="gotoXMouseport" title="{tr}Choose mouse port{/tr}"  size=1>
       {html_options options=$MousePorts selected=$gotoXMouseport_select}
      </select>
{/render}
     </td>
    </tr>
   </table>

  </td>

  <td class='left-border'>

   &nbsp;
  </td>
  
  <td style='width:33%'>

   <h3>{tr}Telephone hardware{/tr}</h3>
   <table style="width:100%" border=0 summary="{tr}Telephone hardware{/tr}">
    <tr>
     <td>{tr}Telephone{/tr}&nbsp;
{render acl=$goFonHardwareACL}
	  {$hardware_list}
{/render}
     </td>
    </tr>
   </table>

  </td>
 </tr>
</table>

    <hr>
<table style="width:100%;" summary="{tr}Graphic device{/tr}">
 <tr>
   <td style='width:33%;'>

   <h3>{tr}Graphic device{/tr}</h3>
   <table summary="{tr}Graphic device{/tr}">
    <tr>
     <td><LABEL for="gotoXDriver">{tr}Driver{/tr}</LABEL></td>
     <td>
{render acl=$gotoXDriverACL}
      <select id="gotoXDriver" name="gotoXDriver" title="{tr}Choose graphic driver that is needed by the installed graphic board{/tr}"  size=1>
       {html_options options=$XDrivers selected=$gotoXDriver_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXResolution">{tr}Resolution{/tr}</LABEL></td>
     <td>
{render acl=$gotoXResolutionACL}
      <select id="gotoXResolution" name="gotoXResolution" title="{tr}Choose screen resolution used in graphic mode{/tr}"  size=1>
       {html_options options=$XResolutions selected=$gotoXResolution_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXColordepth">{tr}Color depth{/tr}</LABEL></td>
     <td>
{render acl=$gotoXColordepthACL}
      <select id="gotoXColordepth" name="gotoXColordepth" title="{tr}Choose color depth used in graphic mode{/tr}"  size=1>
       {html_options options=$XColordepths selected=$gotoXColordepth_select}
      </select>
{/render}
     </td>
    </tr>
   </table>
   </td>

  <td class='left-border'>

   &nbsp;
  </td>

   <td style='width:32%; '>

   <h3>{tr}Display device{/tr}</h3>
   <table summary="{tr}Display device{/tr}">
    <tr>
     <td>{tr}Type{/tr}</td>
     <td>{$gotoXMonitor}</td>
    </tr>
    <tr>
     <td>
{render acl=$AutoSyncACL}
      <input type="checkbox" name="AutoSync" value="1" {$AutoSyncCHK} onChange="changeState('gotoXHsync');changeState('gotoXVsync');">
{/render}
     </td>
     <td>{tr}Use DDC for automatic detection{/tr}</td>
    </tr>
    <tr>
     <td><LABEL for="gotoXHsync">{tr}Horizontal synchronization{/tr}</LABEL></td>
     <td>
{render acl=$gotoXHsyncACL}
	<input id="gotoXHsync" name="gotoXHsync" size=10 maxlength=60 type='text' 
                value="{$gotoXHsync}" title="{tr}Horizontal refresh frequency for installed monitor{/tr}"> kHz</td>
{/render}
    </tr>
    <tr>
     <td><LABEL for="gotoXVsync">{tr}Vertical synchronization{/tr}</LABEL></td>
     <td>
{render acl=$gotoXVsyncACL}
      <input id="gotoXVsync"  name="gotoXVsync" size=10 maxlength=60 type='text'
                value="{$gotoXVsync}" title="{tr}Vertical refresh frequency for installed monitor{/tr}"> Hz</td>
{/render}
    </tr>
   </table>

   </td>
  <td class='left-border'>

   &nbsp;
  </td>

  <td style='width:33%; '>

   <h3>{tr}Remote desktop{/tr}</h3>
   <table summary="{tr}Remote desktop{/tr}">
    <tr>
     <td></td>
     <td><LABEL for="gotoXMethod">{tr}Connect method{/tr}</LABEL></td>
     <td>
{render acl=$gotoXMethodACL}
      <select name="gotoXMethod" id="gotoXMethod" title="{tr}Choose method to connect to terminal server{/tr}" 
			onChange="document.mainform.submit();">
       {html_options options=$XMethods selected=$gotoXMethod_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td></td>
     <td colspan=2>
     <LABEL for="gotoXdmcpServer">{tr}Terminal server{/tr}</LABEL><br>
{render acl=$gotoXdmcpServerACL}
      <select name="selected_xdmcp_servers[]" multiple style="width:280px; height:60px;" {if $gotoXMethod_select == "default"} disabled {/if} size=1>
		{if $gotoXMethod_select == "default"}
			{html_options values=$inherited_xdmcp_servers output=$inherited_xdmcp_servers}
		{else}
       		{html_options options=$selected_xdmcp_servers}
		{/if}
      </select><br>
{/render}
{render acl=$gotoXdmcpServerACL}
      <select name="gotoXdmcpServer_add" title="{tr}Select specific terminal server to use{/tr}" 
		{if $gotoXMethod_select == "default"} disabled {/if}  >
	     {html_options values=$available_xdmcp_servers output=$available_xdmcp_servers}
      </select>
{/render}
{render acl=$gotoXdmcpServerACL}
	<button type='submit' name='XdmcpAddServer' title="{tr}Add selected server{/tr}"
		{if $gotoXMethod_select == "default"} disabled {/if}
        >{msgPool type=addButton}</button>
{/render}
{render acl=$gotoXdmcpServerACL}
	<button type='submit' name='XdmcpDelServer' title="{tr}Remove selected server{/tr}"
		{if $gotoXMethod_select == "default"} disabled {/if}
        >{tr}Remove{/tr}</button>
{/render}

     </td>
    </tr>
   </table>
   
  </td>
 </tr>
</table>

   <hr>
<table style="width:100%;" summary="{tr}Scan device{/tr}">
 <tr>
  <td style='width:50%;'>

   <h3>{tr}Scan device{/tr}</h3>
{render acl=$gotoScannerEnableACL}
   <input type=checkbox name="gotoScannerEnable" value="1" title="{tr}Select to start SANE scan service on terminal{/tr}" {$gotoScannerEnable} >
{/render}
   {tr}Provide scan services{/tr}

  	</td>
	<td class='left-border'>

	<td >&nbsp;
	</td>
	<td>
   		<h3>{tr}Printer{/tr}</h3>
		{$gotoLpdEnable_dialog}
	</td>
 </tr>
</table>

<div style="height:40px;"></div>
