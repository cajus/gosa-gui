<h3>{tr}User settings{/tr}</h3>

<table width="100%" summary="{tr}Paste user{/tr}">
 <tr>
 <td class="right-border" style="width:50%">
   <table width="100%" summary="{tr}Personal information{/tr}">
 	<tr>
 	  <td><label for="sn">{tr}Last name{/tr}</label></td>
 	  <td><input type='text' id="sn" name="sn" size=25 maxlength=60  value="{$sn}"></td>
 	</tr>
 	<tr>
 	  <td><label for="givenName">{tr}First name{/tr}</label></td>
 	  <td><input type='text' id="givenName" name="givenName" size=25 maxlength=60 value="{$givenName}"></td>
 	</tr>
 	<tr>
 	  <td><label for="uid">{tr}Login{/tr}</label></td>
 	  <td><input type='text' id="uid" name="uid" size=25 maxlength=60 value="{$uid}"></td>
 	</tr>
 	<tr>
 		<td>
 			{tr}Password{/tr}
 		</td>
 		<td>
 			<input type="radio" {if $passwordTodo=="clear"} checked{/if} name="passwordTodo" value="clear">{tr}Clear password{/tr}<br>
 			<input type="radio" {if $passwordTodo=="new"}   checked{/if} name="passwordTodo" value="new">{tr}Set new password{/tr}
 		</td>
 	</tr>
   </table>
 </td>
 <td>
  <table summary="{tr}The users picture{/tr}">
   <tr>
    <td style='width:147px; height:200px; background-color:gray;'>

     <img src="getbin.php?rand={$rand}" alt='' style='width:147px;' >
    </td>
   </tr>
  </table>
  <p>
   <input type="hidden" name="MAX_FILE_SIZE" value="2000000">
    <input id="picture_file" name="picture_file" type="file" size="20" maxlength="255" accept="image/*.jpg">
     &nbsp;
    <button type='submit' name='picture_remove'>{tr}Remove picture{/tr}</button>
   </p>
  </td>
 </tr>
</table>
<br>
