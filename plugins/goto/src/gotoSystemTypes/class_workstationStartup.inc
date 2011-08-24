<?php
class workstartup extends plugin
{
    /* Ldap server list */
    var $gotoLdapServers    = array();
    var $gotoLdapServerList = array();
    var $gotoLdap_inherit   = FALSE;

    /* Generic terminal attributes */
# This is disabled as long there is no possiblilty to set these parameters
    var $gotoBootKernel       = "default-inherited";
    var $gotoKernelParameters = "";
    var $gotoLdapServer       = "default-inherited";
    var $gotoModules          = array();
    var $gotoAutoFs           = array();
    var $gotoFilesystem       = array();
    var $gotoTerminalPath     = "";
    var $gotoBootKernels      = array();

    /* attribute list for save action */
    var $attributes           = array("gotoLdapServer", "gotoBootKernel", "gotoKernelParameters", "gotoShare");
    var $objectclasses        = array("GOhard");

    /* Share */
    var $gotoShares         = array();// Currently Share Option
    var $gotoShare          = "";     // currently selected Share Option
    var $gotoShareSelections= array();// Available Shares for this account in Listbox format
    var $gotoAvailableShares= array();// Available Shares for this account

    /* Helper */
    var $orig_dn            = "";
    var $ignore_account     = TRUE;

    var $view_logged        = FALSE;

    var $CopyPasteVars    = array("gotoModules","gotoShares");
    var $o_group_dn       = "";
    var $member_of_ogroup = FALSE;

    function workstartup (&$config, $dn= NULL, $parent= NULL)
    {
        $this->attributes = array("gotoLdapServer", "gotoBootKernel", "gotoKernelParameters", "gotoShare");
        $this->objectclasses  = array("GOhard");

        plugin::plugin ($config, $dn, $parent);

        /* Check object group membership */
        if(!isset($this->parent->by_object['ogroup'])){
            $ldap = $this->config->get_ldap_link();
            $ldap->cd ($this->config->current['BASE']);
            $ldap->search("(&(objectClass=gotoWorkstationTemplate)(member=".LDAP::prepare4filter($this->dn)."))",array("cn","dn"));
            if($ldap->count()){
                $this->member_of_ogroup = TRUE;
                $attrs = $ldap->fetch();
                $this->o_group_dn = $attrs['dn'];
            }

            if ($ldap->count() > 1) { 
                $ogroups = array(); 
                array_push($ogroups, $attrs['dn']); 
                while ($attrs = $ldap->fetch()) { 
                    array_push($ogroups, $attrs['dn']); 
                } 
                $str = ""; 
                foreach($ogroups as $dn) { 
                    $str .= "<li>".$dn."</li>"; 
                } 
                msg_dialog::display(tr("Warning"), sprintf(tr("This system is member of more than one object group, object group inheritence will not work!")."<br><ul>%s</ul>", $str), WARNING_DIALOG); 
            } 
        }

        /* Creating a list of valid Mirrors 
         * none will not be saved to ldap.
         */
        $ldap   = $this->config->get_ldap_link();
        $ldap->cd($this->config->current['BASE']);
        $ui = get_userinfo();
        foreach($this->config->data['SERVERS']['LDAP'] as $dn => $data){
            if($ui->get_category_permissions($data['dn'],"server",TRUE)){
                for($i = 0; $i < $data['goLdapBase']['count']; $i ++){
                    $name = $data["cn"][0].":".$data["goLdapBase"][$i];
                    $this->gotoLdapServerList[]= $name; 
                }
            }
        }

        /* Get list of assigned ldap servers 
         */ 
        if(isset($this->attrs['gotoLdapServer'])){
            unset($this->attrs['gotoLdapServer']['count']);
            sort($this->attrs['gotoLdapServer']);
            foreach($this->attrs['gotoLdapServer'] as $value){
                $this->gotoLdapServers[] = preg_replace("/^[0-9]*:/","",$value);
            }
        } 
        natcasesort($this->gotoLdapServerList);

        if(!count($this->gotoLdapServers) && $this->member_of_ogroup){ 
            $this->gotoLdap_inherit = TRUE;
        }

        /* Get arrays */
        foreach (array("gotoModules", "gotoAutoFs", "gotoFilesystem") as $val){
            if (isset($this->attrs["$val"]["count"])){
                for ($i= 0; $i<$this->attrs["count"]; $i++){
                    if (isset($this->attrs["$val"][$i])){
                        array_push($this->$val, $this->attrs["$val"][$i]);
                    }
                }
            }
            sort ($this->$val);
            $this->$val= array_unique($this->$val);
        }

        /* Prepare Shares */
        if((isset($this->attrs['gotoShare']))&&(is_array($this->attrs['gotoShare']))){
            unset($this->attrs['gotoShare']['count']);
            foreach($this->attrs['gotoShare'] as $share){
                $tmp = $tmp2 = array();
                $tmp = explode("|",$share);
                $tmp2['server']      =$tmp[0];
                $tmp2['name']        =$tmp[1];
                $tmp2['mountPoint']  =$tmp[2];
                $this->gotoShares[$tmp[1]."|".$tmp[0]]=$tmp2;
            }
        }

        $this->gotoShareSelections= $config->getShareList(true);
        $this->gotoAvailableShares= $config->getShareList(false);
        $tmp2 = array();


        $this->orig_dn= $this->dn;

        /* Handle inheritance value "default" */
        if ($this->member_of_ogroup){
            $this->gotoBootKernels= array("default-inherited" => '['.tr("inherited").']'); 
        }

        /* If we are member in an object group,
         *  we have to handle inherited values.
         * So you can see what is inherited.
         */
        if ($this->member_of_ogroup){

            $map= array("gotoBootKernel");
            $ldap = $this->config->get_ldap_link();
            $ldap->cat($this->o_group_dn);
            $attrs= $ldap->fetch();

            foreach ($map as $name){
                if (!isset($attrs[$name][0])){
                    continue;
                }

                switch ($name){
                    case 'gotoBootKernel':
                        $this->gotoBootKernels['default-inherited']=  tr("inherited").' ['.$attrs[$name][0].']' ;
                        break;
                }
            }
        }

        // Prepare lists
        $this->ldapList = new sortableListing(array(),array(), TRUE);
        $this->ldapList->setDeleteable(true);
        $this->ldapList->setEditable(false);
        $this->ldapList->setWidth("100%");
        $this->ldapList->setHeight("100px");
        $this->ldapList->setHeader(array(tr("LDAP server")));
        $this->ldapList->setDefaultSortColumn(0);
    }


    function check()
    {
        $messages = array();
        $messages= plugin::check();
        return($messages);
    }

    function execute()
    {
        /* Call parent execute */
        plugin::execute();

        if($this->is_account && !$this->view_logged){
            $this->view_logged = TRUE;
            new log("view","workstation/".get_class($this),$this->dn);
        }

        /* Do we represent a valid terminal? */
        if (!$this->is_account && $this->parent === NULL){
            $display= image("images/small-error.png")."<b>".msgPool::noValidExtension(tr("workstation"))."</b>";
            return ($display);
        }

        /* Add module */
        if (isset ($_POST['add_module'])){
            if ($_POST['module'] != "" && $this->acl_is_writeable("gotoModules")){
                $this->add_list ($this->gotoModules, get_post('module'));
            }
        }

        /* Delete module */
        if (isset ($_POST['delete_module'])){
            if (count($_POST['modules_list']) && $this->acl_is_writeable("gotoModules")){
                $this->del_list ($this->gotoModules, get_post('modules_list'));
            }
        }

        /* Show main page */
        $smarty= get_smarty();

        /* Assign ACLs to smarty */
        $tmp = $this->plInfo();
        foreach($tmp['plProvidedAcls'] as $name => $translation){
            $smarty->assign($name."ACL",$this->getacl($name));
        } 

        $smarty->assign("member_of_ogroup",$this->member_of_ogroup);

        /* In this section server shares will be defined
         * A user can select one of the given shares and a mount point
         *  and attach this combination to his setup.
         */
        $smarty->assign("gotoShareSelections",    set_post($this->gotoShareSelections));
        $smarty->assign("gotoShareSelectionKeys", set_post(array_flip($this->gotoShareSelections)));

        /* if $_POST['gotoShareAdd'] is set, we will try to add a new entry
         * This entry will be, a combination of mountPoint and sharedefinitions
         */
        if((isset($_POST['gotoShareAdd'])) && isset($_POST['gotoShareSelection']) && ($this->acl_is_writeable("gotoShare"))) {
            /* We assign a share to this user, if we don't know where to mount the share */
            if((!isset($_POST['gotoShareMountPoint']))||(empty($_POST['gotoShareMountPoint']))||(preg_match("/[\|]/i",$_POST['gotoShareMountPoint']))){
                msg_dialog::display(tr("Error"), msgPool::required(tr("Mount point")), ERROR_DIALOG);
            }else{

                if(isset($this->gotoAvailableShares[get_post('gotoShareSelection')])){
                    $a_share = $this->gotoAvailableShares[get_post('gotoShareSelection')];
                    $s_mount = get_post('gotoShareMountPoint');
                    /* Preparing the new assignment */
                    $this->gotoShares[$a_share['name']."|".$a_share['server']]=$a_share;
                    $this->gotoShares[$a_share['name']."|".$a_share['server']]['mountPoint']=$s_mount;
                }
            }
        }

        /* if the Post  gotoShareDel is set, someone asked GOsa to delete the selected entry (if there is one selected)
         * If there is no defined share selected, we will abort the deletion without any message
         */
        if(($this->acl_is_writeable("gotoShare"))&& (isset($_POST['gotoShareDel']))&&(isset($_POST['gotoShare']))){
            unset($this->gotoShares[get_post('gotoShare')]);
        }

        $smarty->assign("gotoShares",       set_post($this->printOutAssignedShares()));
        $smarty->assign("gotoSharesCount",  count($this->printOutAssignedShares()));
        $smarty->assign("gotoShareKeys",    set_post(array_flip($this->printOutAssignedShares())));
        $smarty->assign("gotoBootKernels",  set_post($this->gotoBootKernels));

        $this->ldapList->setAcl($this->getacl('gotoLdapServer'));

        /* Add new ldap server to the list */
        if($this->acl_is_writeable("gotoLdapServer") && 
                !$this->gotoLdap_inherit && 
                isset($_POST['add_ldap_server']) && 
                isset($_POST['ldap_server_to_add'])){
            if(isset($this->gotoLdapServerList[get_post('ldap_server_to_add')])){
                $to_add = $this->gotoLdapServerList[get_post('ldap_server_to_add')];
                if(!in_array_strict($to_add,$this->gotoLdapServers)){
                    $this->gotoLdapServers[] = $to_add;
                }
            }
        }

        /* Move ldap servers up and down */
        $this->ldapList->save_object();
        $action = $this->ldapList->getAction();
        if($action['action'] == 'reorder'){
            $this->gotoLdapServers = array_values($this->ldapList->getMaintainedData());
        }
        if($action['action'] == 'delete'){
            $id = $this->ldapList->getKey($action['targets'][0]);
            $value = $this->gotoLdapServers[$id];
            $this->gotoLdapServers = array_remove_entries(array($value),$this->gotoLdapServers);
        }

        /* Add Entries */
        $data = $lData = array();
        foreach($this->gotoLdapServers as $key => $server){
            $data[$key]=$server;

            /* Announce missing entries */
            if(!in_array_strict($server,$this->gotoLdapServerList)){
                $server = $server."&nbsp;<font style='color:red'>(missing)</font>";
            }

            /* Convert old style entry */
            if (!preg_match('%:ldaps?://%', $server)){
                $server= "ldap://".preg_replace('/^([^:]+):/', '\1/', $server);
        } else {
            $server= preg_replace("/^[^:]+:/", "", $server);
            $lData[$key] = array('data'=>array($server));
        }    
        }
        $this->ldapList->setListData($data,$lData);
        $this->ldapList->update();


        if($this->gotoLdap_inherit){
            $smarty->assign("gotoLdapServerACL_inherit", preg_replace("/w/","",$this->getacl("gotoLdapServer")));;
        }else{
            $smarty->assign("gotoLdapServerACL_inherit", $this->getacl("gotoLdapServer"));
        }

        $list = array();
        foreach($this->gotoLdapServerList as $key => $entry){
            if(!in_array_strict($entry,$this->gotoLdapServers)){

                /* Convert old style entry */
                if (!preg_match('%:ldap[s]*://%', $entry)){
                    $entry= "ldap://".preg_replace('/^([^:]+):/', '\1/', $entry);

                /* Beautify new style entries */
            } else {
                $entry= preg_replace("/^[^:]+:/", "", $entry);
            }

            $list[$key] = $entry;
            }
        }
        $smarty->assign("gotoLdapServers",    $this->ldapList->render());
        $smarty->assign("gotoLdapServerList", $list);
        $smarty->assign("gotoLdap_inherit",   $this->gotoLdap_inherit);

        foreach (array("gotoModules", "gotoAutoFs", "gotoFilesystem") as $val){
            $smarty->assign("$val", set_post($this->$val));
        }

        /* Values */
        foreach(array("gotoBootKernel","gotoShare") as $val){
            $smarty->assign($val, set_post($this->$val));
        }

        /* Show main page */
        $smarty->assign("gotoKernelParameters",set_post($this->gotoKernelParameters));
        return($smarty->fetch (get_template_path('workstationStartup.tpl', TRUE,dirname(__FILE__))));
    }


    function remove_from_parent()
    {
        $this->handle_post_events("remove");
        new log("remove","workstation/".get_class($this),$this->dn);
    }


    /* Save data to object */
    function save_object()
    {
        plugin::save_object();

        if(isset($_POST['WorkstationStarttabPosted'])){
            if(isset($_POST['gotoLdap_inherit'])){
                $this->gotoLdap_inherit = TRUE;
            }else{
                $this->gotoLdap_inherit = FALSE;
            }
        }
    }


    /* Save to LDAP */
    function save()
    {

        /* Depending on the baseobject (Ogroup / WS) we
         *  use another set of objectClasses
         * In case of WS itself, we use  "array("GOhard");"
         * if we are currently editing from ogroup menu we use (array("gotWorkstationTemplate","GOhard"))
         */
        if(isset($this->parent->by_object['ogroup'])){
            $this->objectclasses = array("gotoWorkstationTemplate");
        }elseif(isset($this->parent->by_object['workgeneric'])){
            $this->objectclasses = array("GOhard");
        }elseif(isset($this->parent->by_object['servgeneric'])){
            $this->objectclasses = array("GOhard","gotoWorkstationTemplate");
        }else{
            msg_dialog::display(tr("Fatal error"),
                    "Object Type Configuration is unknown. Please contact the GOsa developers.",
                    FATAL_ERROR_DIALOG);
            exit();
        }

        /* Find proper terminal path for tftp configuration
FIXME: This is suboptimal when the default has changed to
another location! */
        if (($this->gotoTerminalPath == "default")){
            $ldap= $this->config->get_ldap_link();

            /* Strip relevant part from dn, keep trailing ',' */
            $tmp= preg_replace("/^cn=[^,]+,".preg_quote(get_ou("termgeneric", "terminalRDN"), '/')."/i", "", $this->dn);
            $tmp= preg_replace("/".$this->config->current['BASE']."$/i", "", $tmp);

            /* Walk from top to base and try to load default values for
               'gotoTerminalPath'. Abort when an entry is found. */
            while (TRUE){
                $tmp= preg_replace ("/^[^,]+,/", "", $tmp);

                $ldap->cat("cn=default,".get_ou("termgeneric", "terminalRDN").$tmp.
                        $this->config->current['BASE'], array('gotoTerminalPath'));
                $attrs= $ldap->fetch();
                if (isset($attrs['gotoTerminalPath'])){
                    $this->gotoTerminalPath= $attrs['gotoTerminalPath'][0];
                    break;
                }

                /* Nothing left? */
                if ($tmp == ""){
                    break;
                }
            }
        }

        plugin::save();

        $str = "";

        /* Add missing arrays */
        foreach (array("gotoFilesystem", "gotoAutoFs", "gotoModules") as $val){
            if (isset ($this->$val) && count ($this->$val) != 0){

                $this->attrs["$val"]= array_unique($this->$val);
            }
            if(!isset($this->attrs["$val"])) $this->attrs["$val"]=array();
        }

        /* Prepare list of ldap servers */
        $this->attrs['gotoLdapServer'] = array();
        if(!$this->gotoLdap_inherit){
            $i = 0;
            foreach($this->gotoLdapServers as $server){
                $i ++;
                $this->attrs['gotoLdapServer'][] = $i.":".$server;
            }
        }

        if ($this->attrs['gotoBootKernel'] == "default-inherited"){
            $this->attrs['gotoBootKernel']= array();
        }

        $ldap= $this->config->get_ldap_link();
        $ldap->cd($this->dn);

        /* prepare share settings */
        $tmp = array();
        foreach($this->gotoShares as $name => $settings){
            $tmp2= explode("|",$name);
            $name = $tmp2[0];
            $tmp[] = $settings['server']."|".$name."|".$settings['mountPoint'];
        }
        $this->attrs['gotoShare']=$tmp;
        $this->cleanup();
        $ldap->modify ($this->attrs); 
        new log("modify","workstation/".get_class($this),$this->dn,array_keys($this->attrs),$ldap->get_error());

        if (!$ldap->success()){
            msg_dialog::display(tr("LDAP error"), msgPool::ldaperror($ldap->get_error(), $this->dn, LDAP_MOD, get_class()));
        }
        $this->handle_post_events("modify");
    }


    /* Add value to array, check if unique */
    function add_list (&$array, $value)
    {
        if ($value != ""){
            $array[]= $value;
            sort($array);
            array_unique ($array);
        }
    }


    /* Delete value to array, check if unique */
    function del_list (&$array, $list)
    {
        $tmp= array();
        foreach ($array as $mod){
            if (!in_array_strict($mod, $list)){
                $tmp[]= $mod;
            }
        }
        $array= $tmp;
    }

    /* Generate ListBox frindly output for the defined shares
     * Possibly Add or remove an attribute here,
     */
    function printOutAssignedShares()
    {
        $a_return = array();
        if(is_array($this->gotoShares)){
            foreach($this->gotoShares as $share){
                $a_return[$share['name']."|".$share['server']]= $share['name']." [".$share['server']."]";
            }
        }
        return($a_return);
    }



    function PrepareForCopyPaste($source)
    {
        plugin::PrepareForCopyPaste($source);    
        $source_o = new workstartup ($this->config, $source['dn']);
        foreach(array("gotoModules", "gotoAutoFs", "gotoFilesystem",
                    "gotoKernelParameters","gotoShares","gotoLdapServers","gotoLdapServerList",
                    "gotoLdap_inherit") as $attr){
            $this->$attr = $source_o->$attr;
        }
    }


    function array_switch_item($ar,$from,$to)
    {
        if(!is_array($ar)){
            return(false);
        }
        if(!isset($ar[$from])){
            return(false);
        }
        if(!isset($ar[$to])){
            return(false);
        }

        $tmp = $ar[$from];
        $ar[$from] = $ar[$to];    
        $ar[$to] = $tmp;    
        return($ar);
    }


    /* Return plugin informations for acl handling */ 
    static function plInfo()
    {
        return (array( 
                    "plShortName"   => tr("Startup"),
                    "plDescription" => tr("System startup"),
                    "plSelfModify"  => FALSE,
                    "plDepends"     => array(),
                    "plPriority"    => 9,
                    "plSection"     => array("administration"),           
                    "plCategory"    => array("workstation","server","ogroups"),

                    "plProvidedAcls"=> array(
                        "gotoLdapServer"        => tr("LDAP server"),
                        "gotoBootKernel"        => tr("Boot kernel"),
                        "gotoKernelParameters"  => tr("Kernel parameter"),

                        "gotoModules"           => tr("Kernel modules"),
                        "gotoShare"             => tr("Shares"))
                        ));
    }



    /* Return repository hook output, if possible.
     */
    function GetHookElements()
    {
        $ret = array();
        $cmd= $this->config->get_cfg_value("servrepository", "repositoryBranchHook");
        if(!empty($cmd)){
            $res = shell_exec($cmd);
            $res2 = trim($res);
            if((!$res)){
                msg_dialog::display(tr("Configuration error"), msgPool::cmdexecfailed("repositoryBranchHook", $cmd), ERROR_DIALOG);
            }elseif(empty($res2)){
                msg_dialog::display(tr("Configuration error"), tr("'repositoryBranchHook' returned no result!"), ERROR_DIALOG);
            }else{
                $tmp = preg_split("/\n/",$res);
                foreach($tmp as $line){
                    if(empty($line)) continue;
                    $ret[]= $line;
                }
            }
        }
        return($ret);
    }
}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
