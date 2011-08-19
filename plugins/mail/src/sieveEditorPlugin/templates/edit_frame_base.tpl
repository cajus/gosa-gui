
<table width='100%' class='editing_surface' summary="{tr}Sieve editor{/tr}">
	<tr>
		<td class='editing_surface_menu'>
			
			<button type='submit' name='Save_Copy'>{tr}Export{/tr}</button>
			<button type='submit' name='Import_Script'>{tr}Import{/tr}</button>

			{if $Mode != "Source-Only"}			
				
				{if $Mode == "Source"}
				<button type='submit' name='View_Structured'>{tr}View structured{/tr}</button>
				{else}
				<button type='submit' name='View_Source'>{tr}View source{/tr}</button>
				{/if}
			{/if}
		</td>
	</tr>
	<tr>
		<td class='editing_surface_content'>

			{if $Script_Error != ""}
						<div  class='sieve_error_msgs'>
							{$Script_Error}
						</div>
			{/if}


			{if $Mode == "Structured"}
				{$Contents}
			{else}
				<textarea style='width:100%; height:300px;' class='editing_source' name='script_contents'>{$Contents}</textarea>
			{/if}

		</td>
	</tr>
</table>
<hr>
<div class="plugin-actions">
	<button type='submit' name='save_sieve_changes'>{msgPool type=saveButton}</button>
    <button type='submit' name='cancel_sieve_changes'>{msgPool type=cancelButton}</button>
</div>
