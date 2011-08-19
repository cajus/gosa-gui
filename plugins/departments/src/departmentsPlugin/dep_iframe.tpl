<h3>{tr}Processing the requested operation{/tr}</h3>
{$message}
<br>
<br>
<div style="margin:3px;background-color:white; border:1px solid #A0A0A0">
<iframe src="{$src}" style="width:100%;height:450px;background-color:#FFFFFF;" name="status">
	<p>{tr}Your browser doesn't support IFRAME HTML elements. Please use this link to perform the requested operation.{/tr}
	<br>
	<a href="{$src}">{$src}</a>
	</p>
</iframe>
</div>

<!--
<hr>
<div style="text-align:right;">
	<p>
		<input type="submit" name="back" value="{msgPool type=backButton}">
	</p>
</div>
-->
