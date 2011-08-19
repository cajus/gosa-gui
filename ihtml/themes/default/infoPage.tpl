<div style="padding:3px">
{if $personalInfoAllowed}

    <h3>{tr}User information{/tr}</h3>

    <table width="100%">
        <tr>
            <td style='width:200px; vertical-align: middle;' >
                {if $jpegPhoto == ""}
                    <img  src="plugins/users/html/images/default.jpg" alt=''>
                {else}
                    <img  src="getbin.php?rand={$rand}" alt='' style='border:1px solid #CCC; max-width:147px; max-height: 200px; vertical-align: middle;' >
                {/if}
            </td>
            <td style="width:40%">
                <table>
                    {if $uid != ""}<tr><td>{tr}User ID{/tr}:</td><td><i>{$uid}</i></td></tr>{/if}
                    {if $sn != ""}<tr><td>{tr}Surname{/tr}:</td><td><i>{$sn}</i></td></tr>{/if}
                    {if $givenName != ""}<tr><td>{tr}Given name{/tr}:</td><td><i>{$givenName}</i></td></tr>{/if}
                    {if $personalTitle != ""}<tr><td>{tr}Personal title{/tr}:</td><td><i>{$personalTitle}</i></td></tr>{/if}
                    {if $academicTitle != ""}<tr><td>{tr}Academic title{/tr}:</td><td><i>{$academicTitle}</i></td></tr>{/if}
                    {if $homePostalAddress != ""}<tr><td style="padding-top:15px">{tr}Home postal address{/tr}:</td><td style="padding-top:15px"><i>{$homePostalAddress}</i></td></tr>{/if}
                    {if $dateOfBirth != ""}<tr><td style="padding-top:15px">{tr}Date of birth{/tr}:</td><td style="padding-top:15px"><i>{$dateOfBirth}</i></td></tr>{/if}
                    {if $mail != ""}<tr><td style="padding-top:15px">{tr}Mail{/tr}:</td><td style="padding-top:15px"><i>{$mail}</i></td></tr>{/if}
                    {if $homePhone != ""}<tr><td>{tr}Home phone number{/tr}:</td><td><i>{$homePhone}</i></td></tr>{/if}
                </table>
            </td>
            <td style="border-left:1px solid #CCC; padding-left:10px">
                <table>
                    {if $o != ""}<tr><td>{tr}Organization{/tr}:</td><td><i>{$o}</i></td></tr>{/if}
                    {if $ou != ""}<tr><td>{tr}Organizational Unit{/tr}:</td><td><i>{$ou}</i></td></tr>{/if}
                    {if $l != ""}<tr><td style="padding-top:15px">{tr}Location{/tr}:</td><td style="padding-top:15px"><i>{$l}</i></td></tr>{/if}
                    {if $street != ""}<tr><td>{tr}Street{/tr}:</td><td><i>{$street}</i></td></tr>{/if}
                    {if $departmentNumber != ""}<tr><td style="padding-top:15px">{tr}Department number{/tr}:</td><td style="padding-top:15px"><i>{$departmentNumber}</i></td></tr>{/if}

                    {if $employeeNumber != ""}<tr><td style="padding-top:15px">{tr}Employee number{/tr}:</td><td style="padding-top:15px"><i>{$employeeNumber}</i></td></tr>{/if}
                    {if $employeeType != ""}<tr><td>{tr}Employee type{/tr}:</td><td><i>{$employeeType}</i></td></tr>{/if}

                </table>
            </td>
        </tr>
    </table>

{/if}

{if $plugins != ""}
<hr>
<h3>{tr}User settings{/tr}</h3>
    {$plugins}
    <div class="clear"></div>
{/if}

{if !$personalInfoAllowed && $plugins == ""}
    <div style='width:100%;text-align:center;padding-top:100px;padding-bottom:100px'>
    <b>{tr}You have no permission to edit any properties. Please contact your administrator.{/tr}</b>
    </div>
{/if}

{if $managersCnt != 0}
    <hr>
    <h3>{tr}Administrative contact{/tr}</h3>
    {foreach from=$managers item=item}
        <div style='float:left; padding-right:20px;'>
        {$item.str}
        </div>
    {/foreach}
 </div>
{/if}

<div class="clear"></div>
<hr>
<div class="copynotice">&copy; 2002-{$year} <a href="http://gosa.gonicus.de">{tr}The GOsa team{/tr}, {$revision}</a></div>
<input type="hidden" name="ignore">

