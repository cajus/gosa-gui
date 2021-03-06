{if !$pg}
  <h3>{tr}Open-Xchange account{/tr} - {tr}disabled, no PostgreSQL support detected or the specified database can't be reached.{/tr}</h3>
{else}
  <h3>
<input type="checkbox" name="oxchange" value="B" 
	{$oxchangeState} {$oxchangeAccountACL} 
	onCLick="	
	{if $OXAppointmentDays_W} 
		changeState('OXAppointmentDays');
	{/if}
	{if $OXTaskDays_W} 
		changeState('OXTaskDays');
	{/if}
	{if $OXTimeZone_W} 
		changeState('OXTimeZone'); 
	{/if}
	">
{tr}Open-Xchange account{/tr}</h3>


<table style='width:100%; ' summary="{tr}Open-Xchange configuration{/tr}">


 <!-- Headline container -->
 <tr>
   <td style='width:50%; '>

     <table style="margin-left:4px;" summary="{tr}Open-Xchange configuration{/tr}">
       <tr>
         <td colspan="2">

           <b>{tr}Remember{/tr}</b>
         </td>
       </tr>
       <tr>
         <td><LABEL for="OXAppointmentDays">{tr}Appointment Days{/tr}</LABEL></td>
	 <td>

{render acl=$OXAppointmentDaysACL}	
<input type='text' name="OXAppointmentDays" id="OXAppointmentDays" size=7 maxlength=7 value="{$OXAppointmentDays}" {$oxState} >
{/render}
	 {tr}days{/tr}</td>
       </tr>
       <tr>
         <td><LABEL for="OXTaskDays">{tr}Task Days{/tr}</LABEL></td>
	 <td>

{render acl=$OXTaskDaysACL}	
<input type='text' name="OXTaskDays" id="OXTaskDays" size=7 maxlength=7 value="{$OXTaskDays}" {$oxState} >
{/render}

	 {tr}days{/tr}
	</td>
       </tr>
     </table>
   </td>
   <td class='left-border' rowspan="2">

     &nbsp;
   </td>
   <td>

     <table summary="{tr}Open-Xchange configuration{/tr}">
       <tr>
         <td colspan="2">

           <b>{tr}User Information{/tr}</b>
         </td>
       </tr>
       <tr>
         <td><LABEL for="OXTimeZone">{tr}User Timezone{/tr}</LABEL></td>
	 <td>

{render acl=$OXTimeZoneACL}	
<select size="1" name="OXTimeZone" id="OXTimeZone" {$oxState} > 
 {html_options values=$timezones output=$timezones selected=$OXTimeZone}
 </select>
{/render}

	 </td>
       </tr>
       <tr>
         <td></td>
	 <td></td>
       </tr>
     </table>
   </td>
 </tr>
</table>
{/if}
