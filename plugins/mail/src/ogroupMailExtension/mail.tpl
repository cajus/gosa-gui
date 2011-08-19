<input type="hidden" name="mailedit" value="1">
<table style='width:100%; ' summary="{tr}Mail settings{/tr}">


 <!-- Headline container -->
 <tr>
  <td style='width:50%; '>

   <h3>{tr}Mail distribution list{/tr}</h3>
   <table summary="{tr}Mail distribution list{/tr}">
    <tr>
     <td><LABEL for="mail">{tr}Primary address{/tr}</LABEL>{$must}</td>
     <td>
{render acl=$mailACL}
	<input type='text' id="mail" name="mail" size=50 maxlength=65 value="{$mail}" title="{tr}Primary mail address for this distribution list{/tr}">
{/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('mail');
  -->
</script>
