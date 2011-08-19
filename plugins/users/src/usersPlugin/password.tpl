<script type="text/javascript" src="include/pwdStrength.js"></script>

<p>
 {tr}To change the user password use the fields below. The changes take effect immediately. Please memorize the new password, because the user wouldn't be able to login without it.{/tr}
</p>

<hr>

{if !$proposalEnabled}

  <table summary="{tr}Password input dialog{/tr}" cellpadding=4 border=0>
    <tr>
      <td><b><LABEL for="new_password">{tr}New password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' id='new_password' name='new_password' 
              onfocus="nextfield='repeated_password';" onkeyup="testPasswordCss(\$('new_password').value);"}
      </td>
    </tr>
    <tr>
      <td><b><LABEL for="repeated_password">{tr}Repeat new password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' id='repeated_password' name='repeated_password'
              onfocus="nextfield='password_finish';"}
      </td>
    </tr>
    <tr>
      <td><b>{tr}Strength{/tr}</b></td>
      <td>
        <span id="meterEmpty" style="padding:0;margin:0;width:100%;
          background-color:#DC143C;display:block;height:7px;">
        <span id="meterFull" style="padding:0;margin:0;z-index:100;width:0;
          background-color:#006400;display:block;height:7px;"></span></span>
      </td>
    </tr>
  </table>

{else}

  <table summary="{tr}Password input dialog{/tr}" cellpadding=4 border=0>
    <tr>
      <td>
        <input type='radio' value='1' name='proposalSelected' id='proposalSelected_true' onClick='updateFields();'
            {if $proposalSelected} checked {/if}>&nbsp;<b><LABEL for="proposalSelected_true">{tr}Use proposal{/tr}</LABEL></b>
      </td>
      <td>
        <div id='proposalText' style='
                  width:180px;
                  border:1px solid #CCC;
                  padding:3px;
                  padding-top:5px;
                  padding-bottom:4px;
            '>{$proposal}</div>
      </td>
      <td style='vertical-align: middle;'>
            {image path='images/lists/reload.png' action='refreshProposal'}
      </td>
    </tr>
    <tr>
      <td>
        <input type='radio' value='0' name='proposalSelected' id='proposalSelected_false' onClick='updateFields();'
            {if !$proposalSelected} checked {/if}>&nbsp;<b><LABEL for="proposalSelected_false">{tr}Manually specify a password{/tr}</LABEL></b>
      </td>
    </tr>
    <tr>
      <td style='padding-left:40px;'><b><LABEL for="new_password">{tr}New password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' id='new_password' name='new_password' 
              onfocus="nextfield='repeated_password';" onkeyup="testPasswordCss(\$('new_password').value);"}
      </td>
    </tr>
    <tr>
      <td style='padding-left:40px;'><b><LABEL for="repeated_password">{tr}Repeat new password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' id='repeated_password' name='repeated_password'
              onfocus="nextfield='password_finish';"}
      </td>
    </tr>
    <tr>
      <td style='padding-left:40px;'><b>{tr}Strength{/tr}</b></td>
      <td>
        <span id="meterEmpty" style="padding:0;margin:0;width:100%;
          background-color:#DC143C;display:block;height:7px;">
        <span id="meterFull" style="padding:0;margin:0;z-index:100;width:0;
          background-color:#006400;display:block;height:7px;"></span></span>
      </td>
    </tr>
  </table>

{/if}

{if $passwordChangeForceable}
    <hr>
    <input type='checkbox' name='enforcePasswordChange' value='1' id='enforcePasswordChange'
        {if $enforcePasswordChange} checked {/if}>&nbsp;
            <LABEL for='enforcePasswordChange'>{tr}Enforce password change on next login.{/tr}</LABEL>
{/if}

<br>
<hr>
<div class="plugin-actions">
  <button type='submit' id='password_finish'name='password_finish'>{tr}Set password{/tr}</button>
  <button type='submit' id='password_cancel'name='password_cancel'>{msgPool type=cancelButton}</button>
</div>

<input type='hidden' id='formSubmit'>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  	nextfield= "new_password";
	focus_field('new_password');

    function updateFields()
    {
        if($('proposalSelected').checked){
            $('new_password').disable();
            $('repeated_password').disable();
            $('proposalText').setStyle(
                 'background-color:#FFF;' +
                 'color:#000;' +
                 'width:180px;' +
                 'border:1px solid #CCC;' +
                 'padding:3px;' +
                 'padding-top:5px;' +
                 'padding-bottom:4px;');
        }else{
            $('new_password').enable();
            $('repeated_password').enable();
            $('proposalText').setStyle(
                 'background-color:#F0F0F0;' +
                 'color:#666;' +
                 'width:180px;' +
                 'border:1px solid #CCC;' +
                 'padding:3px;' +
                 'padding-top:5px;' +
                 'padding-bottom:4px;');
        }
    }
    updateFields();
</script>


