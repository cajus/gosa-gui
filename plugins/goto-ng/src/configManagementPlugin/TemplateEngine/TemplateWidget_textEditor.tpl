{if $write_protect}
  {tr}The text is write protected due to its encoding. Editing may break it!{/tr}
  <br>
  <button type='submit' name='editAnyway' {if !$enabled || !$writeable} disabled {/if}>{tr}Edit anyway{/tr}</button>
{/if}
<textarea {if !$enabled || !$writeable} disabled {/if} {if $write_protect} disabled {/if} {if !$write_protect} name="{$postName}" {/if}
    style="width:100%;height:300px;" id="{$postName}"
    rows="20" cols="120">{if $readable}{$value}{/if}</textarea>
<div>
  <input type="file" name="ImportFile" {if !$enabled || !$writeable} disabled {/if} style="width:280px;">&nbsp;
  <button type='submit' name='ImportUpload' {if !$enabled || !$writeable} disabled {/if}>{tr}Import text{/tr}</button>
</div>
