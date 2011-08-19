<table summary="{tr}Application{/tr}" style="width:100%;">
 <tr>
  <td style="width:50%;">

   <table summary="{tr}Generic settings{/tr}">
     <tr>
      <td><LABEL for="cn">{tr}Application name{/tr}{$must}</LABEL></td>
      <td>
{render acl=$cnACL}
	<input type='text' id="cn" name="cn" value="{$cn}" title="{tr}Application name{/tr}">
{/render}
      </td>
    </tr>
    <tr>
     <td><LABEL for="gosaApplicationName">{tr}Display name{/tr}</LABEL></td>
     <td>
{render acl=$gosaApplicationNameACL}
        <input id="gosaApplicationName" name="gosaApplicationName" type="text"
	  value="{$gosaApplicationName}" title="{tr}Application name to be displayed (i.e. below icons){/tr}">
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gosaApplicationExecute">{tr}Execute{/tr}{$must}</LABEL></td>
     <td>
{render acl=$gosaApplicationExecuteACL}
        <input id="gosaApplicationExecute" name="gosaApplicationExecute" type="text"
	  value="{$gosaApplicationExecute}" title="{tr}Path and/or binary name of application{/tr}">
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
     <td>
{render acl=$descriptionACL}
      <input type='text' id="description" name="description" value="{$description}">
{/render}
     </td>
    </tr>
{if !$isReleaseApplikation}
   <tr>
    <td><br><LABEL for="base">{tr}Base{/tr}</LABEL>{$must}</td>
    <td>
     <br>
{render acl=$baseACL}
           {$base}
{/render}
     </td>
    </tr>
{/if}
   </table>
  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td>

   <table summary="{tr}Picture settings{/tr}">
    <tr>
    <td>
    <LABEL for="picture_file">{tr}Icon{/tr}</LABEL>
    <br>
{if $IconReadable}
    <img alt="" src="getbin.php?rand={$rand}" border=1 style="width:48px; height:48; background-color:white; vertical-align:bottom;">
{else}
	{image path="images/empty.png"}

{/if}
    </td>
    <td>

    &nbsp;<br>

    <input type="hidden" name="MAX_FILE_SIZE" value="100000">
{render acl=$gosaApplicationIconACL}
    <input name="picture_file" type="file" size="20" maxlength="255" accept="image/*.png" id="picture_file">
{/render}
{render acl=$gosaApplicationIconACL}
<button type='submit' name='update' title="{tr}Reload picture from LDAP{/tr}">{tr}Update{/tr}</button>

{/render}
{render acl=$gosaApplicationIconACL}
<button type='submit' name='remove_picture' title="{tr}Remove picture from LDAP{/tr}">{tr}Remove picture{/tr}</button>

{/render}
    </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<hr>

<h3>{tr}Options{/tr}</h3>
<table summary="{tr}Application options{/tr}" style="width:100%;">
  <tr>
    <td style='width:50%;' class='right-border'>

{render acl=$execForGroupmembersACL}
      <input type=checkbox name="execForGroupmembers" value="1" {$execForGroupmembers}>
{/render}
	{tr}Only executable for members{/tr}
      <br>
{render acl=$overwriteConfigACL}
      <input type=checkbox name="overwriteConfig" value="1" {$overwriteConfig}>
{/render}
	{tr}Replace user configuration on startup{/tr}
    </td>
    <td>
{render acl=$placeOnDesktopACL}
      <input type=checkbox name="placeOnDesktop" value="1" {$placeOnDesktop}>
{/render}
      {tr}Place icon on members desktop{/tr}
      <br>
{render acl=$placeInStartmenuACL}
      <input type=checkbox name="placeInStartmenu" value="1" {$placeInStartmenu}>
{/render}
      {tr}Place entry in members start menu{/tr}
      <br>
{render acl=$placeOnKickerACL}
      <input type=checkbox name="placeOnKicker" value="1" {$placeOnKicker}>
{/render}
      {tr}Place entry in members launch bar{/tr}
    </td>
  </tr>
</table>

<hr>

<table width="99%" summary="{tr}Log on script{/tr}">
	<tr>
		<td>
			<h3>{tr}Script{/tr}</h3>
{render acl=$gotoLogonScriptACL}
			<textarea name="gotoLogonScript" style='width:99%;height:220px;'>{$gotoLogonScript}</textarea>
{/render}
{render acl=$gotoLogonScriptACL}
			<input type="file" name="ScriptFile" value="{tr}Import{/tr}">
{/render}
{render acl=$gotoLogonScriptACL}
			<button type='submit' name='upLoad'>{tr}Upload{/tr}</button>

{/render}
			{image path="images/save.png" action="downloadScript" title="{tr}Download{/tr}"}

		</td>
	</tr>
</table>

<div style="height:20px;"></div>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
