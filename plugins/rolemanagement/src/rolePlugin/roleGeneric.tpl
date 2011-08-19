<table style='width:100%;' summary="{tr}Edit role{/tr}">
  <tr>
    <td style='width:50%; padding-right:10px;' class='right-border'>


      <h3>
        {tr}Generic{/tr}
      </h3>

      <table style='width:100%;' summary="{tr}Generic settings{/tr}">
        <tr>
          <td>{tr}Name{/tr}{$must}</td>
          <td>
            {render acl=$cnACL}
             <input type='text' value='{$cn}' name='cn'>
            {/render}
          </td>
        </tr>
        <tr>
          <td>{tr}Description{/tr}</td>
          <td>
            {render acl=$descriptionACL}
             <input type='text' value='{$description}' name='description'>
            {/render}
          </td>
        </tr>
        <tr>
          <td>
            <div style="height:10px;"></div>
            <label for="base">{tr}Base{/tr}</label>
          </td>
          <td>
            <div style="height:10px;"></div>
      {render acl=$baseACL}
            {$base}
      {/render}
          </td>
        </tr>
        <tr>
          <td colspan="2"><hr><br></td>
        </tr>
        <tr>
          <td>{tr}Phone number{/tr}</td>
          <td>
            {render acl=$telephoneNumberACL}
             <input type='text' value='{$telephoneNumber}' name='telephoneNumber'>
            {/render}
          </td>
        </tr>
        <tr>
          <td>{tr}Fax number{/tr}</td>
          <td>
            {render acl=$facsimileTelephoneNumberACL}
             <input type='text' value='{$facsimileTelephoneNumber}' name='facsimileTelephoneNumber'>
            {/render}
          </td>
        </tr>
      </table>

    </td>
    <td style='padding-left:10px;'>

      <h3>
        {tr}Occupants{/tr}
      </h3>

{render acl=$roleOccupantACL}
      {$memberList}
{/render}
{render acl=$roleOccupantACL}
      <button type='submit' name='edit_membership'>{msgPool type=addButton}</button>&nbsp;
{/render}
    </td>
  </tr>
</table>  
