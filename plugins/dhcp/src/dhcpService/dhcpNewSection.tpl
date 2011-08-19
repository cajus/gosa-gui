
<div style="font-size: 18px;">{tr}Create new DHCP section{/tr}</div>

<br>
<p class="seperator">
 <b>{tr}Please choose one of the following DHCP section types.{/tr}</b>
</p>

<br>{tr}Section{/tr}&nbsp;

<select size="1" id="section" name="section" title="{tr}Choose section type to create{/tr}">
 {html_options options=$sections}
</select>

<hr>

<div class="plugin-actions">
 <button type='submit' name='create_section'>{tr}Create{/tr}</button>
 <button type='submit' name='cancel_section'>
 {msgPool type=cancelButton}</button>
</div>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
 <!--	
  focus_field('section');	
 -->
</script>
