<table summary="{tr}Server{/tr}" width="100%">
 <tr>
  <td style='width:50%;'>

  <h3>{tr}Generic{/tr}</h3>
	<table summary="{tr}Server settings{/tr}">
	 <tr>
	  <td><LABEL for="cn">{tr}Server name{/tr}</LABEL>{$must}</td>
	  <td>
{render acl=$cnACL}
	   <input type='text' name="cn" id="cn" size=20 maxlength=60 value="{$cn}">
{/render}
	  </td>
	 </tr>
	 <tr>
	  <td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
	  <td>
{render acl=$descriptionACL}
           <input type='text' name="description" id="description" size=25 maxlength=80 value="{$description}">
{/render}
          </td>
	 </tr>
   	<tr>
     <td>{tr}Mode{/tr}</td>
     <td>
{render acl=$gotoModeACL}
      <select name="gotoMode" title="{tr}Select terminal mode{/tr}" size=1>
       {html_options options=$modes selected=$gotoMode}
      </select>
{/render}
     </td>
    </tr>
 	 <tr>
	  <td><br><LABEL for="base">{tr}Base{/tr}</LABEL>{$must}</td>
	  <td>
	   <br>
{render acl=$baseACL}
           {$base}
{/render}
	   </td>
	  </tr>
	</table>

  </td>
  <td class='left-border'>
	{$host_key}
  </td>
 </tr>
</table>

<hr>
<br>

{$netconfig}


<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
