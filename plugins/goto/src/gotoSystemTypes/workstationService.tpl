<table style="width:100%;" summary="{tr}Workstation service{/tr}">
 <tr>
  <td style='width:33%; '>

   <h3>{tr}Keyboard{/tr}</h3>
   <table summary="{tr}Keyboard{/tr}">
    <tr>
     <td><LABEL for="gotoXKbModel">{tr}Model{/tr}</LABEL></td>
     <td>

{render acl=$gotoXKbModelACL}
      <select id="gotoXKbModel" name="gotoXKbModel" title="{tr}Choose keyboard model{/tr}" size=1>
       {html_options options=$XKbModels selected=$gotoXKbModel_select}
      </select>
{/render}

     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXKbLayout">{tr}Layout{/tr}</LABEL></td>
     <td>

{render acl=$gotoXKbLayoutACL}
      <select id="gotoXKbLayout" name="gotoXKbLayout" title="{tr}Choose keyboard layout{/tr}" size=1>
       {html_options options=$XKbLayouts selected=$gotoXKbLayout_select}
      </select>
{/render}

     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXKbVariant">{tr}Variant{/tr}</LABEL></td>
     <td>

{render acl=$gotoXKbVariantACL}
      <select id="gotoXKbVariant" name="gotoXKbVariant" title="{tr}Choose keyboard variant{/tr}" size=1>
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
      <select name="gotoXMouseType" id="gotoXMouseType" title="{tr}Choose mouse type{/tr}" size=1>
       {html_options options=$MouseTypes selected=$gotoXMouseType_select}
      </select>
     </td>
{/render}

    </tr>
    <tr>
     <td><LABEL for="gotoXMouseport">{tr}Port{/tr}</LABEL></td>
     <td>

{render acl=$gotoXMouseportACL}
      <select id="gotoXMouseport" name="gotoXMouseport" title="{tr}Choose mouse port{/tr}" size=1>
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
      <select id="gotoXDriver" name="gotoXDriver" title="{tr}Choose graphic driver that is needed by the installed graphic board{/tr}" size=1>
       {html_options options=$XDrivers selected=$gotoXDriver_select}
      </select>
{/render}

     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXResolution">{tr}Resolution{/tr}</LABEL></td>
     <td>

{render acl=$gotoXResolutionACL}
      <select id="gotoXResolution" name="gotoXResolution" title="{tr}Choose screen resolution used in graphic mode{/tr}" size=1>
       {html_options options=$XResolutions selected=$gotoXResolution_select}
      </select>
{/render}

     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXColordepth">{tr}Color depth{/tr}</LABEL></td>
     <td>

{render acl=$gotoXColordepthACL}
      <select id="gotoXColordepth" name="gotoXColordepth" title="{tr}Choose color depth used in graphic mode{/tr}" size=1>
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
     <td>{if $gotoXMonitor==""}{tr}unknown{/tr}{/if}{$gotoXMonitor}</td>
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
	<input id="gotoXHsync" name="gotoXHsync" size=10 maxlength=60 {$hiddenState} type='text'
                value="{$gotoXHsync}" title="{tr}Horizontal refresh frequency for installed monitor{/tr}"> kHz
{/render}

     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoXVsync">{tr}Vertical synchronization{/tr}</LABEL></td>
     <td>

{render acl=$gotoXVsyncACL}
	<input id="gotoXVsync"  name="gotoXVsync" size=10 maxlength=60 {$hiddenState} type='text'
                value="{$gotoXVsync}" title="{tr}Vertical refresh frequency for installed monitor{/tr}"> Hz
{/render}

     </td>
    </tr>
   </table>

   </td>
  <td class='left-border'>

   &nbsp;
  </td>

  <td style='width:33%; '>

  

   <h3>{tr}Scan device{/tr}</h3>

{render acl=$gotoScannerEnableACL}
   <input type=checkbox name="gotoScannerEnable" value="1" title="{tr}Select to start SANE scan service on terminal{/tr}" {$gotoScannerEnable}>
{/render}

   {tr}Provide scan services{/tr}
	</td>
 </tr>
</table>

<input type='hidden' name='workservicePosted' value='1'>
<div style="height:40px;"></div>

<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('gotoXKbModel');
  -->
</script>




