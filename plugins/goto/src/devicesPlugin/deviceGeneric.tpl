
<h3>{tr}Devices{/tr}</h3>

<table width="100%" summary="{tr}Edit devices{/tr}">
 <tr>
  <td>

   <table style='width:100%' class='right-border' summary="{tr}Generic settings{/tr}">
    <tr>
     <td><LABEL for="base">{tr}Base{/tr}</LABEL></td>
     <td>
      {render acl=$baseACL}
       {$base}
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="cn">{tr}Device name{/tr}</LABEL>{$must}</td>
     <td>
      {render acl=$cnACL}
       <input type="text" size=40 value="{$cn}" name="cn" id="cn">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
     <td>
      {render acl=$descriptionACL}
       <input type="text" size=40 value="{$description}" name="description" id="description">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Device type{/tr}</LABEL></td>
     <td>
      {render acl=$typeACL}
       <select id="type" size="1" name="type" title="{tr}Choose the device type{/tr}">
        {html_options options=$types selected=$type}
       </select>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td>
   <table summary="{tr}Serial settings{/tr}">
    <tr>
     <td><LABEL for="devID">{tr}Serial number{/tr}&nbsp;{tr}(iSerial){/tr}</LABEL>{$must}</td>
     <td>
      {render acl=$devIDACL}
       <input type="text" value="{$devID}" name="devID" id="devID">
      {/render}
     </td>
     <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
     <td><LABEL for="vendor">{tr}Vendor-ID{/tr}&nbsp;{tr}(idVendor){/tr}</LABEL>{$must}</td>
     <td>
      {render acl=$vendorACL}
       <input type="text" value="{$vendor}" name="vendor" id="vendor">
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="produkt">{tr}Product-ID{/tr}&nbsp;{tr}(idProduct){/tr}</LABEL>{$must}</td>
     <td>
      {render acl=$serialACL}
       <input type="text" value="{$serial}" name="serial" id="serial">
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<input type='hidden' value="1" name="deviceGeneric_posted">
<script language="JavaScript" type="text/javascript">
 <!-- // First input field on page    
  focus_field('name');  
 -->
</script>
