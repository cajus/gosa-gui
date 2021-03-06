<script type="text/javascript" src="include/pwdStrength.js"></script>

<p>
  {tr}To change your personal password use the fields below. The changes take effect immediately. Please memorize the new password, because you wouldn't be able to login without it.{/tr}
</p>

<hr>

{if !$proposalEnabled}
  <table cellpadding=4 border=0 summary="{tr}Password change dialog{/tr}">
    <tr>
      <td><b><LABEL for="current_password">{tr}Current password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' name='current_password' id='current_password' onfocus="nextfield= 'new_password';"}
      </td>
    </tr>
    <tr>
      <td><b><LABEL for="new_password">{tr}New password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' name='new_password' id='new_password' 
              onkeyup="testPasswordCss(\$('new_password').value)"  onfocus="nextfield= 'repeated_password';"}
      </td>
    </tr>
    <tr>
      <td><b><LABEL for="repeated_password">{tr}Repeat new password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' name='repeated_password' id='repeated_password' onfocus="nextfield= 'password_finish';"}
      </td>
    </tr>
    <tr>
      <td><b>{tr}Password strength{/tr}</b></td>
      <td>
      <span id="meterEmpty" style="padding:0;margin:0;width:100%;background-color:#DC143C;display:block;height:7px;">
      <span id="meterFull" style="padding:0;margin:0;z-index:100;width:0;background-color:#006400;display:block;height:7px;"></span></span>
      </td>
    </tr>
  </table>
{else}
  <table cellpadding=4 border=0 summary="{tr}Password change dialog{/tr}">
    <tr>
      <td><b><LABEL for="current_password">{tr}Current password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' name='current_password' id='current_password' onfocus="nextfield= 'new_password';"}
      </td>
    </tr>
    <tr>
      <td>
        <input type='radio' value='1' name='proposalSelected' id='proposalSelected_true'
            {if $proposalSelected} checked {/if}>&nbsp;<b><LABEL for="proposalSelected_true">{tr}Use proposal{/tr}</LABEL></b>
      </td>
      <td>
        <div style='
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
        <input type='radio' value='0' name='proposalSelected' id='proposalSelected_false'
            {if !$proposalSelected} checked {/if}>&nbsp;<b><LABEL for="proposalSelected_false">{tr}Manually specify a password{/tr}</LABEL></b>
      </td>
    </tr>
    <tr>
      <td style='padding-left:40px;'><b><LABEL for="new_password">{tr}New password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' name='new_password' id='new_password' 
              onkeyup="testPasswordCss(\$('new_password').value)"  onfocus="nextfield= 'repeated_password';"}
      </td>
    </tr>
    <tr>
      <td style='padding-left:40px;'><b><LABEL for="repeated_password">{tr}Repeat new password{/tr}</LABEL></b></td>
      <td>
          {factory type='password' name='repeated_password' id='repeated_password' onfocus="nextfield= 'password_finish';"}
      </td>
    </tr>
    <tr>
      <td  style='padding-left:40px;'><b>{tr}Password strength{/tr}</b></td>
      <td>
      <span id="meterEmpty" style="padding:0;margin:0;width:100%;background-color:#DC143C;display:block;height:7px;">
      <span id="meterFull" style="padding:0;margin:0;z-index:100;width:0;background-color:#006400;display:block;height:7px;"></span></span>
      </td>
    </tr>
  </table>
{/if}
<br>

<hr>
<div class="plugin-actions">
  <button type='submit' name='password_finish'>{tr}Set password{/tr}</button>
  <button type=reset id="password_cancel" name="password_cancel">{tr}Clear fields{/tr}</button>
</div>

<input type='hidden' id='formSubmit'>

<input type="hidden" name="ignore">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
  nextfield= 'current_password';
	focus_field('current_password');
  -->
</script>

