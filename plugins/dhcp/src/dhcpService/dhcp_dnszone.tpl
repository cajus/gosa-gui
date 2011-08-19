{* GOsa dhcp host - smarty template *}
<h3>{tr}DNS update zone{/tr}</h3>

<table>
 <tr>
   <td>{tr}DNS zone{/tr}{$must}</td>
   <td>
     <select name='cn' > 
       {html_options options=$cns selected=$cn}
     </select>
   </td>
 </tr>
   <td>{tr}DNS server{/tr}{$must}</td>
   <td>
     <select name='dhcpDnsZoneServer'  >
       {html_options options=$dhcpDnsZoneServers selected=$dhcpDnsZoneServer}
     </select>
   </td>
 </tr>
 <tr>
   <td>{tr}Key DN{/tr}{$must}</td>
   <td>
     <select name='dhcpKeyDN'>
       {html_options options=$dhcpKeyDNs selected=$dhcpKeyDN}
     </select>
  </td>
 </tr>
</table>

<input type='hidden' name='dhcp_dnszone_posted' value='1'>

<hr>

<!-- Place cursor in correct field -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	 focus_field('cn');
  -->
</script>
