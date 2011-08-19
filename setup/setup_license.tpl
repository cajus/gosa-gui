<div>
 <p>
  {tr}GOsa is developed under the terms of the GNU General Public License v2. Please accept the terms below.{/tr}
 </p>
	<div class='default' style='margin:10px; border:1px solid #A0A0A0'>
		<div style='height:450px;padding:5px;overflow:auto; '>
			{$License}
		</div>
	</div>	
	<div style='width:95%; text-align:center'>
		<input {if $accepted} checked {/if} id="accepted" type='checkbox' name='accepted' class="center"><label for="accepted">{tr}I have read the license and accept it{/tr}</label>
	</div>
</div>
<input type='hidden' name='step_license' value='1'>
