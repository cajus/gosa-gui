<h3>{tr}Properties{/tr}</h3>

<table summary="{tr}Conference{/tr}">
  <tr>
    <td>
    	<table summary="{tr}Generic settings{/tr}">
        <tr>
          <td>
            <LABEL for="cn">
              {tr}Conference name{/tr}
            </LABEL>
            {$must}
          </td>
          <td>
{render acl=$cnACL}
            <input type='text' id="cn" name="cn" size=25 maxlength=60 value="{$cn}" title="{tr}Name of conference to create{/tr}">
{/render}
          </td>
        </tr>
        <tr>
          <td>
            <LABEL for="goFonConferenceOption_D">
              {tr}Type{/tr}
            </LABEL>
            {$must}
          </td>
          <td>
{render acl=$goFonConferenceOptionDACL}
            <select id="goFonConferenceOption_D" size="1" name="goFonConferenceOption_D" 
              title="{tr}Choose subtree to place conference in{/tr}"> 
              {html_options options=$goFonConferenceOptions selected=$goFonConferenceOption_D}
            </select>
{/render} 
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <br>
          </td>
        </tr>
        <tr>
          <td>
            <LABEL for="base">
              {tr}Base{/tr}
            </LABEL>
            {$must}
          </td>
          <td>

{render acl=$baseACL}
          {$base}
{/render}

          </td>
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
          <td>{tr}Language{/tr}
          </td>
          <td>
{render acl=$languageACL}
            <select name="language" title="{tr}Select language{/tr}" size=1>
              {html_options options=$languages selected=$language}
            </select>
{/render}
          </td>
        </tr>
      </table>
    </td>
    <td class="left-border">
      &nbsp;
    </td>
    <td width="50%">
      <table summary="{tr}Additional settings{/tr}">
        <tr>
          <td>
            <LABEL for="description">
              {tr}Description{/tr}
            </LABEL>
          </td>
          <td>
{render acl=$descriptionACL}
            <input id="description" name="description" size=40 maxlength=80 type='text' 
              value="{$description}" title="{tr}Descriptive text for department{/tr}">
{/render} 
          </td>
        </tr>
        <tr>
          <td>
            {tr}Lifetime (in days){/tr}
          </td>
          <td>
{render acl=$goFonConferenceOptionLifetimeACL}
            <input type='text' name="goFonConferenceOptionLifetime" size=15 value="{$goFonConferenceOptionLifetime}">
{/render} 
          </td>
        </tr>
        <tr>
          <td>
            {tr}Phone number{/tr}
            {$must}
          </td>
          <td>
{render acl=$telephoneNumberACL}
            <input type='text' name="telephoneNumber" value="{$telephoneNumber}" size=15>
{/render} 
          </td>
        </tr>
      </table>

    </td>
  </tr>
  <tr>
    <td colspan=3 >
      <hr>
    </td>
  </tr>
  <tr>
    <td colspan=3>
      <h3>{tr}Options{/tr}</h3>
    </td>
  </tr>
  <tr>
    <td>

	    <table summary="{tr}Options{/tr}">
        <tr>
	        <td>
{render acl=$goFonConferenceOptionPACL}
		        <input type="checkbox" onclick="changeState('goFonPIN');" name="goFonConferenceOption_P" 
					    value="P" {$goFonConferenceOption_PCHK}> 
{/render} 
        	</td>
          <td>
		        {tr}Preset PIN{/tr}
	        </td>
	      </tr>
	      <tr>
	        <td>
	          &nbsp;
	        </td>
	        <td>
		        {tr}PIN{/tr} 
{render acl=$goFonPINACL}
            <input type='password' name="goFonPIN" id="goFonPIN" value="{$goFonPIN}" title="{$goFonPIN}">
{/render} 
        	</td>
	      </tr>
        <tr>
	        <td colspan=2>
{render acl=$goFonConferenceOptionrACL}
		        <input type="checkbox" onclick="changeState('goFonConferenceOptionFormat');" name="goFonConferenceOption_r" 
              value="r" {$goFonConferenceOption_rCHK}> 
{/render} 
    	      {tr}Record conference{/tr}
	        </td>
	      </tr>
	      <tr>
	        <td>
	          &nbsp;
	        </td>
	        <td>
	          {tr}Sound file format{/tr}&nbsp;
{render acl=$goFonConferenceOptionFormatACL}
	          <select id="goFonConferenceOptionFormat" size="1" name="goFonConferenceOptionFormat" 
              title="{tr}Choose subtree to place department in{/tr}"> 
	            {html_options options=$goFonConferenceOptionFormats selected=$goFonConferenceOptionFormat}
          	</select>
{/render} 
        	</td>
	      </tr>
	    </table>

    </td>
    <td class="left-border">
      &nbsp;
	  </td>
    <td>

      <table summary="{tr}Flags{/tr}">
        <tr>
          <td>
{render acl=$goFonConferenceOptionMACL}
            <input type="checkbox" name="goFonConferenceOption_M" value="M" {$goFonConferenceOption_MCHK}> 
{/render} 
            {tr}Play music on hold{/tr}
          </td>
        </tr>
        <tr>
          <td>
{render acl=$goFonConferenceOptionsACL}
            <input type="checkbox" name="goFonConferenceOption_s" value="s" {$goFonConferenceOption_sCHK}> 
{/render} 
            {tr}Activate session menu{/tr}
          </td>
        </tr>
        <tr>
          <td>
{render acl=$goFonConferenceOptioniACL}
            <input type="checkbox" name="goFonConferenceOption_i" value="i" {$goFonConferenceOption_iCHK}> 
{/render} 
            {tr}Announce users joining or leaving the conference{/tr}
         </td>
        </tr>
        <tr>
          <td>
{render acl=$goFonConferenceOptioncACL}
            <input type="checkbox" name="goFonConferenceOption_c" value="c" {$goFonConferenceOption_cCHK}>
{/render} 
            {tr}Count users{/tr}
          </td>
        </tr>
      </table>

    </td>
  </tr>
</table>

<input type='hidden' name='phoneConferenceGeneric' value='1'>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
<!-- 
// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler: 
-->
