<h3>{$typeData.description}</h3>

<hr>

{$template}

<hr>

<div class='plugin-actions'>
    {if $hasWriteAcls}
        <button name='saveItemEdit'>{msgPool type=okButton}</button>
    {/if}
    <button name='cancelItemEdit'>{msgPool type=cancelButton}</button>
</div>
