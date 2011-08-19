<?php

class DeviceConfig extends plugin
{

    /* Some plugin management related attributes 
     * See class plugin for details.
     */
    public $view_logged = FALSE;
    public $ignore_account = FALSE;
    public $parent = NULL;

    public $parameterList = NULL;
    public $usedElementsList = NULL;
    public $assignableElementsList = NULL;

    public $usedElements = array();
    public $assignableElements = array();
    public $parameterValues = array();
    public $parameterWidgets = array();

    public $initialized = FALSE;


    /*! \brief  Initialize the plugin and its widgets. 
     */ 
    function __construct(&$config, $dn, $parent)
    {
        plugin::plugin($config, $dn);

        // Get the account information from the generic class.
        $this->is_account = $this->initially_was_account = FALSE;
        $this->_device = &$parent;
        $this->deviceUUID = $parent->deviceUUID;

        // Create assignable Elements list.
        $this->assignableElementsList = new sortableListing();
        $this->assignableElementsList->setDeleteable(FALSE);
        $this->assignableElementsList->setEditable(TRUE);
        $this->assignableElementsList->setWidth("100%");
        $this->assignableElementsList->setHeight("200px");
        $this->assignableElementsList->setHeader(array(tr("Name"),tr("Description"),tr("Add")));
        $this->assignableElementsList->setColspecs(array('*','*','20'));
        $this->assignableElementsList->setAcl($this->getacl(''));

        // Create used Elements list.
        $this->usedElementsList = new sortableListing();
        $this->usedElementsList->setDeleteable(TRUE);
        $this->usedElementsList->setInstantDelete(FALSE);
        $this->usedElementsList->setEditable(FALSE);
        $this->usedElementsList->setWidth("100%");
        $this->usedElementsList->setHeight("200px");
        $this->usedElementsList->setHeader(array(tr("Name"), tr("Description"), tr("Remove")));
        $this->usedElementsList->setColspecs(array('*','*','20'));
        $this->usedElementsList->setAcl($this->getacl(''));

        // Create parameter Elements list.
        $this->parameterList = new sortableListing();
        $this->parameterList->setDeleteable(FALSE);
        $this->parameterList->setInstantDelete(FALSE);
        $this->parameterList->setEditable(FALSE);
        $this->parameterList->setWidth("100%");
        $this->parameterList->setHeight("200px");
        $this->parameterList->setHeader(array(tr("Name"), tr("Description"), tr("Value")));
        $this->parameterList->setColspecs(array('*','*','350px'));
        $this->parameterList->setAcl($this->getacl(''));
    }


    function check()
    {
    }
    
   
    /*! \brief  Generates the HTML output for the plugin
     */ 
    function execute()
    {
        // Initialize to plugin
        if(!$this->initialized){

            // Load config settings for the current device.
            $rpc = $this->config->getRpcHandle();
            $res = $rpc->systemGetConfigParameters($this->deviceUUID);
            if(!$rpc->success()){
                $smarty = get_smarty();
                $smarty->assign("error", TRUE);
                $smarty->assign("errorMsg", msgPool::rpcError($rpc->get_error()));
                return($smarty->fetch(get_template_path('goto/Device/DeviceConfig.tpl', TRUE)));
            }else{

                // Initialization completed.
                $this->initialized = TRUE;
                $this->is_account = $this->initially_was_account = isset($res['item']);
                if(isset($res['var']))     $this->parameterValues = $res['var'];
                if(isset($res['item']))      $this->usedElements = $res['item'];
            }
        }

        // Load assignable elements.
        $rpc = $this->config->getRpcHandle();
        $release = $this->parent->by_object['InstallRecipe']->installRelease;
        $release = preg_replace("/^[^\/]+\//","", $release);
        $assignableElements = $rpc->listAssignableElements($release);
        if(!$rpc->success()){
            $smarty = get_smarty();
            $smarty->assign("error", TRUE);
            $smarty->assign("errorMsg", msgPool::rpcError($rpc->get_error()));
            return($smarty->fetch(get_template_path('goto/Device/DeviceConfig.tpl', TRUE)));
        }else{
            $this->assignableElements = $assignableElements;
        }

        // Log account access
        if($this->is_account && !$this->view_logged){
            $this->view_logged = TRUE;
            new log("view","Device/".get_class($this),$this->dn);
        }

        /***************
          Handle account state
         ***************/

        // Allow to add or remove the distribution list extension
        if(isset($_POST['modify_state'])){
            if($this->is_account && $this->acl_is_removeable()){
                $this->is_account= FALSE;
            }elseif(!$this->is_account && $this->acl_is_createable()){
                $this->is_account= TRUE;
            }
        }

        // Show account status-changer
        $display = "";
        if ($this->parent !== NULL){
            if ($this->is_account){
                $display= $this->show_disable_header(tr("Remove config mangement"),
                        msgPool::featuresEnabled(tr("Config management")));
            } else {
                $display= $this->show_enable_header(tr("Add Config management"),
                        msgPool::featuresDisabled(tr("Config management")));
                return ($display);
            }
        }

        /***************
          Create the HTML content with its lists
         ***************/

        // Fill list of assignable elements
        $data = $lData = array();;
        foreach($this->assignableElements as $name => $element){

            // skip already assigned elements
            if(in_array_strict($name, $this->usedElements)) continue;

            // Create the list elements.
            $data[$name] = $element;
            $desc = (isset($element['description'])) ? $element['description'] : '';
            $lData[$name] = array('data' => array($name, $desc));
            
        }
        $this->assignableElementsList->setListData($data, $lData);
        $this->assignableElementsList->update();

        // Build list of assigned Elements
        $data = $lData = array();;
        foreach($this->usedElements as $name){

            // check if the assgined element is still available, if not mark it in red.
            if(isset($this->assignableElements[$name])){
                $element = $this->assignableElements[$name];
                $data[$name] = $element;
                $desc = (isset($element['description'])) ? $element['description'] : '';
            }else{
                $element = NULL;
                $data[$name] = $element;
                $desc = "<font color='red'>".tr("Unknown config item")."</font>";
            }
            $lData[$name] = array('data' => array($name, $desc));
        }
        $this->usedElementsList->setListData($data, $lData);
        $this->usedElementsList->update();
        
        // Build up parameter list
        $data = $lData = array();;
        foreach($this->usedElements as $name){

            // Skip parameters for not existent items.
            if(!isset($this->assignableElements[$name]['parameter'])) continue;

            // Build up the parameter list using the 'TemplateWidget_string' class.
            $parameter = $this->assignableElements[$name]['parameter'];
            foreach($parameter as $param => $desc){
                $data[$param] = NULL;
                $value = (isset($this->parameterValues[$param])) ? $this->parameterValues[$param] : "";

                // Create template widget on demand.
                if(!isset($this->parameterWidgets[$param])){
                    $this->parameterWidgets[$param] = new TemplateWidget_stringLong($this->config, $param, $value, 
                            $desc, '', FALSE, 'string', $param);

                    $this->parameterWidgets[$param]->setWriteable(preg_match("/w/",$this->getacl('')));
                    $this->parameterWidgets[$param]->setReadable(preg_match("/r/",$this->getacl('')));
                }
                $w = $this->parameterWidgets[$param];
                $lData[$param] = array('data' => array($w->getDisplayName(),$desc, $w->render()));
            }
        }
        $this->parameterList->setListData($data, $lData);
        $this->parameterList->update();

        // Build up smarty template.
        $smarty = get_smarty();
        $smarty->assign("error", FALSE);
        $smarty->assign("assignableElementsList", $this->assignableElementsList->render());
        $smarty->assign("usedElementsList", $this->usedElementsList->render());
        $smarty->assign("parameterList", $this->parameterList->render());
        return($display.$smarty->fetch(get_template_path('goto/Device/DeviceConfig.tpl', TRUE)));
    }


    /*! \brief  Act on posted values.
     *          And keep track of posted values.
     */
    function save_object()
    {
        // Get posted parameter values
        foreach($this->parameterWidgets as $name => $w){
            if($w->isWriteable()){
                $w->save_object();
                $this->parameterValues[$name] = $w->getValue();
            }
        }

        if(preg_match("/w/", $this->getacl(''))){

            // Act on Add-Element actions
            $this->assignableElementsList->save_object();
            $action = $this->assignableElementsList->getAction();
            if($action['action'] == 'edit'){
                $this->usedElements[] = $this->assignableElementsList->getKey($action['targets'][0]);
                $this->usedElements = array_unique($this->usedElements);
            }

            // Act on Remove-Item actions
            $this->usedElementsList->save_object();
            $action = $this->usedElementsList->getAction();
            if($action['action'] == 'delete'){
                $name = $this->usedElementsList->getKey($action['targets'][0]);
                $this->usedElements = array_remove_entries_ics(array($name), $this->usedElements);
            }
        }
    }


    /*! \brief  Save changes back to the GOsa-ng server.
     */
    function save()
    {
        // If no items are assinged we've to remove the extension.
        if(!count($this->usedElements)) {
            $this->remove_from_parent();
            return;
        }

        // Load assignable elements.
        $rpc = $this->config->getRpcHandle();
        $release = $this->parent->by_object['InstallRecipe']->installRelease;
        $release = preg_replace("/^[^\/]+\//","", $release);
        $assignableElements = $rpc->listAssignableElements($release);
        if(!$rpc->success()){
            msg_dialog::display(tr("Error"), msgPool::rpcError($rpc->get_error()), ERROR_DIALOG);
            return(NULL);
        }else{
            $this->assignableElements = $assignableElements;
        }

        // Collect paramter list.
        $params = array();
        foreach($this->usedElements as $name){
            if(isset($this->assignableElements[$name]['parameter'])){
                $params = array_merge($params, $this->assignableElements[$name]['parameter']);
            }
        }  

        // Decide whoch parameter has to be saved and which has to be removed.
        $save = array();
        foreach($this->parameterValues as $name => $value){
            if(isset($params[$name])){
                $save[$name] = $value;
            }
        }

        // Save changes back to server.
        $rpc = $this->config->getRpcHandle();
        $installConfigManagement = $this->parent->by_object['InstallRecipe']->installConfigManagement;
        $rpc->systemSetConfigParameters($this->deviceUUID, array('method' => $installConfigManagement, 
                    'var' => $save, 'item' => array_values($this->usedElements)));
        if(!$rpc->success()){
            msg_dialog::display(tr("Error"), msgPool::rpcError($rpc->get_error()), ERROR_DIALOG);
            return(NULL);
        }
    }

    
    /*! \brief  Removes the account from the device.
     */
    function remove_from_parent()
    {
        // Save changes back to server.
        $rpc = $this->config->getRpcHandle();
        $rpc->removeConfigParameters($this->deviceUUID);
        if(!$rpc->success()){
            msg_dialog::display(tr("Error"), msgPool::rpcError($rpc->get_error()), ERROR_DIALOG);
            return(NULL);
        }
    }
 
    
    static function plInfo()
    {
        return (array(
                    "plShortName"   => tr("Device config"),
                    "plDescription" => tr("Device config"),
                    "plSelfModify"  => FALSE,
                    "plDepends"     => array(),
                    "plPriority"    => 1,
                    "plSection"     => array("administration"),
                    "plCategory"    => array("Device"),
                    "plProvidedAcls" => array(
                        )));
    }
}
?>
