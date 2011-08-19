 <table cellspacing="0" cellpadding="0" summary="{tr}Event scheduling options{/tr}">
	<tr>
		<td>{tr}Year{/tr}</td>
		<td>{tr}Month{/tr}</td>
		<td>{tr}Day{/tr}</td>
    <td>&nbsp;&nbsp;</td>
		<td>{tr}Hour{/tr}</td>
		<td>{tr}Minute{/tr}</td>
		<td>{tr}Second{/tr}</td>
	</tr>
	<tr>
		<td>
			<select name="time_year" onChange="document.mainform.submit();" size=1>
				{html_options values=$years options=$years selected=$time_year}
			</select>&nbsp;
		</td>
		<td>
			<select name="time_month" onChange="document.mainform.submit();" size=1>
				{html_options values=$months options=$months selected=$time_month}
			</select>&nbsp;
		</td>
		<td>
			<select name="time_day" size=1>
				{html_options values=$days options=$days selected=$time_day}
			</select>&nbsp;
		</td>
    <td>&nbsp;</td>
		<td>
			<select name="time_hour" size=1>
				{html_options values=$hours options=$hours selected=$time_hour}
			</select>&nbsp;
		</td>
		<td>
			<select name="time_minute" size=1>
				{html_options values=$minutes options=$minutes selected=$time_minute}
			</select>&nbsp;
		</td>
		<td>
			<select name="time_second" size=1>
				{html_options values=$seconds options=$seconds selected=$time_second}
			</select>
		</td>
	</tr >
</table>
<br>
<table width="100%" summary="{tr}Periodical jobs{/tr}">
  <tr>
    <td colspan="2">
      <b>{tr}Periodical job{/tr}</b>
      <input class='center' type="checkbox" name='activate_periodical_job' value='1' {if $activate_periodical_job} checked {/if}
        onClick="changeState('periodValue'); changeState('periodType');">
    </td>
	</tr>
  <tr>
    <td>{tr}Job interval{/tr}</td>
    <td>
      <input {if !$activate_periodical_job} disabled {/if}
          size="4" type='text' id='periodValue' value='{$periodValue}' name='periodValue'>
      <select name='periodType' id="periodType" {if !$activate_periodical_job} disabled {/if} size=1>
        {html_options options=$periodTypes selected=$periodType}
      </select>
    </td>
	</tr>
</table>

