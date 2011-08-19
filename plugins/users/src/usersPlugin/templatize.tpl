<div style="font-size:18px;">
  {tr}Applying a template{/tr}
</div>

<p>
 {tr}Applying a template to several users will replace all user attributes defined in the template.{/tr}
</p>

<hr>
<br>

{if $templates}
<table summary="{tr}Apply user template{/tr}" cellpadding=4 border=0>
  <tr>
    <td><b><LABEL for="template">{tr}Template{/tr}</LABEL></b></td>
    <td>
      <select size="1" name="template" id="template">
       {html_options options=$templates}
      </select>
    </td>
  </tr>
</table>

<hr>
<div class="plugin-actions">
  <button type='submit' name='templatize_continue'>{msgPool type=applyButton}</button>
  <button type='submit' name='edit_cancel'>{msgPool type=cancelButton}</button>
</div>

{else}

  {tr}No templates available!{/tr}

  <hr>
  <div class="plugin-actions">
    <button type='submit' name='edit_cancel'>{msgPool type=cancelButton}</button>
  </div>

{/if}


<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('template');
  -->
</script>
