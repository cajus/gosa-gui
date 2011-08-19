
<table style='width:100%; ' summary="{tr}Summary of used FAI classes{/tr}">
 <tr>
  <td>
   <h3>{tr}FAI object tree{/tr}
   </h3>
  </td>
 </tr>
 
 {if $readable}
  <tr>
   <td>
    {image path="images/lists/reload.png" action="reloadList"}{tr}Reload class and release configuration from parent object.{/tr}
   </td>
  </tr>
  <tr>
   <td>
    {$objectList}
   </td>
  </tr>
  {else}
  <tr>
   <td>
    <h3>{tr}You are not allowed to view the FAI summary.{/tr}
    </h3>
   </td>
  </tr>
  
 {/if}
</table>
