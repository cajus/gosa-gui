<table summary="{tr}Fax reports{/tr}">
 <tr>
  <td> 
   <a href="plugins/gofax/getfax.php?id={$detail}&amp;download=1">
     <img src='plugins/gofax/getfax.php?id={$detail}' align="bottom" alt="{tr}Click on fax to download{/tr}">
     <br> {tr}Click on fax to download{/tr}
   </a>
  </td>
  <td style="width:20px;">
    &nbsp;
  </td>
  <td>

    <table summary="{tr}Entry list{/tr}" border=0 cellspacing=5>
     <tr>
      <td><b>{tr}FAX ID{/tr}</b></td>
      <td>{$fax_id}</td>
     </tr>
     <tr>
      <td><b>{tr}User{/tr}</b></td>
      <td>{$fax_uid}</td>
     </tr>
     <tr>
      <td><b>{tr}Date / Time{/tr}</b></td>
      <td>{$date} / {$time}</td>
     </tr>
     <tr>
      <td><b>{tr}Sender MSN{/tr}</b></td>
      <td>{$fax_sender_msn}</td>
     </tr>
     <tr>
      <td><b>{tr}Sender ID{/tr}</b></td>
      <td>{$fax_sender_id}</td>
     </tr>
     <tr>
      <td><b>{tr}Receiver MSN{/tr}</b></td>
      <td>{$fax_receiver_msn}</td>
     </tr>
     <tr>
      <td><b>{tr}Receiver ID{/tr}</b></td>
      <td>{$fax_receiver_id}</td>
     </tr>
     <tr>
      <td><b>{tr}Status{/tr}</b></td>
      <td>{$fax_status}</td>
     </tr>
     <tr>
      <td><b>{tr}Status message{/tr}</b></td>
      <td>{$fax_status_message}</td>
     </tr>
     <tr>
      <td><b>{tr}Transfer time{/tr}</b></td>
      <td>{$fax_transfer_time}</td>
     </tr>
     <tr>
      <td><b>{tr}# pages{/tr}</b></td>
      <td>{$fax_pages}</td>
     </tr>
    </table>

  </td>
 </tr>
</table>

<hr>
<div class="plugin-actions">
  <button type='submit' name='bck_to_list'>{msgPool type=backButton}</button>

</div>
