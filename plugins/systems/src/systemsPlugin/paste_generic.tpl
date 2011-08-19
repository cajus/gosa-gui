{if $object == "server"}
    <table summary="{tr}Paste server{/tr}">
     <tr>
      <td><LABEL for="cn">{tr}Server name{/tr}</LABEL>{$must}</td>
      <td>
       <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
      </td>
     </tr>
	</table>
{/if}
{if $object == "workstation"}
    <table summary="{tr}Paste workstation{/tr}">
     <tr>
      <td><LABEL for="cn">{tr}workstation name{/tr}</LABEL>{$must}</td>
      <td>
       <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
      </td>
     </tr>
	</table>
{/if}
{if $object == "terminal"}
    <table summary="{tr}Paste terminal{/tr}">
     <tr>
      <td><LABEL for="cn">{tr}Terminal name{/tr}</LABEL>{$must}</td>
      <td>
       <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
      </td>
     </tr>
	</table>
{/if}
{if $object == "printer"}
    <table summary="{tr}Paste printer{/tr}">
     <tr>
      <td><LABEL for="cn">{tr}Printer name{/tr}</LABEL>{$must}</td>
      <td>
       <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
      </td>
     </tr>
	</table>
{/if}
{if $object == "component"}
    <table summary="{tr}Paste network component{/tr}">
     <tr>
      <td><LABEL for="cn">{tr}Component name{/tr}</LABEL>{$must}</td>
      <td>
       <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
      </td>
     </tr>
	</table>
{/if}
