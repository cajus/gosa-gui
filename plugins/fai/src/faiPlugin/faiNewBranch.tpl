

{if $iframe == false}
 <br>
 <p class="seperator">{tr}You are now going to create a branch or locked branch. This action clones the existing release to another release name. Branches can be modified as usual. FAI classes of locked branches cannot be modified, just additional classes are possible. Branch names should be alphanumeric, excluding the reserved names 'scripts', 'hooks', 'partitions', 'variables', 'templates' and 'FAI'.{/tr}
 </p>
 <p>{tr}Branches are created as sub releases of the currently selected branch. Creating a new branch named 1.0.2 in SARGE for example, will result in a new release called SARGE/1.0.2.{/tr}
  <br>
  <br>
 </p>
 <hr>
 <b>{tr}Please enter a name for the branch{/tr}</b>&nbsp;
 <input type="text" id="BranchName" name="BranchName" value="{$BranchName}" style="width:120px;">
 <hr>
 <div class="plugin-actions">
  <button type='submit' name='UseBranchName'>
  {msgPool type=applyButton}</button>
  <button type='submit' name='CancelBranchName'>
  {msgPool type=cancelButton}</button>
 </div><!-- Place cursor -->
 <script language="JavaScript" type="text/javascript"><!--	focus_field('BranchName');	--></script>
 {else}
 <h3>{tr}Processing the requested operation{/tr}
 </h3>{tr}As soon as the copy operation has finished, you can scroll down to end of the page and press the 'Continue' button to continue with the FAI management dialog.{/tr}
 <br>
 <br>
 <div style="margin:3px;background-color:white; border:1px solid #A0A0A0">
  <iframe src="?plug={$plugID}&amp;PerformBranch=1" width="100%" name="status" style="height:450px;background-color:#FFFFFF;">
  <p>{tr}Your browser doesn't support HTML IFRAME elements, please use this link to perform the requested operation.{/tr}
   <br>
   <a href='?plug={$plugID}&amp;PerformBranch=1' target="_blank" title="{tr}Perform requested operation.{/tr}">
   <b>{tr}Initiate operation{/tr}</b></a>
  </p></iframe>
 </div>
 <!--<hr>
 <div style="text-align: right;width:99%;">
  <p>
   <input type="submit" name="CancelBranchName" value="{msgPool type=backButton}">
  </p>
 </div>-->
 
{/if}
