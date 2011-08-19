<h3>{tr}Add a new element{/tr}</h3>
{tr}Please select the type of element you want to add{/tr}
<br>
<select name='element_type' size=1>
	{html_options options=$element_types selected=$element_type}
</select>

<hr>
<br>
<div class='seperator' style='text-align:right; width:100%;'>
    <button type='submit' name='select_new_element_type'>{tr}Continue{/tr}</button>

    &nbsp;
    <button type='submit' name='select_new_element_type_cancel'>{tr}Abort{/tr}</button>

</div>
