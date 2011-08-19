<p style='padding-left:7px;'>
 {image path="images/lists/on.png"}&nbsp;
<b>{tr}Only users with the same asterisk home server will be included to this queue.{/tr}</b>
</p>

<table style='width: 100%; ' summary="{tr}Queue Settings{/tr}">

<tr>
<td valign='top'>
		<h3>{tr}Phone numbers{/tr}</h3>
		<table summary="{tr}Phone numbers{/tr}">
		<tr>
		<td colspan=2>
		  <table summary="{tr}Generic queue Settings{/tr}">
		   <tr>
		    <td>
{render acl=$telephoneNumberACL}
			<select style="width:300px; height:60px;" name="goFonQueueNumber_List" size=6>
			{html_options options=$telephoneNumber}
			<option disabled>&nbsp;</option>
			</select>
{/render}
		</td>
		<td>

{render acl=$telephoneNumberACL}
			<button type='submit' name='up_phonenumber'>{tr}Up{/tr}</button>
<br>
{/render}
{render acl=$telephoneNumberACL}
			<button type='submit' name='down_phonenumber'>{tr}Down{/tr}</button>

{/render}
		</td>
		</tr>
		<tr>
		 <td colspan=2>
{render acl=$telephoneNumberACL}
			<input type='text' name="phonenumber" size=20 align=middle maxlength=60 value="">
{/render}
{render acl=$telephoneNumberACL}
			<button type='submit' name='add_phonenumber'>{msgPool type=addButton}</button>&nbsp;

{/render}
{render acl=$telephoneNumberACL}
			<button type='submit' name='delete_phonenumber'>{msgPool type=delButton}</button>

{/render}
	     </td>
		</tr>
		</table>
		</tr>
		<tr>
		  <td colspan=2><h3>{tr}Options{/tr}</h3></td>
		</tr>
                <tr>
                <td><LABEL for="goFonHomeServer">{tr}Home server{/tr}</LABEL>{$must}</td>
                <td>
{render acl=$goFonHomeServerACL}
                        <select name='goFonHomeServer' size=1>
                         {html_options options=$goFonHomeServers selected=$goFonHomeServer}
                        </select>
{/render}
                </td>
                </tr>

		<tr>
		<td>
			{tr}Language{/tr}	
		</td>
		<td>
{render acl=$goFonQueueLanguageACL}
			<select name="goFonQueueLanguage" size=1>
			{html_options options=$goFonQueueLanguageOptions selected=$goFonQueueLanguage}
			<option disabled>&nbsp;</option>
			</select>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Timeout{/tr}
		</td>
		<td>
{render acl=$goFonTimeOutACL}
			<input type='text' name='goFonTimeOut' value='{$goFonTimeOut}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Retry{/tr}
		</td>
		<td>
{render acl=$goFonQueueRetryACL}
			<input type='text' name='goFonQueueRetry' value='{$goFonQueueRetry}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Strategy{/tr}	
		</td>
		<td>
{render acl=$goFonQueueStrategyACL}
			<select name="goFonQueueStrategy" size=1>
            {html_options options=$goFonQueueStrategyOptions selected=$goFonQueueStrategy}
            <option disabled>&nbsp;</option>
            </select>
{/render}
	
		</td>
		</tr>
		<tr>
		<td>
			{tr}Max queue length{/tr}
		</td>
		<td>
{render acl=$goFonMaxLenACL}
			<input type='text' name='goFonMaxLen' value='{$goFonMaxLen}'>	
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Announce frequency{/tr}
		</td>
		<td>
{render acl=$goFonAnnounceFrequencyACL}
			<input type='text' name='goFonAnnounceFrequency' value='{$goFonAnnounceFrequency}'>
{/render}
			{tr}(in seconds){/tr}	
		</td>
		</tr>
		</table>
</td>
<td class='left-border'>

	<h3>
    {image path="plugins/gofon/html/images/sound.png"}

    {tr}Queue sound setup{/tr}
    </h3>
	<table summary="{tr}Generic queue Settings{/tr}">
		<!--<tr>
		<td>
			{tr}Use music on hold instead of ringing{/tr}
		</td>
		<td>
{render acl=goFonMusiconHoldACL}
			<input type="checkbox" name='goFonMusiconHold' value='1' {$goFonMusiconHoldCHK}>
{/render}
		</td>
		</tr>
		-->
		<tr>
		<td>
			{tr}Music on hold{/tr}
		</td>
		<td>
{render acl=$goFonMusiconHoldACL}
			<input type="text" style='width:250px;' name='goFonMusiconHold' value='{$goFonMusiconHold}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Welcome sound file{/tr}
		</td>
		<td>
{render acl=$goFonWelcomeMusicACL}
			<input type="text" style='width:250px;' name='goFonWelcomeMusic' value='{$goFonWelcomeMusic}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Announce message{/tr}
		</td>
		<td>
{render acl=$goFonQueueAnnounceACL}
			<input type="text" style='width:250px;' name='goFonQueueAnnounce' value='{$goFonQueueAnnounce}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Sound file for 'You are next ...'{/tr}
		</td>
		<td>
{render acl=$goFonQueueYouAreNextACL}
			<input type="text" style='width:250px;' name='goFonQueueYouAreNext' value='{$goFonQueueYouAreNext}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}'There are ...'{/tr}
		</td>
		<td>
{render acl=$goFonQueueThereAreACL}
			<input type="text" style='width:250px;' name='goFonQueueThereAre' value='{$goFonQueueThereAre}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}'... calls waiting'{/tr}
		</td>
		<td>
{render acl=$goFonQueueCallsWaitingACL}
			<input type="text" style='width:250px;' name='goFonQueueCallsWaiting' value='{$goFonQueueCallsWaiting}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}'Thank you' message{/tr}
		</td>
		<td>
{render acl=$goFonQueueThankYouACL}
			<input type="text" style='width:250px;' name='goFonQueueThankYou' value='{$goFonQueueThankYou}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}'minutes' sound file{/tr}
		</td>
		<td>
{render acl=$goFonQueueMinutesACL}
			<input type="text" style='width:250px;' name='goFonQueueMinutes' value='{$goFonQueueMinutes}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}'seconds' sound file{/tr}
		</td>
		<td>
{render acl=$goFonQueueSecondsACL}
			<input type="text" style='width:250px;' name='goFonQueueSeconds' value='{$goFonQueueSeconds}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Hold sound file{/tr}
		</td>
		<td>
{render acl=$goFonQueueReportHoldACL}
			<input type="text" style='width:250px;' name='goFonQueueReportHold' value='{$goFonQueueReportHold}'>
{/render}
		</td>
		</tr>
		<tr>
		<td>
			{tr}Less Than sound file{/tr}
		</td>
		<td>
{render acl=$goFonQueueLessThanACL}
			<input type="text" style='width:250px;' name='goFonQueueLessThan' value='{$goFonQueueLessThan}'>
{/render}
		</td>
		</tr>

		</table>
</td>
</tr>
<tr>
	<td colspan=2>
		<p class="seperator">
	</td>
</tr>
<tr>
<td colspan=2><h3 style='margin-bottom:0px;'>{image path="plugins/gofon/html/images/options.png"}&nbsp;{tr}Phone attributes {/tr}
</h3></td>
</tr>
<tr>
<td>
		<table style='width: 100%; ' summary="{tr}Additional queue settings{/tr}">

        <tr>
        <td colspan=2>
{render acl=$goFonQueueAnnounceHoldtimeACL}
            <input type="checkbox" name='goFonQueueAnnounceHoldtime' value='yes'  {$goFonQueueAnnounceHoldtimeCHK}>
{/render}
            {tr}Announce hold time{/tr}
        </td>
        </tr>
        <tr>
        <td colspan=2>
{render acl=$goFonDialOptiontACL}
            <input type="checkbox" name='goFonDialOptiont' value='t'  {$goFonDialOptiontCHK}>
{/render}
            {tr}Allow the called user to transfer his call{/tr}
        </td>
        </tr>
        <tr>
        <td colspan=2>
{render acl=$goFonDialOptionTACL}
            <input type="checkbox" name='goFonDialOptionT' value='T' {$goFonDialOptionTCHK}>
{/render}
            {tr}Allows calling user to transfer call{/tr}
        </td>
        </table>

</td>
<td class='left-border'>

	 	<table style='width: 100%; ' summary="{tr}Dial options{/tr}">

        <tr>
        <td colspan=2>
{render acl=$goFonDialOptionhACL}
            <input type="checkbox" name='goFonDialOptionh' value='h' {$goFonDialOptionhCHK}>
{/render}
            {tr}Allow the called to hangup by pressing *{/tr}
        </td>
        </tr>
        <tr>
        <td colspan=2>
{render acl=$goFonDialOptionHACL}
            <input type="checkbox" name='goFonDialOptionH' value='H' {$goFonDialOptionHCHK}>
{/render}
            {tr}Allows calling to hangup by pressing *{/tr}
        </td>
        </tr>
        <tr>
        <td colspan=2>
{render acl=$goFonDialOptionrACL}
            <input type="checkbox" name='goFonDialOptionr' value='r' {$goFonDialOptionrCHK}>
{/render}
            {tr}Ring instead of playing background music{/tr}
        </td>
        </tr>
        </table>
</td>
</tr>

</table>
