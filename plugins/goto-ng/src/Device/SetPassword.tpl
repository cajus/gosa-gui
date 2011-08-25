<h3>{tr}Set root-user password{/tr}</h3>

<hr>

<p>
 {tr}Password{/tr}: &nbsp;<input type="text" name="rootPassword" value="">
 <select name="passwordHash" size=1>
  {html_options options=$hashes selected=$hash}
 </select>
</p>

<hr>

<div class="plugin-actions">
    <button name="setPassword">{msgPool type=okButton}</button>
    <button name="cancelPassword">{msgPool type=cancelButton}</button>
</div>
