<div style="font-size:18px;">
 {image path="images/warning.png" align="top"}&nbsp;{tr}Warning{/tr}

</div>
<p>
  {$info}
</p>

<p>
 {tr}So - if you're sure - press 'Delete' to continue or 'Cancel' to abort.{/tr}
</p>

<hr>
<div class="plugin-actions">
  {if $multiple}
    <button type='submit' name='delete_multiple_confirm'>{msgPool type=delButton}</button>

  {else}
    <button type='submit' name='delete_confirm'>{msgPool type=delButton}</button>

  {/if}
  <button type='submit' name='delete_cancel'>{msgPool type=cancelButton}</button>

</div>

