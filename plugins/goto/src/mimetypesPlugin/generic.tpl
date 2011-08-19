
<h3>{tr}Generic{/tr}</h3>

<table style="width:100%" summary="{tr}Mime-type generic{/tr}">
 <tr>
  <td style='width:50%; '>
 
   <table summary="{tr}Mime-type settings{/tr}">
    <tr>
     <td>{tr}Mime type{/tr}{$must}</td>
     <td>
      {render acl=$cnACL}
       <input type="text" name='cn' value="{$cn}" title='{tr}Please enter a name for the mime-type here{/tr}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Mime-group{/tr}</td>
     <td>
      {render acl=$gotoMimeGroupACL}
       <select name='gotoMimeGroup' title='{tr}Categorize this mime type{/tr}' size=1>
        {html_options output=$gotoMimeGroups values=$gotoMimeGroups selected=$gotoMimeGroup}
       </select>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Description{/tr}</td>
     <td>
      {render acl=$descriptionACL}
       <input type="text" name='description' value="{$description}" title='{tr}Please specify a description{/tr}'>
      {/render}
     </td>
    </tr>
    
    {if !$isReleaseMimeType}
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

   <table summary="{tr}Picture settings{/tr}">
    <tr>
     <td>
      <LABEL for="picture_file">{tr}Icon{/tr}</LABEL>
      <br>
      {if $IconReadable}
       <img src="{$gotoMimeIcon}" border=1 alt='{tr}Mime-icon{/tr}' 
         style="width:48px; height:48; background-color:white; vertical-align:bottom;">
       {else}
       {image path="images/empty.png"}
      {/if}
     </td>
     <td>&nbsp;
      <br>
      <input type="hidden" name="MAX_FILE_SIZE" value="1000000">
      {render acl=$gotoMimeIconACL}
       <input name="picture_file" type="file" size="20" maxlength="255" 							
        accept="image/*.png" id="picture_file">
      {/render}
      {render acl=$gotoMimeIconACL}
       <button type='submit' name='update_icon'title="{tr}Update mime type icon{/tr}">{tr}Update{/tr}</button>
      {/render}
     </td>
    </tr>
   </table>

  </td>
 </tr>
 <tr>
  <td colspan="2">

   <hr>

  </td>
 </tr>
 <tr>
  <td colspan="2">
   <h3>{tr}Left click{/tr}</h3>
  </td>
 </tr>
 <tr>
  <td style='width:50%; '>
    
   {tr}File patterns{/tr}{$must}

   {render acl=$gotoMimeFilePatternACL}
    {$gotoMimeFilePatterns}
   {/render}
   {render acl=$gotoMimeFilePatternACL}
    <input type='text'	 name='NewFilePattern'	  value='' title='{tr}Please specify a new file pattern{/tr}'>
   {/render}
   {render acl=$gotoMimeFilePatternACL}
    <button type='submit' name='AddNewFilePattern' title="{tr}Add a new file pattern{/tr}">
    {msgPool type=addButton}</button>
   {/render}

  </td>
  <td class='left-border'>

   {tr}Applications{/tr}

   {render acl=$gotoMimeApplicationACL}
    {$gotoMimeApplications}
   {/render}
   {render acl=$gotoMimeApplicationACL}
    <select name="NewApplicationSelect" size=1><option value="">-</option>
     {html_options options=$ApplicationList}
    </select>
   {/render}
   {render acl=$gotoMimeApplicationACL}
    <input type='text'	 name='NewApplication'	  value='' title='{tr}Enter an application name here{/tr}'>
   {/render}
   {render acl=$gotoMimeApplicationACL}
    <button type='submit' name='AddNewApplication' title="{tr}Add application{/tr}">
    {msgPool type=addButton}</button>
   {/render}

  </td>
 </tr>
 <tr>
  <td colspan="2">

   <hr>

  </td>
 </tr>
 <tr>
  <td colspan="2">

   <h3>{tr}Embedding{/tr}</h3>

  </td>
 </tr>
 <tr>
  <td style='width:50%; '>

   {render acl=$gotoMimeLeftClickActionACL}
    <input type='radio' name='gotoMimeLeftClickAction_IE' value='I' 							
       {if $gotoMimeLeftClickAction_I} checked {/if}>
   {/render}{tr}Show file in embedded viewer{/tr}
   <br>
   {render acl=$gotoMimeLeftClickActionACL}
    <input type='radio' name='gotoMimeLeftClickAction_IE' value='E' 							
       {if $gotoMimeLeftClickAction_E} checked {/if}>
   {/render}{tr}Show file in external viewer{/tr}
   <br>
   {render acl=$gotoMimeLeftClickActionACL}
    <input type='checkbox' name='gotoMimeLeftClickAction_Q' value='1' 							
       {if $gotoMimeLeftClickAction_Q} checked {/if}>
   {/render}{tr}Ask whether to save to local disk{/tr}

  </td>
  <td class='left-border'>

   {tr}Applications{/tr}
   {render acl=$gotoMimeEmbeddedApplicationACL}
    {$gotoMimeEmbeddedApplications}
   {/render}
   {render acl=$gotoMimeEmbeddedApplicationACL}
    <select name="NewEmbeddedApplicationSelect" size=1><option value="">-</option>
     {html_options options=$ApplicationList}
    </select>
   {/render}
   {render acl=$gotoMimeEmbeddedApplicationACL}
    <input type='text' name='NewEmbeddedApplication' value=''	title='{tr}Enter an application name here{/tr}'>
   {/render}
   {render acl=$gotoMimeEmbeddedApplicationACL}
    <button type='submit' name='AddNewEmbeddedApplication' 
      title='{tr}Add application{/tr}'>{msgPool type=addButton}</button>
   {/render}

  </td>
 </tr>
</table>
<input type="hidden" name="MimeGeneric" value="1"><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!-- // First input field on page	focus_field('cn');  --></script>
