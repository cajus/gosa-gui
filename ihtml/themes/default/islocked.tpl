<div class='plugin'>
 <div class='inline-warning'>
  {image path="images/encrypted.png" align="top"}
  <div class='inline-warning-text'>{tr}Locking conflict detected{/tr}</div>
 </div>

 <hr>
 
 <p>
   {$message}
 </p>

 <p>
   {tr}If this lock detection is false, the other person has obviously closed the web browser during the edit operation. You may want to take over the lock by pressing the 'Edit anyway' button.{/tr}
 </p>

 <hr>
 
 <div class='plugin-actions'>
   <button type="submit" name="delete_lock">{$action}</button>
 	{if $allow_readonly}
   &nbsp;
   <button type="submit" name="open_readonly">{tr}Read only{/tr}</button>
 	{/if}
   &nbsp;
   <button type="submit" name="cancel_lock">{tr}Cancel{/tr}</button>
 </div>
       
 <input type="hidden" name="dn" value="{$dn}">
</div>
