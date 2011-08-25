<h3>{tr}Notifiation{/tr}</h3>
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
    <tr>
        <td style="width:100px;"><LABEL for="title">{tr}Message{/tr}</LABEL></td>
        <td>
            <textarea style="width:100%;" rows="10" name="message">{$message}</textarea>
        </td>
    </tr>
</table>
<hr>
<h3>{tr}Options{/tr}</h3>
<table style="width:100%;">
    <tr>
        <td style="width:50%">
            <LABEL for="urgency">{tr}Urgency{/tr}</LABEL>&nbsp;
            <select name="urgency">
                {html_options options=$urgencyList selected=$urgency}
            </select>
        </td>
        <td class="left-border" style="padding-left:5px;">
            <LABEL for="timeout">{tr}Timeout{/tr}</LABEL>&nbsp;
            <input type="text" name="timeout" id="timeout" value="{$timeout}">
        </td>
    </tr>
</table>
<hr>
<div class="plugin-actions">
  <button type='submit' name='send_notification'>{msgPool type=okButton}</button>
  <button type='submit' name='cancel_notification'>{msgPool type=cancelButton}</button>
</div>

