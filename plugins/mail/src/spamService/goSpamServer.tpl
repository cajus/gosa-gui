
<table style='width:100%' summary="{tr}Spam taggin{/tr}">
 <tr>
  <td style='width:50%;'>
   <h3>{tr}Spam tagging{/tr}</h3>
   <table summary="{tr}Spam taggin{/tr}">
    <tr>
     <td>{tr}Rewrite header{/tr}</td>
     <td>
      {render acl=$saRewriteHeaderACL}
       <input type='text' name='saRewriteHeader' value='{$saRewriteHeader}'>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Required score{/tr}</td>
     <td>
      {render acl=$saRequiredScoreACL}
       <select name='saRequiredScore' title='{tr}Select required score to tag mail as SPAM{/tr}' size=1>
        {html_options options=$SpamScore selected=$saRequiredScore}
       </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>
  
   <h3>Trusted networks</h3>

   <table width='100%' summary="{tr}Network settings{/tr}">
    <tr>
     <td>
      {render acl=$saTrustedNetworksACL}
       <select name='TrustedNetworks[]' size=4 style='width:100%;' multiple>
        {html_options options=$TrustedNetworks}
       </select>
       <br>
      {/render}
      {render acl=$saTrustedNetworksACL}
       <input type='text'	name='NewTrustName' value=''>&nbsp;
      {/render}
      {render acl=$saTrustedNetworksACL}
       <button type='submit' name='AddNewTrust'>{msgPool type=addButton}</button>
      {/render}
      {render acl=$saTrustedNetworksACL}
       <button type='submit' name='DelTrust'>{tr}Remove{/tr}</button>
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td colspan=2>
   <hr>
  </td>
 </tr>
 <tr>
  <td>
   <h3>{tr}Flags{/tr}</h3>
   <table summary="{tr}Flags{/tr}">
    <tr>
     <td>
      {render acl=$saFlagsBACL}
       <input type='checkbox' name='saFlagsB' value='1' {$saFlagsBCHK}> &nbsp;{tr}Enable use of Bayes filtering{/tr}
      {/render}
      <br>
      {render acl=$saFlagsbACL}
       <input type='checkbox' name='saFlagsb' value='1' {$saFlagsbCHK}> &nbsp;{tr}Enable Bayes auto learning{/tr}
      {/render}
      <br>
      {render acl=$saFlagsCACL}
       <input type='checkbox' name='saFlagsC' value='1' {$saFlagsCCHK}> &nbsp;{tr}Enable RBL checks{/tr}
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>
   <table summary="{tr}Flags{/tr}">
    <tr>
     <td>
      {render acl=$saFlagsRACL}
       <input type='checkbox' name='saFlagsR' value='1' {$saFlagsRCHK}> &nbsp;{tr}Enable use of Razor{/tr}
      {/render}
      <br>
      {render acl=$saFlagsDACL}
       <input type='checkbox' name='saFlagsD' value='1' {$saFlagsDCHK}> &nbsp;{tr}Enable use of DDC{/tr}
      {/render}
      <br>
      {render acl=$saFlagsPACL}
       <input type='checkbox' name='saFlagsP' value='1' {$saFlagsPCHK}> &nbsp;{tr}Enable use of Pyzor{/tr}
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td colspan=2>
   <hr>
  </td>
 </tr>
 <tr>
  <td colspan='2'>
   <h3>{tr}Rules{/tr}</h3>

   <table width='100%' summary="{tr}Rules{/tr}">
    <tr>
     <td>
      {$ruleList}
      <br>
      {render acl=$saTrustedNetworksACL}
       <button type='submit' name='AddRule'>{msgPool type=addButton}</button>
      {/render}
     </td>
    </tr>
   </table>

  </td>
 </tr>
</table>

<input type='hidden' value='1' name='goSpamServer'>

<hr>

<div class="plugin-actions">
  <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
  <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>
