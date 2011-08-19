
{if $is_new}

<table style='width:100%;' summary="{tr}Goto daemon event: Notification message{/tr}">
  <tr>
    <td style='width:50%; padding:6px;' class='right-border'>

	  <b>{tr}Message settings{/tr}</b>
      <table style="width:100%;" summary="{tr}Subject{/tr}">
        <tr>
          <td>{tr}Sender{/tr}</td>
          <td><input type='text' name="from" value="{$from}" style="width:100%;"></td>
        </tr>
        <tr>
          <td>{tr}Subject{/tr}</td>
          <td><input type='text' name="subject" value="{$subject}" style="width:100%;"></td>
        </tr>
        <tr>
          <td colspan="2">{tr}Message{/tr} :</td>
        </tr>
        <tr>
          <td colspan="2" >
            <textarea style="width:99%;height:250px;" name="message" >{$message}</textarea>
          </td>
        </tr>
      </table>
    </td>
    <td style='width:50%; '>

	    <b>{tr}Schedule{/tr}</b>
      <table summary="{tr}Schedule options{/tr}">
        <tr>
          <td colspan="2">{$timestamp}
<br><br></td>
        </tr>
	  </table>
      <table style='width:100%;' summary="{tr}Recipient{/tr}">
        <tr>
          <td style="width:50%;">
            <b>{tr}Target users{/tr}</b>
            <br>
			<select style="height:180px;width:100%" name="user[]"  multiple size=4>
				{html_options options=$user}
			</select>
          </td>
          <td>
            <b>{tr}Target groups{/tr}</b>
            <br>
			<select style="height:180px;width:100%" name="group[]"  multiple size=4>
				{html_options options=$group}
			</select>
          </td>
        </tr>
		<tr>
			<td colspan="2">
				<button type='submit' name='open_target_list'>{$add_str}</button>

				<button type='submit' name='del_any_target'>{$del_str}</button>

			</td>
		</tr>
      </table>
    </td>
  </tr>
</table>

{else}

<table style='width:100%;' summary="{tr}Generic settings{/tr}">
	<tr>
		<td>

			<table summary="{tr}Generic settings{/tr}">
				<tr>
					<td>{tr}ID{/tr}</td>
					<td>{$data.ID}</td>
				</tr>
				<tr>
					<td>{tr}Status{/tr}</td>
					<td>{$data.STATUS}</td>
				</tr>
				<tr>
					<td>{tr}Result{/tr}</td>
					<td>{$data.RESULT}</td>
				</tr>
				<tr>
					<td>{tr}Target{/tr}</td>
					<td>{$data.MACADDRESS}</td>
				</tr>
				<tr>
					<td>{tr}Time stamp{/tr}
</td>
					<td>{$timestamp}</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

{/if}
