<?php


class Device extends plugin
{

    public $objectclasses = array('top','device');
    public $attributes = array("cn","serialNumber","seeAlso","owner","ou","o","ipHostNumber",
            "l","description","manager","deviceUUID","deviceStatus","macAddress","deviceType");

    public $dynClasses = array(
            'ieee802Device' => array('macAddress'),
            'registeredDevice' => array('deviceStatus','deviceUUID','manager','deviceType'),
            'ipHost' => array('ipHostNumber'));

    public $cn = "";
    public $serialNumber = "";
    public $seeAlso = "";
    public $owner = "";
    public $ou = "";
    public $o = "";
    public $l = "";
    public $description = "";
    public $manager = "";
    public $deviceUUID = "";
    public $deviceStatus = "";
    public $deviceType = "";
    public $ipHostNumber = "";
    public $macAddress = "";

    public $base = "";
    public $orig_dn ="";
    
    private $resolvedNamesCache = array();

    public $ignore_account = TRUE;


    /*! \brief  Constructs the device object and keep some 
     *           initial values.
     */
    function __construct(&$config, $dn)
    {
        plugin::plugin($config, $dn);
        $this->orig_dn = $this->dn;

        // Initialize the object base 
        if ($this->dn == "new"){
            $ui= get_userinfo();
            $this->base= dn2base(session::global_is_set("CurrentMainBase")?"cn=dummy,".session::global_get("CurrentMainBase"):$ui->dn);
        } else {
            $this->base= preg_replace ("/^[^,]+,".preg_quote(get_ou("Device", "GOsaDeviceRDN"), '/')."/i", "", $this->dn);
        }

        // Prepare the base selector
        $this->baseSelector= new baseSelector($this->get_allowed_bases(), $this->base);
        $this->baseSelector->setSubmitButton(false);
        $this->baseSelector->setHeight(300);
        $this->baseSelector->update(true);

        $this->orig_deviceUUID = $this->deviceUUID;
    }

    
    /*! \brief  Generate a fake uuid, it is not a real uuid.
     *  @return String  A fake uuid.
     */
    function genFakeUuid()
    {
        $strfmt = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";
        for($i=0;$i<strlen($strfmt);$i++)
            if($strfmt[$i] == 'x') $strfmt[$i] = dechex(rand(0,15));
        return($strfmt);
    }


    /*! \brief  Generate the plugins HTML content.
     *  @return String  HTML content
     */
    function execute()
    {
        plugin::execute();    

        if($this->dialog instanceOf singleUserSelect) return($this->dialog->execute());

        $smarty = get_smarty();

        // Assign ACL settings 
        $plInfo = $this->plInfo();
        foreach($plInfo['plProvidedAcls'] as $name => $desc){
            $smarty->assign("{$name}ACL", $this->getacl($name));
        }
    
        // Assign just user names instead of the complete dn.
        $smarty->assign("owner_name", $this->getUserName($this->owner));
        $smarty->assign("manager_name", $this->getUserName($this->manager));
        $smarty->assign("base", $this->baseSelector->render());

        // Assign attribute values 
        foreach($this->attributes as $attr){
            $smarty->assign($attr, set_post($this->$attr));
        }

        // If one attribute of the registered device is given, all others are required too.
        $str = $this->manager.$this->deviceUUID.$this->deviceStatus;
        $smarty->assign("registeredRequired", !empty($str));
        return($smarty->fetch(get_template_path('Device.tpl', TRUE, dirname(__FILE__))));
    }


    /*! \brief  Validate the user input.
     */ 
    function check()
    {   
        $message = plugin::check();
       
        // If one of the registered user attributes is set, 
        //  the others have to be set too.
        $str = $this->manager.$this->deviceUUID.$this->deviceStatus;
        if(!empty($str)){        
            if(empty($this->deviceStatus)){
                $message[] = msgPool::required(tr("Status"));
            }
            if(empty($this->manager)){
                $message[] = msgPool::required(tr("Manager"));
            }
            if(empty($this->deviceUUID)){
                $message[] = msgPool::required(tr("Device UUID"));
            }
        }

        // Check ip-address
        if (!empty($this->ipHostNumber) && !tests::is_ip($this->ipHostNumber)){
            $message[]= msgPool::invalid(tr("IP address"), "", "", "192.168.1.10");
        }

        // Check if there a cn given
        if (empty($this->cn)){
            $message[]= msgPool::required(tr("Name"));
        }

        // Check mac-address
        if (!empty($this->macAddress) && !tests::is_mac($this->macAddress)){
            $message[]= msgPool::invalid(tr("MAC address"), "", "", "00:0C:7F:31:33:F1");
        }
 
        return($message);
    }

   
    /*! \brief  Detect an object's name by querying the ldap
     *           for the object's cn.
     * @param   String  The object's dn to query for.
     */ 
    function getUserName($dn)
    {   
        // First asked the cache if we've already queried this name.
        if(isset($this->resolvedNamesCache[$dn])) {
            return($this->resolvedNamesCache[$dn]);
        }

        // Try to detect the object's name via ldap search.
        $ldap = $this->config->get_ldap_link();
        $this->resolvedNamesCache[$dn] = "";
        if(!empty($dn)){
            $ldap->cat($dn, array('cn'));
            if($ldap->count()){
                $attrs = $ldap->fetch();
                $this->resolvedNamesCache[$dn] = $attrs['cn'][0];
                return( $attrs['cn'][0]);
            }else{
                $this->resolvedNamesCache[$dn] = "(".tr("unknown")."!): ".$dn;
            }
        }
        return($this->resolvedNamesCache[$dn]);
    }   
    
 
    /*! \brief  Detects and stores relevant values which where
     *           currently transmitted via $_GET/$_POST.
     */ 
    function save_object()
    {
        plugin::save_object();

        // Change owner requested, initiate a user selection dialog.
        if(isset($_POST['editOwner'])){
            $this->currentUserSelect = "owner";
            $this->dialog = new singleUserSelect($this->config, get_userinfo());
        }

        // Change manager requested, initiate a user selection dialog.
        if(isset($_POST['editManager'])){
            $this->currentUserSelect = "manager";
            $this->dialog = new singleUserSelect($this->config, get_userinfo());
        }

        // Remove owner initiated 
        if(isset($_POST['removeManager']))  $this->manager = "";
        if(isset($_POST['removeOwner']))  $this->owner = "";

        // The user selection dialog has send that it has finished its job.
        // Store the posted user-dn as manager or owner. 
        if($this->dialog && $this->dialog instanceOf singleUserSelect && count($this->dialog->detectPostActions())){
            $users = $this->dialog->detectPostActions();
            if(isset($users['action']) && $users['action'] == 'userSelected' && isset($users['targets']) && count($users['targets'])){
                $headpage = $this->dialog->getHeadpage();
                $dn = $users['targets'][0];
                $attr = $this->currentUserSelect;
                $this->$attr = $dn;
                $this->dialog = NULL;
            }
        }
        
        // User selection canceled
        if(isset($_POST['add_users_cancel'])){
            $this->dialog = NULL;
        }
      
        // Regenerate a new uuid 
        if(isset($_POST['reloadUUID']))  $this->deviceUUID = $this->genFakeUuid();

        // Update the base 
        if ($this->acl_is_moveable($this->base)){
            if (!$this->baseSelector->update()) {
                msg_dialog::display(tr("Error"), msgPool::permMove(), ERROR_DIALOG);
            }
            if ($this->base != $this->baseSelector->getBase()) {
                $this->base= $this->baseSelector->getBase();
                $this->is_modified= TRUE;
            }
        }

    }


    /*! \brief  Save the modified object back to the ldap.
     */ 
    function save()
    {
        plugin::save();

        // Append and remove dynmic object classes
        foreach($this->dynClasses as $oc => $attrs){
            $this->attrs['objectClass'] = array_remove_entries(array($oc), $this->attrs['objectClass']);
            foreach($attrs as $attr){
                if(isset($this->attrs[$attr]) && !empty($this->attrs[$attr])){
                    $this->attrs['objectClass'][] = $oc;
                    break;
                }
            }
        }

        $this->cleanup();
        $ldap=$this->config->get_ldap_link();
        $ldap->cd($this->config->current['BASE']);
        $ldap->create_missing_trees(preg_replace("/^[^,]*+,/","",$this->dn));
        $ldap->cd($this->dn);

        // Perform action modify/create
        if($this->initially_was_account){
            $ldap->modify($this->attrs);
            new log("modify","Device/".get_class($this),$this->dn,array_keys($this->attrs),$ldap->get_error());
            if (!$ldap->success()){
                msg_dialog::display(tr("LDAP error"), msgPool::ldaperror($ldap->get_error(), $this->dn, LDAP_MOD, get_class()));
            }else{
                $this->handle_post_events("modify");
            }
        }else{
            $ldap->add($this->attrs);
            new log("create","Device/".get_class($this),$this->dn,array_keys($this->attrs),$ldap->get_error());
            if (!$ldap->success()){
                msg_dialog::display(tr("LDAP error"), msgPool::ldaperror($ldap->get_error(), $this->dn, LDAP_ADD, get_class()));
            }else{
                $this->handle_post_events("add");
            }
        }
    }


    static function plInfo()
    {
        return (array(
                    "plShortName"   => tr("Device"),
                    "plDescription" => tr("Device"),
                    "plSelfModify"  => FALSE,
                    "plDepends"     => array(),
                    "plPriority"    => 1,
                    "plSection"     => array("administration"),
                    "plCategory"    => 
                    array(
                        "Device" => array( 
                            "description"  => tr("Device"),
                            "objectClass"  => "Device")
                        ),
                    "plProvidedAcls" => 
                    array(
                        "base" => tr("Base"),
                        "cn" => tr("Name"),
                        "serialNumber" => tr("Serial number"),
                        "seeAlso" => tr("See also"),
                        "owner" => tr("Owner"),
                        "ou" => tr("Organizational Unit"),
                        "o" => tr("Organization"),
                        "l" => tr("Location"),
                        "description" => tr("Description"),
                        "manager" => tr("Manager"),
                        "deviceUUID" => tr("UUID"),
                        "deviceStatus" => tr("Status"),
                        "deviceType" => tr("Type"),
                        "macAddress" => tr("MAC address"),
                        "ipHostNumber" => tr("IP address")
                        ),
            "plProperties" =>
                array(
                        array(
                            "name"          => "GOsaDeviceRDN",
                            "type"          => "rdn",
                            "default"       => "ou=devices,ou=systems,",
                            "description"   => tr("RDN for device storage."),
                            "check"         => "gosaProperty::isRdn",
                            "migrate"       => "migrate_GOsaDeviceRDN",
                            "group"         => "plugin",
                            "mandatory"     => FALSE
                            ),

                     )
                )
                );
    }
}

?>
