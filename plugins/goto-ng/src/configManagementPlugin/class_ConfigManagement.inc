<?php

/*! \brief  This class allows to manage backend config items and packages.
 */
class ConfigManagement extends plugin
{
    var $initTime;
    var $plHeadline = "Config management";
    var $plDescription = "Config management";
    var $plIcon = "plugins/goto/html/images/ConfigManagement.png";

    var $selectedContainer;

    var $dataModel = NULL;
    var $listing = NULL;

    var $cfgItemMap = NULL;

    var $addableContainerItems = array();
    var $currentObject = NULL;
    var $itemsPerMethod = NULL;

    var $initFailed = TRUE;
    var $initialized = FALSE;
    var $errorMessage = "";


    /*! \brief  Initialize the plugin and finally update the data model.
     */
    function __construct($config, $dn)
    {
        $this->config = &$config;
        $this->listing = new cfgMgmtManagement($this->config, get_userinfo(), $this);

        // Load the template engine and tell her what template
        //  to use for the HTML it produces.
        $this->TemplateEngine = new TemplateEngine($config);
    }

    
    function init()
    {
        $success = TRUE;
        $success &= $this->loadInstallationMethods();
        $success &= $this->updateDataModel();
        $this->initFailed = !$success;
        if($success){
            $this->initialized = TRUE;
            $this->listing->setListingTypes($this->getListingTypes());
            $this->setCurrentContainer('/root');
        }
    }


    /*! \brief  Intializes this plugin
     *          All available installation methods will be loaded
     */
    function loadInstallationMethods()
    {
        // Get static installation methods.
        $this->installationMethods = json_decode(file_get_contents(get_template_path('goto/Config/root.json', TRUE)), TRUE);

        // Load configuration via rpc.
        $rpc = $this->config->getRpcHandle();

        // Load some base install parameters
        $res = $rpc->getSupportedBaseInstallMethods();
        $baseInstTypes = $installationTypes = $installationMethods = array();
        foreach($res as $type => $data){
            $baseInstTypes[$type] = $type;
            if(isset($data['repositories'])){
                foreach($data['repositories'] as $m){
                    $installationTypes[$m] = $m;
                }
            }
            if(isset($data['methods'])){
                foreach($data['methods'] as $m){
                    $installationMethods[$m] =$m;
                }
            }
        }

        $res = $rpc->getSupportedInstallMethods();
        if(!$rpc->success()){
            $this->errorMessage = $rpc->get_error();;
            return(FALSE);
        }

        // Populate install methods on success.
        if(!count($res)){
            $this->errorMessage = tr("No selectable install methods returned!");
            return(FALSE);
        }else{

            // Merge result with hard coded methods
            $this->installationMethods = array_merge($this->installationMethods, $res);

            // Walk through entries and create useful mappings.
            $this->cfgItemMap = array();
            $this->itemConfig = array();
            $this->itemsPerMethod = array();
            $rootElements = array('Release');
            foreach($this->installationMethods as $method => $items){
                foreach($items['items'] as $itemName => $item){
                    $this->itemsPerMethod[$method][] = $itemName;
                    $this->cfgItemMap[$itemName] = $method;
                    $this->itemConfig[$itemName] = &$this->installationMethods[$method]['items'][$itemName];
 
                    // This enables us to create the first level of config items when 
                    //  a release is selected.
                    if($item['name'] == "/" && $itemName != 'root'){
                        $rootElements = array_merge($rootElements, $item['container']);
                    }
                }
            }
        }

        // Fill replacements
        $map['%ROOT_CFG_ITEMS'] = &$rootElements;
        $map['%INSTALLATION_TYPES'] = array('dep' => 'dep', 'rpm' => 'rpm');
        $map['%INSTALLATION_METHODS'] = array('puppet' => 'puppet');
        $map['%BASE_INSTALLATION_METHODS'] = array('preseed' => 'preseed');
        $this->itemConfig = $this->__fillPlaceholder($this->itemConfig, $map);
        return(TRUE);
    }


    /*! \brief  Fill in replacements in the itemConfig
     *          Some values are dynamic and cannot be hardcoded, a placeholder is
     *           used in this case in the deinition file root.json. 
     */
    function __fillPlaceholder($data, $placeholder)
    {
        foreach($data as $name => $sData){
            if(is_array($sData)){
                $data[$name] = $this->__fillPlaceholder($data[$name], $placeholder);
            }elseif(is_string($sData) && isset($placeholder[$sData])){
                $data[$name] = &$placeholder[$sData];
            }
        }
        return($data);
    }


    /*! \brief  Updates all distributions, releases, packages and items in the dataModel
     *          Load information from the backend.
     */
    function updateDataModel()
    {
        // Recreate the data model, to have a clean and fresh instance.
        $this->dataModel = new ConfigManagementDataModel($this->config);

        // Load templates from the backend and append them on the base 
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->installListTemplates();
        if(!$rpc->success()){
            $this->errorMessage = sprintf(tr("Failed to load templates: %s"), $rpc->get_error());
            return(FALSE);
        } 
        foreach($res as $tName => $tData){
            $tData['name'] = $tName;
            $this->dataModel->addItem('Template','/root', $tName, $tData, '-');
        }


        // Load distributions 
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->getDistributions();
        if(!$rpc->success()){
            $this->errorMessage = sprintf(tr("Failed to load distributions: %s"), $rpc->get_error());
            return(FALSE);
        }else{
            if(is_array($res)){

                foreach($res as $dist){
           
                    // Simple strings 
                    $values = array();
                    foreach(array('origin','installation_method', 'installation_method','debian_security',
                            'debian_volatile', 'name', 'mirror_sources', 'managed', 'path') as $attr){
                        $values[$attr] = $dist[$attr];
                    }

                    // Boxed strings
                    foreach(array('type') as $attr){
                        $values[$attr] = $dist[$attr]['name'];
                    }

                    // Arrays
                    foreach(array('releases', 'architectures', 'components', 'sections') as $attr){
                        $values[$attr] = array();
                        if(is_array($dist[$attr])){
                            foreach($dist[$attr] as $aEntry){
                                $values[$attr][] = $aEntry['name'];
                            }
                        }
                    }
        
                    $this->dataModel->addItem('Distribution','/root', $dist['name'], $values);

                    if(isset($dist['releases'])){

                        // Sort releases by name length
                        $sort = array();
                        foreach($dist['releases'] as $id => $release){
                            $sort[strlen($release['name']) . $release['name']]  = $id;
                        }
                        uksort($sort, "strnatcasecmp");   

                        // Append release tags
                        foreach($sort as $id){
                            $release = $dist['releases'][$id];
                            $rPath = $release['name'];
                            $rPath = "/root/{$dist['name']}/$rPath";
                            $rName = preg_replace("/^.*\//","", $rPath);
                            $rPath = preg_replace("/\/[^\/]*$/","", $rPath);
                            $values = array('name' => $rName);

                            if(!$this->dataModel->itemExistsByPath($rPath)){
                                trigger_error("Invalid release name '{$rName}' in path '{$rPath}' received! Skipping entry!");
                            }else{
                                $id = $this->dataModel->addItem('Release',$rPath, $rName, $values);
                            }
                        }
                    }
                }
            }
        }
        return(TRUE);
    }


    /*! \brief  Keep track of posted values and populate those 
     *           which are interesting for us.
     *          Inspects the _POST and _GET values.
     */
    function save_object()
    {
        // Update the listing class, this is necessary to get post
        //  actions from it.
        $this->listing->save_object();

        // Get the selected distribution and release from the listing widget.
        $cont = $this->listing->getSelectedContainer();
        if(isset($_POST['ROOT'])){
            $this->setCurrentContainer('/root');
        }elseif(isset($_POST['BACK'])){
            $path = $this->selectedContainer;
            if($this->dataModel->itemExistsByPath($path)){
                $data = $this->dataModel->getItemByPath($path);
                if($data['parentPath']){
                    $this->setCurrentContainer($data['parentPath']);
                }
            }
        }else{
            $this->setCurrentContainer($cont);
        }
    }


    /*! \brief  Load extended sub-objecte like 'config items' or 'packages'
     *           for the given release path.
     *  @param  String  The release path to load sub-objects for.
     *  @return NULL 
     */
    function updateItemList($path)
    {
        // Fist get Item and check if it is an release 
        if($this->dataModel->itemExistsByPath($path)){
            $data = $this->dataModel->getItemByPath($path);

            // Only releases can contain config-items.
            if($data['type'] == 'Release' && $data['status'] != "fetched"){

                // Request all config items for the selected release via rpc.
                $rpc = $this->config->getRpcHandle();
                $releasePath = $this->getReleasePart($path);
                $res = $rpc->listConfigItems($releasePath);
                if(!$rpc->success()){
                    msg_dialog::display(tr("Error"),sprintf(tr("Failed to load distributions: %s"),$rpc->get_error()),ERROR_DIALOG);
                    return;
                }else{
            
                    if(!$res) return;

                    // Sort entries by path length 
                    $sLen = array();
                    foreach($res as $itemPath => $type){
                        $sLen[strlen($itemPath)."_".$itemPath] = $itemPath;
                    }
                    uksort($sLen, "strnatcasecmp");   

                    // Walk through each entry and then try to add it to the model
                    foreach($sLen as $unused => $itemPath){

                        // Do not add the root element '/'
                        if($itemPath == "/") continue;

                        $type = $res[$itemPath];
                
                        // Append the items-path to the current path to create the 
                        //  effective item path in the data model.
                        $targetPath = trim($path."/".$itemPath);

                        // Remove trailing and duplicated slashes
                        $targetPath = rtrim($targetPath, '/');
                        $targetPath = preg_replace("/\/\/*/","/", $targetPath);

                        // Extract the items name
                        $name = preg_replace("/^.*\//","", $targetPath);
    
                        // Cleanup the path and then add the item.
                        $targetPath = preg_replace("/[^\/]*$/","", $targetPath);
                        $targetPath = rtrim($targetPath,'/');
                        $this->dataModel->addItem($type, $targetPath, $name,array(),'-' ); 
                    }
                    $this->dataModel->setItemStatus($path, 'fetched');
                }
            }
        }
    }


    /*! \brief  Sets the currently selected container and item path. 
     *  @param  String  The path of the container to set.
     *  @param  String  The path of the item to set.
     *  @return 
     */
    function setCurrentContainer($cont)
    {
        // Do nothing while the service wasn't initialized.
        if(!$this->initialized) return;

        $this->selectedContainer = $cont;

        // Update list of items within the selected container. 
        $this->updateItemList($this->selectedContainer);

        // Transfer checked values back to the listing class.
        $this->listing->setContainers($this->getContainerList());
        $this->listing->setContainer($cont);

        // Update the list of addable sub objects
        $this->addableContainerItems = $this->getAddableContainersPerPath($cont);
    }


    function getAddableContainersPerPath($path)
    {
        $currentItem = $this->dataModel->getItemByPath($path);
        $method = $this->getInstallationMethodPerPath($path);

        // Get allowed items for the currently selected method 
        //  merge in root elements, they are allowed everywhere.
        $allowedItems = $this->itemsPerMethod[$method];
        $allowedItems = array_merge($allowedItems, $this->itemsPerMethod['root']);

        // Get addable items
        $possibleItems = $this->itemConfig[$currentItem['type']]['container'];
        return(array_unique(array_intersect($allowedItems, $possibleItems)));
    }

    
    function getInstallationMethodPerPath($path)
    {
        $path .= '/';
        while(preg_match("/\//", $path)){
            $path = preg_replace("/\/[^\/]*$/","",$path);
            $item = $this->dataModel->getItemByPath($path);
            if(isset($item['values']['installation_method'])){
                return($item['values']['installation_method']);
            }
        }
        return('root'); 
    }


    /*! \brief  Generate the HTML content for this plugin.
     *          Actually renders the listing widget..
     */
    function execute()
    {
        // Request an update of the data model
        if(!$this->initialized){
            $this->init();
        }

        // Act on init fails
        if($this->initFailed){
            $smarty = get_smarty();
            $smarty->assign('error', $this->errorMessage);
            return($smarty->fetch(get_template_path('rpcError.tpl', TRUE)));
        }else{

            // Get the selected release and store it in a session variable
            //  to allow the configFilter to access it and display the
            //  packages and items.
            $res = $this->listing->execute();
            $this->listing->setListingTypes($this->getListingTypes());
            return($res);
        }
    }


    /*! \brief      Returns a list of items which will then be displayed 
     *               in the management-list. 
     *              (The management class calls this method from its execute())
     *  @return     Array   A list of items/objects for the listing. 
     */
    function getItemsToBeDisplayed()
    {
        $path = $this->selectedContainer;
        $item = $this->dataModel->getItemByPath($path);
        return($item);
    }


    /*! \brief  Returns a simply list of all distributions.
     *          This list will then be used to generate the entries of the 
     *           ItemSelectors in the listing class.
     */
    function getContainerList()
    {
        $data = $this->dataModel->getItemByPath('/root');
        $res = array();
        $res["/root"] = array("name" => "/", "desc" => "");
        $res = array_merge($res,$this->__recurseItem($data));
        return($res);
    }


    /*! \brief  Recursivly wlks through an item and collects all path and name info.
     *          The reult can then be used to fill the ItemSelector.
     *  @param  Array   The Item to recurse. 
     *  @param  Array   The type of of objects to collect. 
     *  @param  String  The parent path prefix which should be removed.
     *  @return Array   An array containing Array[path] = name
     */
    function __recurseItem($item, $parent = "")
    {
        $res = array();
        $path = preg_replace("/".preg_quote($parent,'/')."/","",$item['path']);
        $res[$path] = array('name' => $item['name'],'desc'=>$item['type']);
        if(count($item['children'])){
            foreach($item['children'] as $child){
                $res = array_merge($res, $this->__recurseItem($child, $parent));
            }
        }
        return($res);
    }


    /*! \brief   Returns a info list about all items we can manage,
     *            this used to fill the listings <objectType> settings.
     *  @return Array   An array with item info.
     */
    function getListingTypes()
    {
        $types= array();
        $types['Distribution']['objectClass'] = 'Distribution';
        $types['Distribution']['label'] = tr('Distribution');
        $types['Distribution']['image'] = 'images/lists/edit.png';
        $types['Distribution']['category'] = 'Device';
        $types['Distribution']['class'] = 'Device';

        $types['Release']['objectClass'] = 'Release';
        $types['Release']['label'] = tr('Release');
        $types['Release']['image'] = 'images/lists/delete.png';
        $types['Release']['category'] = 'Device';
        $types['Release']['class'] = 'Device';

        $types['Component']['objectClass'] = 'Component';
        $types['Component']['label'] = tr('Component');
        $types['Component']['image'] = 'plugins/users/html/images/select_user.png';
        $types['Component']['category'] = 'Device';
        $types['Component']['class'] = 'Device';

        foreach($this->installationMethods as $method => $items){
            foreach($items['items'] as $itemName => $item){
                $types[$itemName]['objectClass'] = $itemName;
                $types[$itemName]['label'] = $item['name'];
                $types[$itemName]['image'] = 'plugins/goto-ng/html/images/item.png';
                $types[$itemName]['category'] = 'Device';
                $types[$itemName]['class'] = 'Device';
            }
        }

        return($types);
    }


    /*! \brief      The plugins ACL and plugin-property definition. 
     *  @return 
     */
    public static function plInfo()
    {
        return (array(
                    "plShortName"   => tr("Config management"),
                    "plDescription" => tr("Config management"),
                    "plSelfModify"  => FALSE,
                    "plDepends"     => array(),
                    "plPriority"    => 0,
                    "plSection"     => array("administration"),
                    "plCategory"    => array(
                        "ConfigManagement" => array("description"  => tr("Config management"),
                            "objectClass"  => "FAKE_OC_ConfigManagement")),
                    "plProvidedAcls"=> array(
                            "cfgItem" => tr("Config item")
                        )
                    ));
    }


    /*! \brief  Acts on open requests.
     *          (This action is received from the cfgMgmtManagement class.)
     *  @param  Array   The items ids. (May contain multiple ids)
     *  @return
     */
    function openEntry($ids)
    {
        $id = $ids[0];
        $item = $this->dataModel->getItemByDn($id);
        $this->setCurrentContainer($item['path']);
        return;
    }



    /*! \brief  Removes an entry from the listing.
     */
    function removeEntry($ids)
    {
        $this->ids = array();
        $names = array();
        $ui = get_userinfo();
        foreach($ids as $id){
            $item = $this->dataModel->getItemByDn($id);
            $dn = $item['dn'];
            $acl = $ui->get_permissions($dn, "ConfigManagement/ConfigManagement", "cfgItem");

            // Check permissions, are we allowed to remove this object?
            if(preg_match("/w/",$acl)){
                $names["({$item['type']}) {$item['path']})"] = $item['name'];
                $this->ids[] = $id;
            } else {
                msg_dialog::display(tr("Permission error"), msgPool::permDelete(), ERROR_DIALOG);
                new log("security","ConfigManagement/".get_class($this),$dn,array(),"Tried to trick deletion.");
            }
        }

        $smarty = get_smarty();
        $smarty = get_smarty();
        $smarty->assign("info", msgPool::deleteInfo($names));
        $smarty->assign("multiple", true);

        return($smarty->fetch(get_template_path('removeEntries.tpl')));
    }

    function remove_confirmed()
    {
        $ids = $this->ids;
        foreach($ids as $id){
            $item = $this->dataModel->getItemByDn($id);

            // Is an config item.
            if($this->cfgItemMap[$item['type']] != 'root'){
                $release = $this->getReleasePart($item['path']);
                $path = $this->getItemPath($item['path']);
                $rpc = $this->config->getRpcHandle();
                $rpc->removeConfigItem($release, $path);
                if(!$rpc->success()){
                    msg_dialog::display(tr("Error"), sprintf(tr("Failed to remove: %s"), $rpc->get_error()),ERROR_DIALOG);
                    return(NULL);
                }else{
                    $this->dataModel->removeItem($item['path']);
                }
            }else{

                // Remove distribution
                if($item['type'] == 'Distribution'){

                    $dist = $this->getDistributionPart($item['path']);
                    $rpc = $this->config->getRpcHandle();
                    $rpc->removeDistribution($dist, array('recursive' => TRUE));
                    if(!$rpc->success()){
                        msg_dialog::display(tr("Error"), sprintf(tr("Failed to remove the distribution: %s. Error was: %s"), 
                                    $dist, $rpc->get_error()), ERROR_DIALOG);
                        return(NULL);
                    }else{
                        $this->dataModel->removeItem($item['path']);
                    }
                }elseif($item['type'] == 'Release'){

                    // Remove release
                    $release = preg_replace("/^.*\//","", $this->getReleasePart($item['path']));
                    $rpc = $this->config->getRpcHandle();
                    $rpc->removeRelease($release, array('recursive' => TRUE));
                    if(!$rpc->success()){
                        msg_dialog::display(tr("Error"), sprintf(tr("Failed to remove the release: %s. Error was: %s"), 
                                    $release, $rpc->get_error()),ERROR_DIALOG);
                        return(NULL);
                    }else{
                        $this->dataModel->removeItem($item['path']);
                    }

                }elseif($item['type'] == 'Template'){

                    // Remove Template
                    $rpc = $this->config->getRpcHandle();
                    $rpc->installRemoveTemplate($item['name']);
                    if(!$rpc->success()){
                        msg_dialog::display(tr("Error"), sprintf(tr("Failed to remove the template: %s. Error was: %s"), 
                                    $release, $rpc->get_error()),ERROR_DIALOG);
                        return(NULL);
                    }else{
                        $this->dataModel->removeItem($item['path']);
                    }
                }else{
                    trigger_error($item['type']." - are not handled yet!");
                }
            }
        }
    }


    /*! \brief  Returns a list of used item names for a given path.
     */
    function getUsedNamesForPath($path)
    {
        $item = $this->dataModel->getItemByPath($path);
        $names = array();
        foreach($item['children'] as $path => $data){
            $names[] = $data['name'];
        }
        return($names);
    }


    /*! \brief      Edits a selected list item.
     */
    function editEntry($ids)
    {
        $item = $this->dataModel->getItemByDn($ids[0]);

        $release = $this->getReleasePart($item['path']);
        $path = $this->getItemPath($item['path']);
        $method = $this->cfgItemMap[$item['type']];

        // Load item values on demand
        if($this->cfgItemMap[$item['type']] != 'root'){
            if($item['status'] == '-'){
                $rpc = $this->config->getRpcHandle();
                $res = $rpc->getConfigItem($release, $path);
                if(!$rpc->success()){
                    msg_dialog::display(tr("Error"), sprintf(tr("Failed to load config item details: %s"), $rpc->get_error()),ERROR_DIALOG);
                    return;
                }else{
                    $item['values'] = $res;
                    $this->dataModel->setItemStatus($item['path'], 'fetched');
                    $this->dataModel->setItemValues($item['path'], $item['values']);
                }
            }
        }elseif($item['type'] == 'Template'){
            if($item['status'] == '-'){
                $rpc = $this->config->getRpcHandle();
                $res = $rpc->installGetTemplate($item['name']);
                if(!$rpc->success()){
                    msg_dialog::display(tr("Error"), sprintf(tr("Failed to load template details: %s"), $rpc->get_error()),ERROR_DIALOG);
                    return;
                }else{
                    $item['values'] = $res;
                    $this->dataModel->setItemStatus($item['path'], 'fetched');
                    $this->dataModel->setItemValues($item['path'], $item['values']);
                }
            }
        }
        
        // Collect property acls. The is only one ACL defined which controls all widgets.
        $ui = get_userinfo();
        $acls = array();
        $acl = $ui->get_permissions($item['dn'], "ConfigManagement/ConfigManagement","cfgItem");
        foreach(array_keys($this->itemConfig[$item['type']]['options']) as $attr){
            $acls[$attr] = $acl;
        }

        // Update the template engine and set the item-config, values and the acls to use.
        $this->TemplateEngine->load($this->itemConfig);
        $this->TemplateEngine->setTemplate($method.".tpl");
        $this->TemplateEngine->editItem($item['type'],$item['values'], $acls);

        $this->listing->setDialogObject($this->TemplateEngine);
        $this->currentObject = $item;
    }


    /*! \brief  Initiates the creation of a new item
     */
    function newEntry($type)
    {
        $item = $this->dataModel->getItemByPath($this->selectedContainer);
            
        // Collect property acls. The is only one ACL defined which controls all widgets.
        $ui = get_userinfo();
        $acls = array();
        $acl = $ui->get_permissions($item['dn'], "ConfigManagement/ConfigManagement","cfgItem");
        foreach(array_keys($this->itemConfig[$type]['options']) as $attr){
            $acls[$attr] = $acl;
        }

        // We've to add a config item
        $this->TemplateEngine->load($this->itemConfig);
        if($this->cfgItemMap[$type] != 'root'){
            $method = $this->cfgItemMap[$type];
            $this->TemplateEngine->setTemplate($method.".tpl");
            $this->TemplateEngine->createItem($type, array(), $acls);
            $this->listing->setDialogObject($this->TemplateEngine);
            $this->currentObject = NULL;
        }else{
            $this->TemplateEngine->setTemplate("root.tpl");
            $this->TemplateEngine->createItem($type, array(), $acls);
            $this->listing->setDialogObject($this->TemplateEngine);
            $this->currentObject = NULL;
        }
    }


    /*! \brief  Extracts the item-path out of a path.
     *          e.g. /debian/squeeze/test/module -> /test/module
     */
    function getItemPath($fullPath)
    {
        $fPath = $fullPath.'/';
        while(preg_match("/\//", $fPath)){
            $fPath = preg_replace("/\/[^\/]*$/","", $fPath);
            $item = $this->dataModel->getItemByPath($fPath);
            if(in_array_strict($item['type'], array('Release', 'Distribution', 'root'))){
                return(preg_replace("/".preg_quote($item['path'],'/')."/", "", $fullPath));
            }
        }
        return(NULL);
    }


    /*! \brief  Extracts the releaes path out of a path.
     *          e.g. /debian/squeeze/test/module -> /debian/squeeze
     */
    function getReleasePath($fullPath)
    {
        $fullPath.='/';
        while(preg_match("/\//", $fullPath)){
            $fullPath = preg_replace("/\/[^\/]*$/","", $fullPath);
            $item = $this->dataModel->getItemByPath($fullPath);
            if($item['type'] == 'Release'){
                return($fullPath);
            }
        }
        return(NULL);
    }
  
    
    /*! \brief  Extracts the distribution path out of a path.
     *          e.g. /root/debian/squeeze/test/module -> /root/debian
     */
    function getDistributionPath($fullPath)
    {
        $fullPath.='/';
        while(preg_match("/\//", $fullPath)){
            $fullPath = preg_replace("/\/[^\/]*$/","", $fullPath);
            $item = $this->dataModel->getItemByPath($fullPath);
            if($item['type'] == 'Distribution'){
                return($fullPath);
            }
        }
        return(NULL);
    }


    /*! \brief  Extracts the distribution-part out of a path.
     *          e.g. /root/debian/squeeze/test/module -> debian
     */
    function getDistributionPart($fullPath)
    {
        return(trim(preg_replace("#^/root/#","", $this->getDistributionPath($fullPath)), '/'));
    }
    
    
    /*! \brief  Extracts the release-part out of a path.
     *          e.g. /root/debian/squeeze/test/module -> squeeze/test
     */
    function getReleasePart($path)
    {
        $rPath = $this->getReleasePath($path);
        $dPath = $this->getDistributionPath($path);
        return(preg_replace("/^".preg_quote($dPath, '/')."\/?/", "", $rPath));
    }
 
 
    function saveItemChanges()
    {
        // Save template engine modifications and validate values.
        $this->TemplateEngine->save_object();
        $msgs = $this->TemplateEngine->check();

        // Get values to be saved
        $values = array();
        foreach($this->TemplateEngine->getWidgets() as $w){
            $values[$w->getName()] = $w->getValue();
        }
           
        // No input error were found, now check that we do not use the same name twice
        //  and that it is valid.
        if(!count($msgs)){

            // Get used item names for the current path
            if($this->currentObject){
    
                // Get used item names in the parent path.
                $usedNames = $this->getUsedNamesForPath($this->currentObject['parentPath']);
            }else{

                // Get used items for the selected path.
                $usedNames = $this->getUsedNamesForPath($this->selectedContainer);
            }

            // Allow the item to keep its name.
            if($this->currentObject != NULL && isset($this->currentObject['values']['name'])){
                $usedNames = array_remove_entries(array($this->currentObject['values']['name']), $usedNames);
            }
            if(in_array_strict($values['name'],$usedNames)){
                $msgs[] = msgPool::duplicated(tr("Name"));
            }
        }

        // Display errors
        if(count($msgs)){
            msg_dialog::displayChecks($msgs);
            return;
        }

        // Get the item type to be saved
        $item = $this->currentObject;
        $type = $this->TemplateEngine->getItemType();
        if($this->cfgItemMap[$type] == 'root'){

            // We've to create a new distribution
            if($type == 'Distribution'){
                
                // Distributions cannot be renamed!
                if(isset($item['name']) && $item['name'] != $values['name']){
                    msg_dialog::displayChecks(array("Distributions cannot be renamed!"));
                    return;
                }

                // Create a new distribution 
                if(!$item){
                    $name = $values['name'];
                    $itype = $values['installation_type'];
                    $imethod = $values['installation_method'];
                    $origin = $values['origin'];

                    // Initiate the rpc request.
                    $rpc = $this->config->getRpcHandle();
                    $res = $rpc->createDistribution($name, $itype, array('mirror'=>$origin, 'install_method' => $imethod));
                    if(!$rpc->success()){
                        msg_dialog::display(tr("Error"), sprintf(tr("Failed to save distributions: %s"), 
                            $rpc->get_error()),ERROR_DIALOG);
                        return(NULL);
                    }
                }

                // Collect distribution properties
                $data = array();
                $data['distribution'] = $values['name'];
                $data['arch'] = $values['architectures'];
                $data['component'] = $values['components'];
                $data['mirror_sources'] = $values['mirror_sources'];

                // Set distribution properties
                $rpc = $this->config->getRpcHandle();
                $rpc->setDistribution($data);
                if(!$rpc->success()){
                    msg_dialog::display(tr("Error"), sprintf(tr("Failed to save distribution properties: %s"), 
                                $rpc->get_error()),ERROR_DIALOG);
                    return(NULL);
                }

                // We've successfully added the item, now add it to the tree.
                $this->dataModel->addItem($type, $this->selectedContainer, $values['name'],$values, '-' );

                // Finally - close the dialog. 
                $this->listing->clearDialogObject();

            }elseif($type == 'Release'){
           
                // We've to update a release. 
                if($item){

                    // Check if we've to rename the item.
                    $path = $this->getReleasePart($item['parentPath']);
                    $curPath = $this->getReleasePart($item['path']);
                    $newPath = trim($path."/".$values['name'], '/');
                    if($curPath != $newPath){
                        $rpc = $this->config->getRpcHandle();
                        $res = $rpc->renameRelease($curPath, $newPath);
                        if(!$rpc->success()){
                            msg_dialog::display(tr("Error"), sprintf(tr("Failed to save release: %s"), $rpc->get_error()),ERROR_DIALOG);
                            return(NULL);
                        }else{
                            $nP = $item['parentPath'].'/'.$values['name'];
                            $this->dataModel->moveItem($item['path'], $nP);
                            $this->dataModel->setItemValues($nP, $values);
                            $this->listing->clearDialogObject();
                        }
                    }else{
                        $this->listing->clearDialogObject();
                    }
                
 
                }else{

                    // Build up the new release path.
                    $name = $values['name'];
                    $rPath = $this->getReleasePart($this->selectedContainer);
                    $newPath = trim($rPath."/".$name, '/');

                    // Detect the parent distribution
                    $dist = $this->getDistributionPart($this->selectedContainer);

                    // Initiate the rpc request.
                    $rpc = $this->config->getRpcHandle();
                    $res = $rpc->createRelease($dist, $newPath);
                    if(!$rpc->success()){
                        msg_dialog::display(tr("Error"), sprintf(tr("Failed to save release: %s"), $rpc->get_error()),ERROR_DIALOG);
                        return(NULL);
                    }else{

                        // We've successfully added/saved the item, now add it to the tree.
                        $this->dataModel->addItem($type, $this->selectedContainer, $values['name'],$values, '-' );
                        $this->listing->clearDialogObject();
                    }
                }
            }elseif($type == "Template"){

                    // Initiate the rpc request.
                    $rpc = $this->config->getRpcHandle();
                    $res = $rpc->installSetTemplate($values['name'], $values);
                    if(!$rpc->success()){
                        msg_dialog::display(tr("Error"), sprintf(tr("Failed to save template: %s"), $rpc->get_error()),ERROR_DIALOG);
                        return(NULL);
                    }else{
                        
                        // We've successfully added/saved the item, now add it to the tree.
                        if(!$item){
                            $this->dataModel->addItem($type, $this->selectedContainer, $values['name'],$values, '-' );
                            $this->listing->clearDialogObject();
                        }else{

                            // Update the model and clear the dialogs 
                            $path = $item['path'];
                            $this->dataModel->setItemValues($path, $values);
                            $this->listing->clearDialogObject();
                        }
                    }
                
            }else{
                echo "{$type} Cannot be saved yet";
                $this->listing->clearDialogObject();
                return;
            }
        }

        // Save a CONFIG-ITEM object.
        if($this->cfgItemMap[$type] != 'root'){

            // Get paths 
            $release =  $this->getReleasePart($this->selectedContainer);

            if($item){
                $oldPath = $item['path'];
                $oldItemPath = $this->getItemPath($item['path']);
                $newPath = $item['parentPath']."/".$values['name'];
                $newItemPath = $this->getItemPath($newPath);
            }else{
                $newPath = $this->selectedContainer."/".$values['name'];
                $newItemPath = $this->getItemPath($this->selectedContainer)."/".$values['name'];
            }

            // If this is a new item, then create it now.
            if($item == NULL){

                // Add the new item
                $rpc = $this->config->getRpcHandle();
                $res = $rpc->setConfigItem($release, $newItemPath, $type, $values);
                if(!$rpc->success()){
                    msg_dialog::display(tr("Error"), sprintf(tr("Failed to save %s: %s"),$type, $rpc->get_error()),ERROR_DIALOG);
                    return(NULL);
                }else{

                    // We've successfully added the item, now add it to the tree.
                    $this->dataModel->addItem($type, $this->selectedContainer, $values['name'],array(), '-' );

                    // Finally - close the dialog. 
                    $this->listing->clearDialogObject();
                }
            }else{

                // Write the modifications back to the server.
                $rpc = $this->config->getRpcHandle();
                $res = $rpc->setConfigItem($release, $oldItemPath, $type, $values);
                if(!$rpc->success()){
                    msg_dialog::display(tr("Error"), sprintf(tr("Failed to save config item: %s"), $rpc->get_error()),ERROR_DIALOG);
                    return(NULL);
                }else{
            
                    // Update the data model
                    $this->dataModel->setItemValues($oldPath, $values);
                    if($oldPath != $newPath){
                        $this->dataModel->moveItem($oldPath, $newPath);
                    }
                    $this->listing->clearDialogObject();
                }
            }
        }
    }
    function remove_lock() {}
}


?>
