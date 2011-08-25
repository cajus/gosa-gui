<h3>{tr}Send notify to recipients{/tr}</h3>

<table style="width:100%;">
    <tr>
        <td style="width:100px;">{tr}Recipients{/tr}</td>
        <td>
            <textarea style="width:100%;" name="recipients">{$recipients}</textarea>
        </td>
    </tr>
    <tr>
        <td style="width:100px;"><LABEL for="title">{tr}Title{/tr}</LABEL></td>
        <td>
            <input style="width:80%;" type="text" name="title" id="title" value="{$title}">
        </td>
    </tr>
</table>
<hr>
<table style="width:100%;">
    <tr>
        <td style="width:100px;"><LABEL for="urgency">{tr}Urgency{/tr}</LABEL></td>
        <td>
            <select name="urgency">
                {html_options options=$urgencyList selected=$urgency}
            </select>
        </td>
    </tr>
    <tr>
        <td style="width:100px;"><LABEL for="timeout">{tr}Timeout{/tr}</LABEL></td>
        <td>
            <input type="text" name="timeout" id="timeout" value="{$timeout}">
        </td>
    </tr>
</table>
<hr>
<table style="width:100%;">
    <tr>
        <td colspan=2>
            <textarea style="width:100%;" rows="10" name="message">{$message}</textarea>
        </td>
    </tr>
</table>
<hr>
<div class="plugin-actions">
  <button type='submit' name='send_notification'>{msgPool type=okButton}</button>
  <button type='submit' name='cancel_notification'>{msgPool type=cancelButton}</button>
</div>

