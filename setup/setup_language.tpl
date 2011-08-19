<div>
	<div class='default'>
		<p><b>{tr}Please select the preferred language{/tr}</b></p>
		<p>
		{tr}At this point, you can select the site wide default language. Choosing 'automatic' will use the language requested by the browser. This setting can be overridden per user.{/tr}
		</p>
	</div>
	<div class='default' style='padding-right:10px; margin-bottom:20px;'>
		<select name='lang_selected' title='{tr}Please select your preferred language here{/tr}' size=20 style="width:100%">
		{html_options options=$languages selected=$lang_selected}
		</select>
	</div>
</div>
