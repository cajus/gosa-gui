
<table style='width:100%;' summary="{tr}Anti virus setting{/tr}">
 <tr>
  <td colspan=2>
   <h3>{tr}Generic virus filtering{/tr}</h3>
  </td>
 </tr>
 <tr>
  <td>
   <table summary="{tr}Database setting{/tr}">
    <tr>
     <td>{tr}Database user{/tr}</td>
     <td>
      {render acl=$avUserACL}
       <input type='text' name='avUser' value='{$avUser}' style='width:220px;'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Database mirror{/tr}
     </td>
     <td>
      {render acl=$avDatabaseMirrorACL}
       <input type='text' name='avDatabaseMirror' value='{$avDatabaseMirror}' style='width:220px;'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}HTTP proxy URL{/tr}</td>
     <td>
      {render acl=$avHttpProxyURLACL}
       <input type='text' name='avHttpProxyURL' value='{$avHttpProxyURL}' style='width:220px;'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Maximum threads{/tr}
     </td>
     <td>
      {render acl=$avMaxThreadsACL}
       <select name="avMaxThreads" title='{tr}Select number of maximal threads{/tr}' size=1>
        {html_options options=$ThreadValues selected=$avMaxThreads}
       </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>
   <table summary="{tr}Database setting{/tr}">
    <tr>
     <td>{tr}Max directory recursions{/tr}</td>
     <td>
      {render acl=$avMaxDirectoryRecursionsACL}
       <input type='text' name='avMaxDirectoryRecursions' value='{$avMaxDirectoryRecursions}' >
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Checks per day{/tr}
     </td>
     <td>
      {render acl=$avChecksPerDayACL}
       <input type='text' name='avChecksPerDay' value='{$avChecksPerDay}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td colspan=2>
      {render acl=$avFlagsDACL}
       <input type='checkbox' name='avFlagsD' {$avFlagsDCHK} value='1'>
      {/render}{tr}Enable debugging{/tr}
     </td>
    </tr>
    <tr>
     <td colspan=2>
      {render acl=$avFlagsSACL}
       <input type='checkbox' name='avFlagsS' {$avFlagsSCHK} value='1'>
      {/render}{tr}Enable mail scanning{/tr}
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td colspan=2>
   <hr>
   <h3>{tr}Archive scanning{/tr}
   </h3>
  </td>
 </tr>
 <tr>
  <td>
   <table summary="{tr}Archive setting{/tr}">
    <tr>
     <td>
      {render acl=$avFlagsAACL}
       <input type='checkbox' name='avFlagsA' {$avFlagsACHK} value='1' 
        onClick=" changeState('avFlagsE') ; 				  
        changeState('avArchiveMaxFileSize') ; 				  
        changeState('avArchiveMaxRecursion') ; 				  
        changeState('avArchiveMaxCompressionRatio');">
      {/render}
      {tr}Enable scanning of archives{/tr}
     </td>
    </tr>
    <tr>
     <td>
      {render acl=$avFlagsEACL}
       <input type='checkbox' name='avFlagsE' {$avFlagsECHK} {$avFlagsAState} 
        value='1' id='avFlagsE'>
      {/render}{tr}Block encrypted archives{/tr}
     </td>
    </tr>
   </table>
  </td>
  <td style='width:50%;' class='left-border'>
   <table summary="{tr}Archive setting{/tr}">
    <tr>
     <td>{tr}Maximum file size{/tr}</td>
     <td>
      {render acl=$avArchiveMaxFileSizeACL}
       <input type='text' name='avArchiveMaxFileSize' id='avArchiveMaxFileSize' 
        value='{$avArchiveMaxFileSize}'
       {$avFlagsAState}>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Maximum recursion{/tr}
     </td>
     <td>
      {render acl=$avArchiveMaxRecursionACL}
       <input type='text' name='avArchiveMaxRecursion' id='avArchiveMaxRecursion' 
        value='{$avArchiveMaxRecursion}'
       {$avFlagsAState}>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Maximum compression ratio{/tr}
     </td>
     <td>
      {render acl=$avArchiveMaxCompressionRatioACL}
       <input type='text' name='avArchiveMaxCompressionRatio' id='avArchiveMaxCompressionRatio'
         value='{$avArchiveMaxCompressionRatio}'
       {$avFlagsAState}>
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<input type='hidden' name='goVirusServer' value='1'>

<hr>

<div class="plugin-actions">
 <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
 <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>
