<h3>{tr}Log on script management{/tr}</h3>

    <input type="hidden" name="dialogissubmitted" value="1">

    <table summary="{tr}Log on script management{/tr}" width="100%">
    	<tr>
			<td class='right-border'>

					<table summary="{tr}Log on script settings{/tr}">
						<tr>
							<td><LABEL for="LogonName">{tr}Script name{/tr}</LABEL>
							</td>
							<td>
								<input type="text" size=20 value="{$LogonName}" name="LogonName" {$LogonNameACL} id="LogonName">
							</td>
						</tr>
						<tr>
							<td><LABEL for="LogonDescription">{tr}Description{/tr}</LABEL>
							</td>
							<td>
								<input type="text" size=40 value="{$LogonDescription}" name="LogonDescription" id="LogonDescription"> 
							</td>
						</tr>
						<tr>
							<td><LABEL for="LogonPriority">{tr}Priority{/tr}</LABEL>
							</td><td>
				            	<select name="LogonPriority" id="LogonPriority" size=1>
                					{html_options values=$LogonPriorityKeys output=$LogonPrioritys selected=$LogonPriority}
                				</select>
							</td>
						</tr>
					</table>
			</td>
			<td>

					<table summary="{tr}Log on script flags{/tr}">
						<tr>
							<td>
								<input type="checkbox" value="L" name="LogonLast" {$LogonLastCHK} id="LogonLast">
							<LABEL for="LogonLast">{tr}Last script{/tr}</LABEL>
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" value="O" name="LogonOverload" {$LogonOverloadCHK} id="LogonOverload">
								<LABEL for="LogonOverload">{tr}Script can be replaced by user{/tr}</LABEL>
							</td>
						</tr>
					</table>
			</td>
		</tr>
	</table>
	
  <hr>

	<h3>{tr}Script{/tr}</h3>
	<table width="100%" summary="{tr}Log on script{/tr}">
		<tr>
			<td>
				<textarea style="width:100%;height:400px;" name="LogonData">{$LogonData}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="file" name="importFile" id="importFile">
				<button type='submit' name='StartImport'>{tr}Import{/tr}</button>
			</td>
		</tr>
	</table>

  <hr>
  <div class="plugin-actions">
    <button type='submit' name='LogonSave'>{msgPool type=applyButton}</button>
    <button type='submit' name='LogonCancel'>{msgPool type=cancelButton}</button>
  </div>

<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('LogonName');
  -->
</script>

