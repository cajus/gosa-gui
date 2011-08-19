<h3>{tr}Generic{/tr}</h3>
<table summary="{tr}Blacklist{/tr}" style="width:100%;">

 <tr>
   <td style="width:50%;">
    <table summary="{tr}Blacklist generic{/tr}">
     <tr>
      <td><LABEL for="cn">{tr}List name{/tr}</LABEL>{$must}</td>
      <td>

{render acl=$cnACL}
       <input type='text' name="cn" id="cn" size=25 maxlength=60 value="{$cn}" title="{tr}Name of blacklist{/tr}">
{/render}
      </td>
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

  <td class='left-border'>
   &nbsp;
  </td>

   <td>
    <table summary="{tr}Blacklist type{/tr}">
     <tr>
       <td><LABEL for="type">{tr}Type{/tr}</LABEL></td>
       <td>
{render acl=$typeACL}
        <select size="1" id="type" name="type" title="{tr}Select whether to filter incoming or outgoing calls{/tr}">
	        {html_options options=$types selected=$type}
		<option disabled>&nbsp;</option>
        </select>
{/render}
        </td>
      </tr>
      <tr>
       <td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
       <td>
{render acl=$descriptionACL}
         <input type='text' name="description" id="description" size=25 maxlength=80 value="{$description}" title="{tr}Descriptive text for this blacklist{/tr}">
{/render}
       </td>
      </tr>
    </table>
   </td>
 </tr>
</table>

<hr>

<table summary="{tr}Blocked numbers{/tr}" style="width:100%">
 <tr>
   <td style="width:50%;">

     <h3>{tr}Blocked numbers{/tr}</h3>
{render acl=$goFaxBlocklistACL}
     <select style="width:100%; height:200px;" name="numbers[]" size=15 multiple>
      {html_options values=$goFaxBlocklist output=$goFaxBlocklist}
	  <option disabled>&nbsp;</option>
     </select>
{/render}
     <br>
{render acl=$goFaxBlocklistACL}
     <input type='text' id="number" name="number" size=25 maxlength=60 >&nbsp;
{/render}
{render acl=$goFaxBlocklistACL}
     <button type='submit' name='add_number'>{msgPool type=addButton}</button>&nbsp;

{/render}
{render acl=$goFaxBlocklistACL}
     <button type='submit' name='delete_number'>{msgPool type=delButton}</button>

{/render}
   </td>
  <td class='left-border'>
   &nbsp;
  </td>
   <td>
     <h3>{tr}Information{/tr}</h3>
     <p>
      {tr}Numbers can also contain wild cards.{/tr}
     </p>
   </td>
 </tr>
</table>

<input type='hidden' name='blocklist_posted' value="1">
<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('n');
  -->
</script>
