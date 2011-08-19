

{if $si_error}
 <h3>{tr}Kerberos options{/tr}</h3>
 <p>
  {msgPool type=siError p1=$si_error_msg}
 </p>

 <button type='submit' name='retry_si'>{tr}Retry{/tr}</button>
 
 <div class="plugin-actions">
  <button type='submit' name='pw_abort'>{tr}Cancel{/tr}</button>
 </div>

 {else}

 <table style="width:100%;" summary="{tr}Policy settings{/tr}">
  <tr>
   <td style='width:50%;'>
    <h3>{tr}Kerberos options{/tr}</h3>

    <table style="width:100%;" summary="{tr}Policy settings{/tr}">
     <tr>
      <td><label for="goKrbRealm">{tr}Realm{/tr}</label></td>
      <td>
       <select name="goKrbRealm" onChange="document.mainform.submit();" size=1>
        {foreach from=$server_list item=item key=key}
         {if $item.goKrbRealm==$goKrbRealm}
         <option selected value="{$item.goKrbRealm}">
          {$item.goKrbRealm}</option>
         {else}
          <option value="{$item.goKrbRealm}">
          {$item.goKrbRealm}</option>
         {/if}
        {/foreach}
       </select>
      </td>
     </tr>
     <tr>
      <td>
       <label for="POLICY">{tr}Policy{/tr}</label>
      </td>
      <td>
       <select name="POLICY" size=1>
        {foreach from=$POLICIES item=item key=key}
         {if $POLICY==$item}
          <option selected value="{$key}">
          {$item}</option>
         {else}
          <option value="{$key}">
          {$item}</option>
         {/if}
        {/foreach}
       </select>
      </td>
     </tr>
     <tr>
      <td><label for="MAX_LIFE">{tr}Ticket max life{/tr}</label></td>
      <td>
       <input id="MAX_LIFE" type="text" name="MAX_LIFE" value="{$MAX_LIFE}">
      </td>
     </tr>
     <tr>
      <td><label for="MAX_RENEWABLE_LIFE">{tr}Ticket max renew{/tr}</label></td>
      <td>
       <input id="MAX_RENEWABLE_LIFE" type="text" name="MAX_RENEWABLE_LIFE" value="{$MAX_RENEWABLE_LIFE}">
      </td>
     </tr>
    </table>
    <hr>
    <table summary="{tr}Ticket max renew{/tr}">
     <tr>
      <td></td>
      <td style="width:40px;"><i>{tr}infinite{/tr}</i></td>
      <td><i>{tr}Hour{/tr}</i></td>
      <td style="width:60px;"><i>{tr}Minute{/tr}</i></td>
      <td><i>{tr}Day{/tr}</i></td>
      <td><i>{tr}Month{/tr}</i></td>
      <td><i>{tr}Year{/tr}</i></td>
     </tr>
     <tr>
      <td><label for="PRINC_EXPIRE_TIME">{tr}Valid ticket end time{/tr}</label></td>
      <td>
       <input type="checkbox" name="PRINC_EXPIRE_TIME_clear" 							
          onClick="	
            changeState('PRINC_EXPIRE_TIME_y');									  	
            changeState('PRINC_EXPIRE_TIME_m');									  	
            changeState('PRINC_EXPIRE_TIME_d');									  	
            changeState('PRINC_EXPIRE_TIME_h');									  	
            changeState('PRINC_EXPIRE_TIME_i');"							
          {if $PRINC_EXPIRE_TIME_clear} checked {/if}>
      </td>
      <td>
       <select name="PRINC_EXPIRE_TIME_h" id="PRINC_EXPIRE_TIME_h" {if $PRINC_EXPIRE_TIME_clear} disabled {/if}size=1>
        {html_options options=$hours selected=$PRINC_EXPIRE_TIME_h}
       </select>
      </td>
      <td>
       <select name="PRINC_EXPIRE_TIME_i" id="PRINC_EXPIRE_TIME_i" {if $PRINC_EXPIRE_TIME_clear} disabled {/if}size=1>
        {html_options options=$minutes selected=$PRINC_EXPIRE_TIME_i}
       </select>
      </td>
      <td>
       <select name="PRINC_EXPIRE_TIME_d" id="PRINC_EXPIRE_TIME_d" {if $PRINC_EXPIRE_TIME_clear} disabled {/if}size=1>
        {html_options options=$days selected=$PRINC_EXPIRE_TIME_d}
       </select>
      </td>
      <td>
       <select name="PRINC_EXPIRE_TIME_m" id="PRINC_EXPIRE_TIME_m" {if $PRINC_EXPIRE_TIME_clear} disabled {/if}size=1>
        {html_options options=$month selected=$PRINC_EXPIRE_TIME_m}
       </select>
      </td>
      <td>
       <select name="PRINC_EXPIRE_TIME_y" id="PRINC_EXPIRE_TIME_y" {if $PRINC_EXPIRE_TIME_clear} disabled {/if}size=1>
        {html_options options=$years selected=$PRINC_EXPIRE_TIME_y}
       </select>
      </td>
     </tr>
     <tr>
      <td><label for="PW_EXPIRATION">{tr}Password expires{/tr}</label></td>
      <td>  
       <input type="checkbox" name="PW_EXPIRATION_clear" 							
        onClick="	
         changeState('PW_EXPIRATION_y');									  	
         changeState('PW_EXPIRATION_m');									  	
         changeState('PW_EXPIRATION_d');									  	
         changeState('PW_EXPIRATION_h');									  	
         changeState('PW_EXPIRATION_i');"							
        {if $PW_EXPIRATION_clear} checked {/if}>
      </td>
      <td>
        <select name="PW_EXPIRATION_h" id="PW_EXPIRATION_h" {if $PW_EXPIRATION_clear} disabled {/if}size=1>
         {html_options options=$hours selected=$PW_EXPIRATION_h}
        </select>
      </td>
      <td>
       <select name="PW_EXPIRATION_i" id="PW_EXPIRATION_i" {if $PW_EXPIRATION_clear} disabled {/if}size=1>
        {html_options options=$minutes selected=$PW_EXPIRATION_i}
       </select>
      </td>
      <td>
       <select name="PW_EXPIRATION_d" id="PW_EXPIRATION_d" {if $PW_EXPIRATION_clear} disabled {/if}size=1>
        {html_options options=$days selected=$PW_EXPIRATION_d}
       </select>
      </td>
      <td>
       <select name="PW_EXPIRATION_m" id="PW_EXPIRATION_m" {if $PW_EXPIRATION_clear} disabled {/if}size=1>
        {html_options options=$month selected=$PW_EXPIRATION_m}
       </select>
      </td>
      <td>
       <select name="PW_EXPIRATION_y" id="PW_EXPIRATION_y" {if $PW_EXPIRATION_clear} disabled {/if}size=1>
        {html_options options=$years selected=$PW_EXPIRATION_y}
       </select>
      </td>
     </tr>
    </table>

    <hr>
    <h3>{tr}Status{/tr}</h3>

    <table summary="{tr}Generic{/tr}">
     <tr>
      <td>{tr}Failed logins{/tr}</td>
      <td><i>{if !$FAIL_AUTH_COUNT}{tr}none{/tr}{else}{$FAIL_AUTH_COUNT}{/if}</i></td>
     </tr>
     <tr>
      <td>{tr}Key version number{/tr}</td>
      <td><i>{$KVNO}&nbsp;</i></td>
     </tr>
     <tr>
      <td>{tr}Last failed login{/tr}</td>
      <td><i>{if !$LAST_FAILED}{tr}none{/tr}{else}{$LAST_FAILED|date_format:"%d.%m.%Y %H:%m:%S"}{/if}</i></td>
     </tr>
     <tr>
      <td>{tr}Last password change{/tr}</td>
      <td><i>{if !$LAST_PWD_CHANGE}{tr}none{/tr}{else}{$LAST_PWD_CHANGE|date_format:"%d.%m.%Y %H:%m:%S"}{/if}</i></td>
     </tr>
     <tr>
      <td>{tr}Last successful login{/tr}</td>
      <td><i>{if !$LAST_SUCCESS}{tr}none{/tr}{else}{$LAST_SUCCESS|date_format:"%d.%m.%Y %H:%m:%S"}{/if}</i></td>
     </tr>
     <tr>
      <td>{tr}Last modification date{/tr}</td>
      <td><i>{if !$MOD_DATE}{tr}none{/tr}{else}{$MOD_DATE|date_format:"%d.%m.%Y %H:%m:%S"}{/if}</i></td>
     </tr>
    </table>

   </td>
   <td style='padding-left: 3px;' class='left-border'>
    <h3>{tr}Flags{/tr}</h3>
    
    <table width="100%" summary="{tr}Flags{/tr}">
     <tr>
      <td style="width:50%;">
       <input {if $DISALLOW_SVR} checked {/if}class="center"        
         name="DISALLOW_SVR" value="1" type="checkbox">{tr}Prohibit issuance of service tickets{/tr}
        <br>
        <input {if $DISALLOW_FORWARDABLE} checked {/if}class="center" 		
         name="DISALLOW_FORWARDABLE" value="1" type="checkbox">{tr}Prohibit forward able tickets{/tr}
        <br>
        <input {if $DISALLOW_PROXIABLE} checked {/if}class="center" 		
         name="DISALLOW_PROXIABLE" value="1" type="checkbox">{tr}Disallow proxable tickets{/tr}
        <br>
        <input {if $DISALLOW_RENEWABLE} checked {/if}class="center" 		
         name="DISALLOW_RENEWABLE" value="1" type="checkbox">{tr}Prohibit renewable tickets{/tr}
        <br>
        <input {if $DISALLOW_POSTDATED} checked {/if}class="center" 		
         name="DISALLOW_POSTDATED" value="1" type="checkbox">{tr}Prohibit postdated tickets{/tr}
        <br>
        <input {if $DISALLOW_TGT_BASED} checked {/if}class="center" 		
         name="DISALLOW_TGT_BASED" value="1" type="checkbox">{tr}Disallow Ticket-Granting Service{/tr}
        <br>
        <input {if $PWCHANGE_SERVICE} checked {/if}class="center" 		
         name="PWCHANGE_SERVICE" value="1" type="checkbox">{tr}Password change service{/tr}
        <br>
        <input {if $REQUIRES_PRE_AUTH} checked {/if}class="center" 		
         name="REQUIRES_PRE_AUTH" value="1" type="checkbox">{tr}Pre-authentication required{/tr}
        <br>
        <input {if $REQUIRES_PWCHANGE} checked {/if}class="center" 		
         name="REQUIRES_PWCHANGE" value="1" type="checkbox">{tr}Force a password change{/tr}
        <br>
        <input {if $REQUIRES_HW_AUTH} checked {/if}class="center" 		
         name="REQUIRES_HW_AUTH" value="1" type="checkbox">{tr}Hardware pre-authentication{/tr}
        <br>
        <input {if $DISALLOW_DUP_SKEY} checked {/if}class="center" 		
         name="DISALLOW_DUP_SKEY" value="1" type="checkbox">{tr}Disallow user to user authentication{/tr}
        <br>
        <input {if $DISALLOW_ALL_TIX} checked {/if}class="center" 		
         name="DISALLOW_ALL_TIX" value="1" type="checkbox">{tr}Forbid ticket issuance{/tr}
        <br>
       </td>
      </tr>
     </table>
    </td>
   </tr>
  </table>

<input type="hidden" name="pwd_heimdal_posted" value="1">

<hr>

<div class="plugin-actions">
 <button type='submit' name='pw_save'>{tr}Save{/tr}</button>&nbsp;
 <button type='submit' name='pw_abort'>{tr}Cancel{/tr}</button>
</div>

{/if}
