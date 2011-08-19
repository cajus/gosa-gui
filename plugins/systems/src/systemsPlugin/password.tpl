<script type="text/javascript" src="include/pwdStrength.js"></script>
<p>
 {tr}To change the terminal root password use the fields below. The changes take effect during the next reboot. Please memorize the new password, because you wouldn't be able to log in.{/tr}
</p>
<p>
 <b>{tr}Leave fields blank for password inheritance from default entries.{/tr}</b>
</p>

<p>
 {tr}Changing the password impinges on authentication only.{/tr}
</p>

<table summary="{tr}System password change{/tr}">

  <tr>
    <td><b><LABEL for="new_password">{tr}New password{/tr}</LABEL></b></td>
    <td>
        {factory type='password' id='new_password' name='new_password'
            onkeyup="testPasswordCss(\$('new_password').value);" onfocus="nextfield='repeated_password';"}
    </td>
  </tr>
  <tr>
    <td><b><LABEL for="repeated_password">{tr}Repeat new password{/tr}</LABEL></b></td>
    <td>
        {factory type='password' id='repeated_password' name='repeated_password'
            onfocus="nextfield='password_finish'"}
    </td>
  </tr>
  <tr>
       <td>{tr}Password strength{/tr}</td>
       <td>
        <span id="meterEmpty" style="padding:0;margin:0;width:100%;background-color:#DC143C;display:block;height:5px;">
        <span id="meterFull" style="padding:0;margin:0;z-index:100;width:0;background-color:#006400;display:block;height:5px;"></span></span>
       </td>
      </tr>
 
</table>

<hr>
<div class="plugin-actions">
  <button type='submit' id='password_finish'name='password_finish'>{tr}Set password{/tr}</button>
  <button type='submit' id='password_cancel'name='password_cancel'>{msgPool type=cancelButton}</button>
</div>


<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">	
  <!-- // First input field on page
  	nextfield= 'new_password';
	focus_field('new_password');
  -->
</script>
