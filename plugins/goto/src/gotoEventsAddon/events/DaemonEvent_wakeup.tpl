
{if $is_new}

<table style='width:100%;' summary="{tr}Goto daemon event: Wake up{/tr}">
  <tr>
    <td style='width:50%; ' class='right-border'>

      <table summary="{tr}Schedule options{/tr}">
        <tr>
          <td>
<b>{tr}Schedule{/tr}</b><br><br>
          {$timestamp}</td>
        </tr>
      </table>
    </td>
    <td style='width:50%; '>

      <table style='width:100%;' summary="{tr}Target list{/tr}">
        <tr>
          <td>
            <b>{tr}System list{/tr}</b>
            <br>
            {$target_list}
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

{else}

<table style='width:100%;' summary="{tr}Generic settings{/tr}">
	<tr>
		<td style='width:50%; '>

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
