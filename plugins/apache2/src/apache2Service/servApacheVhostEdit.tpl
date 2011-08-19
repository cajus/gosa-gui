<h3>{tr}Generic{/tr}</h3>

			<table summary="{tr}Apache Virutal Host{/tr}">
				<tr>
					<td>{tr}Virtual host name{/tr}{$must}
					</td>
					<td><input type="text" name="apacheServerName" value="{$apacheServerName}" {if $NotNew} disabled {/if}>
					</td>
				</tr>
				<tr>
					<td>{tr}Document root{/tr}{$must}
					</td>
					<td><input type="text" name="apacheDocumentRoot" value="{$apacheDocumentRoot}">
					</td>
				</tr>
				<tr>
					<td>{tr}Administrator mail address{/tr}{$must}
					</td>
					<td><input type="text" name="apacheServerAdmin" value="{$apacheServerAdmin}">
					</td>
				</tr>
			</table>

<hr>

<table summary="{tr}Server settings{/tr}" width="100%">
  <tr>
    <td style='width:50%;' class='right-border'>

  		<h3>{tr}Server Alias{/tr}</h3>

 			{$apacheServerAlias}
 			<table width="100%" summary="{tr}Server Alias{/tr}">
 				<tr>
 					<td style='width:30%;'>

 						<h3>{tr}URL Alias{/tr}</h3>
 					</td>
 					<td>
 						<h3>{tr}Directory Path{/tr}</h3>
 					</td>
 				</tr>
 				<tr>
 					<td style='width:30%;'>

 						<input type="text" 		name="StrSAAlias" value="">
 					</td>
 					<td>
 						<input type="text" 		name="StrSADir" value="">
 						<button type='submit' name='AddSARecord'>{tr}Add{/tr}</button>

 					</td>
 				</tr>
   		</table>

		</td>
		<td style='width:50%;' class='right-border'>

			<h3>{tr}Script Alias{/tr}</h3>
  		{$apacheScriptAlias}

      <table width="100%" summary="{tr}Script Alias{/tr}">
        <tr>
          <td style='width:30%;'>
            <h3>{tr}Alias Directory{/tr}</h3>
          </td>
          <td>
            <h3>{tr}Script Directory{/tr}</h3>
          </td>
        </tr>
        <tr>
          <td style='width:30%;'>

            <input type="text" 		name="StrSCAlias" value="">
          </td>
          <td>
            <input type="text" 		name="StrSCDir" value="">
            <button type='submit' name='AddSCRecord'>{tr}Add{/tr}</button>

          </td>
        </tr>
      </table>

		</td>
	</tr>
</table>
<div style="text-align:right;" align="right">
	<p>
		<button type='submit' name='SaveVhostChanges'>{tr}Save{/tr}</button>

		<button type='submit' name='CancelVhostChanges'>{tr}Cancel{/tr}</button>

	</p>
</div>
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
  document.mainform.apacheServerName.focus();
  -->
</script>
