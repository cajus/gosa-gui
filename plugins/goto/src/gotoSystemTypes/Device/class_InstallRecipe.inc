<?php

class InstallRecipe extends plugin
{

    public $rpcErrorMessage = "";
    public $deviceUUID = "";

    // Template options
    public $installTemplate = "";
    public $installationTemplateNames = array();
    public $templateToRelease = array();
    public $installationTemplates = array();
    
    // The selected installation release
    public $installRelease = "";

    // Selected config management variant
    public $installConfigManagement = '';
    public $installConfigManagementList = array();

    // Bootstrap method
    public $installBaseMethod = '';
    public $installBaseMethodList = array();

    // Timezone settings
    public $installTimezone = "";
    public $installTimeUTC = "";

    // Kernel packages
    public $installKernelPackage = "";
    public $installKernelPackageList = array();

    // System Locale
    public $installSystemLocale = "";
    public $installSystemLocaleList = array();

    // Selected NTP Server
    public $installNTPServer = array();
    public $installNTPServerList = NULL;

    // Root password
    public $installRootEnabled = "";
    public $installRootPasswordHash = "";
    public $setPasswordHash = FALSE;

    // Partition table variables
    public $installPartitionTable = "";
    private $partitionEdit = NULL;

    // Keyboard-layout attribute
    public $installKeyboardlayout = "";
    public $installKeyboardlayoutList = array();

    // Mirror related attribute
    public $installMirror = "";
    public $installMirrorList = array();

    public $objectclasses = array();
    public $attributes = array("installRelease", "installTemplate","installKeyboardlayout","installSystemLocale",
            "installTimezone","installTimeUTC","installNTPServer","installMirror",
            "installRootEnabled","installRootPasswordHash","installKernelPackage",
            "installPartitionTable","installConfigManagement","installBaseMethod");


    /* Some plugin management related attributes 
     * See class plugin for details.
     */
    public $view_logged = FALSE;
    public $ignore_account = FALSE;
    public $parent = NULL;

    /*! \brief  Initialize the plugin and its widgets. 
     *          Finally call init() to load values from the backend.
     */ 
    function __construct(&$config, $dn, $parent)
    {
        plugin::plugin($config, $dn);

        $this->is_account = $this->initially_was_account = FALSE;

        $this->_device = &$parent;
        $this->deviceUUID = $parent->deviceUUID;

        // Set default password hash
        $this->hash = $this->config->get_cfg_value("core","passwordDefaultHash"); 

        // Get list of password hashes
        $tmp = passwordMethod::get_available_methods();
        $this->hashes = array();
        foreach($tmp['name'] as $name){
            $this->hashes[$name] = $name;
        }

        // Initialize plugin
        $this->init_static_info();
        $this->init($initially = TRUE); 
    }

    function init($initially = FALSE)
    {
        // Init the object values.
        $this->init_client_info();

        // Prepare NTP servers list 
        $this->installNTPServerList= new sortableListing($this->installNTPServer);
        $this->installNTPServerList->setDeleteable(true);
        $this->installNTPServerList->setEditable(false);
        $this->installNTPServerList->setColspecs(array('*'));
        $this->installNTPServerList->setWidth("100%");
        $this->installNTPServerList->setHeight("70px");

        // Preset values for new devices
        if(!$this->is_account){
            $this->installTemplate = key($this->installationTemplates);
            $this->installRelease = key($this->templateToRelease[$this->installTemplate]);
        }else{

            if(!isset($this->installationTemplates[$this->installTemplate])){

                // The selected template is no longer available, select the next selectable template.
                $new = key($this->installationTemplates);

                if($initially){
                    $message = sprintf(tr("The selected template '%s' is no longer available. Selecting '%s' as replacement!"), 
                            $this->installTemplate, $new);
                    msg_dialog::display(tr("Warning"), $message, WARNING_DIALOG);
                }
                $this->installTemplate = $new;
                $installRelease = key($this->templateToRelease[$this->installTemplate]); 

            }elseif(!isset($this->installationTemplates[$this->installTemplate]['method'])){

                // Not necessary to warn the user here, the input fields will be empty and thus
                //  avoid saving.

            }elseif(!in_array_strict($this->installRelease, $this->templateToRelease[$this->installTemplate])){

                // The selected release is no longer available for the current template
                // Warn the user and select the next selectable release.
                $new = key($this->templateToRelease[$this->installTemplate]); 
                if($initially){
                    $message = sprintf(tr("The selected release '%s' is no longer available. Selecting '%s' as replacement!"),
                            $this->installRelease, $new);
                }
                $this->installRelease = $new;
                msg_dialog::display(tr("Warning"), $message, WARNING_DIALOG);
            }
        } 

        // Update selectable items like kernels and mirrors depending on the current setup (relase)
        $this->installBaseMethod = $this->installationTemplates[$this->installTemplate]['method'];
        $this->reloadInstallationKernelPackages($initially);
        $this->reloadInstallationMirrors($initially);

        // Preset the config management method.
        if(!isset($this->installConfigManagementList[$this->installBaseMethod][$this->installConfigManagement])){
            if(isset($this->installConfigManagementList[$this->installBaseMethod]) && 
                count($this->installConfigManagementList[$this->installBaseMethod])){
                $this->installConfigManagement = key($this->installConfigManagementList[$this->installBaseMethod]);
            }
        }
    }

   
    /*! \brief   Loads client-information values from the GOsa-backend using jsonRPC 
     */ 
    function init_client_info()
    {
        if(empty($this->deviceUUID)){
            return;
        }

        // Load base install Method
        $rpc = $this->config->getRpcHandle();
        $bMethod = $rpc->systemGetBaseInstallMethod($this->deviceUUID);
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            msg_dialog::display(tr("Error"), msgPool::rpcError($this->rpcErrorMessage), ERROR_DIALOG);
            return(NULL);
        }

        // Do nothing while no install method is defined.
        if(!$bMethod){
            return;
        }        

        // Set the bootstrap method.
        $this->installBaseMethod = $bMethod;

        $res = $rpc->systemGetBaseInstallParameters($this->deviceUUID);
       
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            msg_dialog::display(tr("Error"), msgPool::rpcError($this->rpcErrorMessage), ERROR_DIALOG);
            return(NULL);
        }
   
        // Apply received options
        $this->is_account = $res == True;
        if($this->is_account){

            $map = array(
                    'ntp-servers' => "installNTPServer", 
                    'template' => "installTemplate", 
                    'keyboard-layout' => "installKeyboardlayout");

            // We receive an array for these attributes, but require a string instead
            //  we just use the first element of the array.
            $mapArray = array(
                    'release' => "installRelease", 
                    'timezone' => "installTimezone", 
                    'utc' => "installTimeUTC", 
                    'kernel' => "installKernelPackage", 
                    'system-locale' => "installSystemLocale", 
                    'root-user' => "installRootEnabled", 
                    'root-hash' => "installRootPasswordHash", 
                    'disk-setup' => "installPartitionTable");
 
            foreach($res as $name => $data){
                if(isset($map[$name])){
                    $target = $map[$name];
                    $value = $res[$name];
                }elseif(isset($mapArray[$name])){
                    $target = $mapArray[$name];
                    $value = $res[$name][0];
                }
                $this->$target = $value;
            }

            // Convert Bool values to Bool.
            $boolean = array("installRootEnabled", "installTimeUTC");
            foreach($boolean as $attr){
                $this->$attr = ($this->$attr != FALSE && !preg_match("/false/i", $this->$attr));
            }
        }

        return;
    }


    function init_static_info()
    { 
        // Load static values.
        foreach(array(
                "timeozones" => "getTimezones",
                "distributions" => "loadDistributions",
                "keyboardLayouts" => "loadInstallationKeyboardLayouts",
                "installationTemplates" => "loadInstallationTemplates",
                "installationMethods" => "loadInstallationMethods",
                "locales" => "getSystemLocales"    ) as $target => $func){

            if(!session::is_set("InstallRecipe::{$func}")){
                $tmp = $this->$func();
                if($tmp == NULL){
                    $this->initFailed = TRUE;
                    msg_dialog::display(tr("Error"), msgPool::rpcError($this->rpcErrorMessage), ERROR_DIALOG);
                    return;
                }else{
                    session::set("InstallRecipe::{$func}", $tmp);
                }
            }
            $$target = session::get("InstallRecipe::{$func}");
        }

        // Assign fetchted values
        $this->timezones = $timeozones;
        $this->installBaseMethodList = $installationMethods['installBaseMethodList'];
        $this->installConfigManagementList = $installationMethods['installConfigManagementList'];
        $this->installSystemLocaleList = $locales;
        $this->installKeyboardlayoutList = $keyboardLayouts;
        $this->distributions = $distributions;

        # Create template to relase map
        $this->templateToRelease = array();

        // Walk through installation templates and use the 'repositories' attribute
        // to supported releases.
        foreach($installationTemplates as $name => $tdata){
            
            $mName = isset($this->installBaseMethodList[$tdata['method']]) ? 
                $this->installBaseMethodList[$tdata['method']]: $tdata['method'];

            $this->installationTemplateNames[$name] = $tdata['description']." (".$mName.")";
            $this->installationTemplates[$name] = $tdata;
            $this->templateToRelease[$name] = array();

            // Check if the 'repository'-category of the template can be found in any 
            // received release list.
            if(isset($installationMethods[$tdata['method']]['repositories'])){
                $repos = $installationMethods[$tdata['method']]['repositories'];
                foreach($distributions as $dist){
                    if(in_array_strict($dist['type']['name'],$repos) && isset($dist['releases'])){
                        foreach($dist['releases'] as $release){
                            $rname = $dist['name'].'/'.$release['name'];
                            $this->templateToRelease[$name][$rname] = $rname;
                        }
                    }
                }
            }
        }
    }


    function check()
    {
            // Check if the parents deviceUUID has changed
            if($this->deviceUUID != $this->_device->deviceUUID){
                $this->deviceUUID = $this->_device->deviceUUID;
                print "The device uuid has changed.";
            }
    }
    
    
    function execute()
    {
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
                $display= $this->show_disable_header(tr("Remove base installation"),
                        msgPool::featuresEnabled(tr("Base installation")));
            } else {
                $display= $this->show_enable_header(tr("Add base installation"),
                        msgPool::featuresDisabled(tr("Base installation")));
                return ($display);
            }
        }

        /***************
          Root password hash dialog
         ***************/

        $this->dialog = FALSE;
        if($this->setPasswordHash){
            $this->dialog = TRUE;
            $smarty = get_smarty();
            $smarty->assign('hashes', set_post($this->hashes));
            $smarty->assign('hash', set_post($this->hash));
            return($smarty->fetch(get_template_path('goto/Device/SetPassword.tpl', TRUE)));
        }

        /***************
          Partition dialog
         ***************/

        if(isset($_POST['partition_finish']) && $this->partitionEdit){
            $this->installPartitionTable = $this->partitionEdit->save();
            $this->partitionEdit = NULL;
        }
        if(isset($_POST['partition_cancel']) && $this->partitionEdit){
            $this->partitionEdit = NULL;
        }
        if(isset($_POST['edit_installPartitionTable'])){
            $this->partitionEdit = new DevicePartition($this->config, $this->installPartitionTable);
        }
        if($this->partitionEdit){
            $this->partitionEdit->save_object();
            $this->dialog = TRUE;
            return($this->partitionEdit->execute());
        }



        /***************
          Generate HTML content
         ***************/

        $this->installNTPServerList->setAcl($this->getacl('installNTPServer'));
        $this->installNTPServerList->update();

        plugin::execute();    
        $smarty = get_smarty();

        // Assign ACLs
        foreach($this->attributes as $attr){
            $smarty->assign("{$attr}ACL", $this->getacl($attr));
        }

        $smarty->assign('installTemplateList', $this->installationTemplateNames);
        $smarty->assign('installReleaseList', $this->templateToRelease[$this->installTemplate]);
        $smarty->assign('timezones', $this->timezones);
        $smarty->assign('installKeyboardlayoutList', $this->installKeyboardlayoutList);
        $smarty->assign('installKernelPackageList', $this->installKernelPackageList);
        $smarty->assign('installMirrorList', $this->installMirrorList);
        $smarty->assign('installSystemLocaleList', $this->installSystemLocaleList);
        $smarty->assign('installNTPServerList', $this->installNTPServerList->render());

        $smarty->assign('installBaseMethod', $this->installBaseMethod);
        $smarty->assign('installBaseMethodList', $this->installBaseMethodList);
        $smarty->assign('installConfigManagement', $this->installConfigManagement);

        // Assign list of available config-management types.
        if(isset($this->installConfigManagementList[$this->installBaseMethod])){ 
            $smarty->assign('installConfigManagementList', $this->installConfigManagementList[$this->installBaseMethod]);
        }else{
            $smarty->assign('installConfigManagementList', array());
        }

        foreach($this->attributes as $attr){
            $smarty->assign($attr, $this->$attr);
        }
        $this->dialog = false;
        return($display.$smarty->fetch(get_template_path('goto/Device/InstallRecipe.tpl', TRUE)));
    }


    function save_object()
    {
        if(isset($_POST['InstallRecipePosted'])){

            $currentInstallMethod = $this->installConfigManagement;

            $oldRelease = $this->installRelease;
            plugin::save_object();
            $this->installRootEnabled = isset($_POST['installRootEnabled']);
            $this->installTimeUTC = isset($_POST['installTimeUTC']);


            if(isset($_POST['setPasswordHash'])){
                $this->setPasswordHash = true;
            }

            $this->installNTPServerList->save_object();
            $this->installNTPServer = $this->installNTPServerList->getMaintainedData();
            if(isset($_POST['installNTPServer_Input']) && isset($_POST['installNTPServer_Add'])){
                $add = get_post('installNTPServer_Input');
                if(!in_array_strict($add, $this->installNTPServer) && !empty($add)){
                    $this->installNTPServer[] = $add;
                }
            }
            $this->installNTPServerList->setListData($this->installNTPServer);
            $this->installBaseMethod = $this->installationTemplates[$this->installTemplate]['method'];

            // The selected release is no longer available for the current template
            if(!in_array_strict($this->installRelease, $this->templateToRelease[$this->installTemplate])){
                $this->installRelease = key($this->templateToRelease[$this->installTemplate]);
            }

            // Reload list of kernel packages and mirrors
            if($oldRelease != $this->installRelease){
                $this->reloadInstallationKernelPackages();
                $this->reloadInstallationMirrors();
            }
        }

        if(isset($_POST['cancelPassword'])) $this->setPasswordHash =false;
        if(isset($_POST['setPassword'])) {
            $this->setPasswordHash =false;
            $hash = get_post('passwordHash');

            // Not sure, why this is here, but maybe some encryption methods require it.
            mt_srand((double) microtime()*1000000);

            // Generate the requested hash
            $methods = new passwordMethod($this->config, $this->dn);
            $available = $methods->get_available_methods();
            $test = new $available[$hash]($this->config,$this->dn);
            $this->installRootPasswordHash = @$test->generate_hash(get_post('rootPassword'));
        }
    }


    function save()
    {
        if(!$this->installRootEnabled) $this->installRootPasswordHash = "";

        $map = array(
            "installTemplate"=>'template',
            "installRelease"=>'release',
            "installTimezone"=>'timezone',
            "installTimeUTC"=>'utc',
            "installKernelPackage"=>'kernel',
            "installSystemLocale"=>'system-locale',
            "installRootEnabled"=>'root-user',
            "installRootPasswordHash"=>'root-hash',
            "installPartitionTable"=>'disk-setup',
            "installKeyboardlayout"=>'keyboard-layout',
            "installBaseMethod"=>'method',
            );

        // Collect values to be saved.
        $data = array();
        foreach($map as $source => $dest){
            if(!empty($this->$source)){
                $data[$dest] = $this->$source;
             }
        } 

        // Enforce an array for ntp-servers
        if(!empty($this->installNTPServer)){
            $data['ntp-servers'] = array_values($this->installNTPServer);
        }

        // Save Boolean like a String 
        $boolean = array("root-user" => "installRootEnabled", "utc" => "installTimeUTC");
        foreach($boolean as $attr => $source){
            $data[$attr] = ($this->$source) ? $data[$attr] = "TRUE" : $data[$attr] = "FALSE";
        }

        // Set the base installation parameters
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->systemSetBaseInstallParameters($this->deviceUUID, $data);
       
        // Handle errors
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            msg_dialog::display(tr("Error"), msgPool::rpcError($this->rpcErrorMessage), ERROR_DIALOG);
            return(NULL);
        }
    }

    
    function remove_from_parent()
    {
        // Try to remove the base install extension.
        $rpc = $this->config->getRpcHandle();
        $bMethod = $rpc->removeBaseInstallParameters($this->deviceUUID);
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            msg_dialog::display(tr("Error"), msgPool::rpcError($this->rpcErrorMessage), ERROR_DIALOG);
            return(NULL);
        }
    }
 
    
    /*! \brief  Refreshes the list of selectable kernel packages.
     */
    function reloadInstallationKernelPackages($initially = FALSE)
    {
        // Do nothing if no release is given.
        if(empty($this->installRelease)){
            $this->installKernelPackageList = array();
            return;
        }

        $release = preg_replace("/^[^\/]*\//","", $this->installRelease);
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->getKernelPackages($release);
     
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            msg_dialog::display(tr("Error"), msgPool::rpcError($this->rpcErrorMessage), ERROR_DIALOG);
        }else{
            $this->installKernelPackageList = array();
            foreach($res as $data){
                $name = $data['name'];
                $this->installKernelPackageList[$name] = $name;
            }

            if(!isset($this->installKernelPackageList[$this->installKernelPackage])){
                $new = key($this->installKernelPackageList);
                if($initially && $this->is_account){
                    msg_dialog::display(tr("Warning"), sprintf(tr("The selected kernel package '%s' is no longer available! The kernel package '%s' was selected as replacement!"), $this->installKernelPackage, $new), WARNING_DIALOG);
                }
                $this->installKernelPackage = $new;
            }
        }
    }


    /*! \brief  Returns a list of distributions on success.
     *          In case of an error, it returns NULL.
     */
    function loadDistributions()
    {
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->getDistributions();
       
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            return(NULL);
        }
        return($res);
    }


    /*! \brief  Returns a list of timezones on success.
     *          In case of an error, it returns NULL.
     */
    function getTimezones()
    {
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->getTimezones();
       
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            return(NULL);
        }
        return($res);
    }
    

    /*! \brief  Returns a list of installation mirrors on success.
     *          In case of an error, it returns NULL.
     */
    function reloadInstallationMirrors($initially = FALSE)
    {
        $res = array(
                'dc=intranet,dc=gonicus,dc=de' => 'Intranet',
                'ou=systems,dc=intranet,dc=gonicus,dc=de' => 'System');
        $this->installMirrorList =$res;
    }


    /*! \brief  Returns a list of installation templates on success.
     *          In case of an error, it returns NULL.
     */
    function loadInstallationTemplates()
    {
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->installListTemplates();
       
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            return(NULL);
        }
        return($res);
    } 


    /*! \brief  Returns a list of keyboard layouts on success.
     *          In case of an error, it returns NULL.
     */
    function loadInstallationKeyboardLayouts()
    {
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->getKeyboardModels();
       
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            return(NULL);
        }
        $lay = array();
        foreach($res as $key => $data){
            $lay[$key] = "{$data[0]} - {$data[2]}";
        }
        asort($lay);
        return($lay);
    } 

    
    /*! \brief  Returns a list of system locales on success.
     *          In case of an error, it returns NULL.
     */
    function getSystemLocales()
    {
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->getSystemLocales();
      
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            msg_dialog::display(tr("Error"), msgPool::rpcError($this->rpcErrorMessage), ERROR_DIALOG);
            return(NULL);
        }

        return($res);
    }
 

    /*! \brief  Try to load install and bootstrap methods from the GOsa-backend
     *          This is done via jsonRPC, if calling the backend method fails,
     *           this method returns FALSE, in case of success it return TRUE; 
     */ 
    function loadInstallationMethods()
    { 
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->getSupportedBaseInstallMethods();
      
        // Failed to load backend values, keep reported error and return with FALSE; 
        $this->rpcError = !$rpc->success();
        if(!$rpc->success()){
            $this->rpcErrorMessage = $rpc->get_error();
            return(NULL);
        }

        // Walk through result and set bootstrap methods.
        foreach($res as $name => $method){
            $res['installBaseMethodList'][$name] = $method['name'];
            foreach($method['methods'] as $m){
                $res['installConfigManagementList'][$name][$m] = $m; 
            }
        }
        return($res);
    }
    

    static function plInfo()
    {
        return (array(
                    "plShortName"   => tr("Device"),
                    "plDescription" => tr("Registered device"),
                    "plSelfModify"  => FALSE,
                    "plDepends"     => array(),
                    "plPriority"    => 1,
                    "plSection"     => array("administration"),
                    "plCategory"    => array("Device"),
                    "plProvidedAcls" => array(

                        "installRelease" => tr("Release"),
                        "installTemplate" => tr("Template"),
                        "installKeyboardlayout" => tr("Keyboard layout"),
                        "installSystemLocale" => tr("Locale"),
                        "installTimezone" => tr("Timezone"),
                        "installTimeUTC" => tr("Utc"),
                        "installNTPServer" => tr("Ntp server"),
                        "installMirror" => tr("Mirror"),
                        "installRootEnabled" => tr("Root login enabled"),
                        "installRootPasswordHash" => tr("Root password hash"),
                        "installKernelPackage" => tr("Kernel package"),
                        "installConfigManagement" => tr("Config mangement"),
                        "installBaseMethod" => tr("Bootstrap method"),
                        "installPartitionTable" => tr("Partition table")
                        )
                        )
                        );
    }
}
?>
