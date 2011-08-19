<h3>{tr}Policy settings{/tr}</h3>

<table style="width:100%" summary="{tr}Kerberos policy{/tr}">
 <tr>
  <td class='right-border'>

   <table style="width:100%" summary="{tr}Kerberos policy{/tr}">
    <tr>
     <td>{tr}Policy name{/tr}{$must}</td>
     <td><input type="text" name="name" value="{$name}"></td>
    </tr>
    <tr>
     <td>{tr}Minimum password length{/tr}</td>
     <td><input type="text" name="PW_MIN_LENGTH" value="{$PW_MIN_LENGTH}"></td>
    </tr>
    <tr>
     <td>{tr}Required different characters{/tr}</td>
     <td><input type="text" name="PW_MIN_CLASSES" value="{$PW_MIN_CLASSES}"></td>
    </tr>
    <tr>
     <td>{tr}Password history size{/tr}</td>
     <td><input type="text" name="PW_HISTORY_NUM" value="{$PW_HISTORY_NUM}"></td>
    </tr>
   </table>

  </td>
  <td>

   <table style="width:100%" summary="{tr}Kerberos policy{/tr}">
    <tr>
     <td>
       <td>{tr}Minimum password lifetime{/tr}</td>
       <td><input type="text" name="PW_MIN_LIFE" value="{$PW_MIN_LIFE}">&nbsp;{tr}seconds{/tr}</td>
     </tr>
     <tr>
       <td>{tr}Password lifetime{/tr}</td>
       <td><input type="text" name="PW_MAX_LIFE" value="{$PW_MAX_LIFE}">&nbsp;{tr}seconds{/tr}</td>
     </tr>
   </table>

  </td>
 </tr>
 <tr>
  <td colspan="2">
   <br>
   {$POLICY_REFCNT}
  </td>
 </tr>
</table>

<input type="hidden" name="Policy_Posted" value="1">
<hr>

<div class="plugin-actions">
 <button type='submit' name='save_policy'>{msgPool type=okButton}</button>
 <button type='submit' name='cancel_policy'>{msgPool type=cancelButton}</button>
</div>
