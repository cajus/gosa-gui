<table summary="{tr}Component{/tr}" width="100%">
 <tr>
  <td style='width:50%; ' class='right-border'>

	<table summary="{tr}Generic settings{/tr}">
	 <tr>
	  <td><LABEL for="cn">{tr}Device name{/tr}</LABEL>{$must}</td>
	  <td>
{render acl=$cnACL}
	   <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
{/render}
	  </td>
	 </tr>
	 <tr>
          <td colspan=2>&nbsp;</td>
	 </tr>
 	 <tr>
	  <td><LABEL for="base">{tr}Base{/tr}</LABEL>{$must}</td>
	  <td>
{render acl=$baseACL}
            {$base}
{/render}
          </td>
	  </tr>
	</table>
  </td>
  <td>

	  <LABEL for="description">{tr}Description{/tr}</LABEL>
{render acl=$descriptionACL}
	   <input type='text' id="description" name="description" size=25 maxlength=80 value="{$description}">
{/render}
  </td>
 </tr>
</table>

<hr>

{$netconfig}

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
