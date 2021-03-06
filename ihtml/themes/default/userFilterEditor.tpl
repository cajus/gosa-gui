<h3>{tr}Filter editor{/tr}</h3>

<hr>

<table summary="{tr}Filter editor{/tr}" width="100%">
  <tr>
    <td class="right-border" style='width:40%;'>
      <table summary='{tr}Filter properties{/tr}'>
        <tr>
          <td>
            <label for='name'>{tr}Name{/tr}</label>{$must}
          </td>
          <td>
            <input type='text' name='name' id='name' value="{$name}">
          </td>   
        </tr>
        <tr>
          <td>
            <label for='description'>{tr}Description{/tr}</label>{$must}
          </td>
          <td>
            <input type='text' name='description' id='description' value="{$description}">
          </td>   
        </tr>
        <tr>
          <td>
            <label for='parent'>{tr}Parent filter{/tr}</label>
          </td>
          <td>
            <select name='parent' size='1'>
              {html_options values=$fixedFilters output=$fixedFilters selected=$parent}
            </select>
          </td>   
        </tr>
      </table>  
    
      <br>
      
      <input type='checkbox' name='shareFilter' value='1' {if $share} checked {/if}>
       {tr}Public visible{/tr}              

      <br>
    
      <input type='checkbox' name='enableFilter' value='1' {if $enable} checked {/if}>
       {tr}Enabled{/tr}

    </td>
    <td>
      <label for='usedCategory'>{tr}Categories where the filter is visible{/tr}</label><br>
      <select id='usedCategory' name='usedCategory[]' size='4' multiple style='width:100%;'>
        {html_options options=$selectedCategories}
      </select>
      <br>
      <select id='availableCategory' name='availableCategory' size='1'
        onChange="$('manualCategory').value=$('availableCategory').options[$('availableCategory').selectedIndex].value"> 
        <option value=''>&nbsp;</option>
        {html_options values=$availableCategories output=$availableCategories}
      </select>
      <input type='text' id='manualCategory' name='manualCategory' value=''>
      <button type='submit' name='addCategory'>{msgPool type='addButton'}</button>
      <button type='submit' name='delCategory'>{msgPool type='delButton'}</button>
    </td>
  </tr>
</table>

<hr>

{foreach from=$queries item=item key=key}
  <b>{tr}Query{/tr} #{$key}</b>
  <select name='backend_{$key}' size='1'>
    {html_options output=$backends values=$backends selected=$item.backend}
  </select>
  <button type='submit' name='removeQuery_{$key}'>{msgPool type='delButton'}</button> 
  <textarea name='filter_{$key}' id='filter_{$key}' cols="0" 
      style='width:100%; height: 120px;'>{$item.filter}</textarea>
  <hr>
{/foreach}
  <button type='submit' name='addQuery'>{msgPool type='addButton'}</button> 
<hr>

<input type='hidden' value='1' name='userFilterEditor'>

<div class="plugin-actions">
  <button type='submit' name='saveFilterSettings'>{msgPool type='saveButton'}</button>
  <button type='submit' name='cancelFilterSettings'>{msgPool type='cancelButton'}</button>
</div>
