<?php

/*
 *   How to use plugin::plInfo()
 *   ===================
 *   
 *   The function returns a descriptive array of the plugin,
 *    which will then be used by GOsa to populate the plugin, its ACLs, 
 *    its properties, its schema requirements aso.
 *
 *
 *   The following values can be set:
 *   ================================
 *
 *   plShortName    |-> The name of the plugin in short (e.g. Posix)
 *                  |   This short-name will be shown for example in the ACL definitions.
 *                  | 
 *                  | 
 *   plDescription  |-> A descriptive text for the plugin (e.g. User posix account extension)
 *                  |   This will be shown in the ACL definitions.   
 *                  | 
 *                  | 
 *   plSelfModify   |-> If set to true this plugin allows to set 'self' ACLs.
 *                  |   For exampe to allow to change the users own password, but not the others.
 *                  | 
 *                  | 
 *   plDepends      |-> The plugins dependencies to other classes (e.g. sambaAccount requires posixAccount)
 *                  |  
 *                  | 
 *   plPriority     |-> The priority of the plugin, this influences the ACL listings only.
 *                  | 
 *                  | 
 *   plSection      |-> The section of this plugin 'administration', 'personal', 'addons'
 *                  | 
 *                  | 
 *   plCategory     |-> The plugin category this plugins belongs to (e.g. users, groups, departments) 
 *                  | 
 *                  | 
 *   plRequirements |-> Plugin requirements. 
 *                  | |
 *                  | |-> [activePlugin]           The schame checks will only be performed if the given plugin is enabled
 *                  | |                             in the gosa.conf definitions.
 *                  | |                            Defaults to the current class name if empty.
 *                  | |
 *                  | |-> [ldapSchema]             An array of objectClass requirements.
 *                  | |                            Syntax [[objectClass => 'version'], ... ]
 *                  | |                            Version can be emtpy which just checks for the existence of the class.
 *                  | |
 *                  | |-> [onFailureDisablePlugin] A list of plugins that which will be disabled if the 
 *                  |                               requirements couldn't be fillfulled.
 *                  |
 *                  |      ---------------------------------------------
 *                  |      EXAMPLE:
 *                  |      ---------------------------------------------
 *                  |      "plRequirements"=> array(
 *                  |         'activePlugin' => 'applicationManagement', 
 *                  |         'ldapSchema' => array(
 *                  |             'gosaObject' => '',
 *                  |             'gosaAccount' => '>=2.7',
 *                  |             'gosaLockEntry' => '>=2.7',
 *                  |             'gosaDepartment' => '>=2.7',
 *                  |             'gosaCacheEntry' => '>=2.7',
 *                  |             'gosaProperties' => '>=2.7',
 *                  |             'gosaConfig' => '>=2.7'
 *                  |             ),
 *                  |         'onFailureDisablePlugin' => array(get_class(), 'someClassName')
 *                  |         ),
 *                  |      ---------------------------------------------
 *                  |
 *                  |
 *                  |         
 *   plProvidedAcls |-> The ACLs provided by this plugin
 *                  |
 *                  |      ---------------------------------------------
 *                  |      EXAMPLE:
 *                  |      ---------------------------------------------
 *                  |      "plProvidedAcls"=> array(
 *                  |          'cn'             => tr('Name'),
 *                  |          'uid'            => tr('Uid'),
 *                  |          'phoneNumber'    => tr('Phone number')
 *                  |          ),
 *                  |      ---------------------------------------------
 *                  |
 *                  |
 *                  | 
 *   plProperties   |-> Properties used by the plugin.
 *                  |   Properties which are defined here will be modifyable using the property editor.
 *                  |   To read properties you can use $config->get_cfg_value(className, propertyName)
 *                  | 
 *                  |      ---------------------------------------------
 *                  |      EXAMPLE:
 *                  |      ---------------------------------------------
 *                  |      "plProperties"=> array(
 *                  |         array(
 *                  |             "name"          => "htaccessAuthentication",
 *                  |             "type"          => "bool",
 *                  |             "default"       => "false",
 *                  |             "description"   => tr("A description..."),
 *                  |             "check"         => "gosaProperty::isBool",
 *                  |             "migrate"       => "",
 *                  |             "group"         => "authentification",
 *                  |             "mandatory"     => TRUE
 *                  |             ),
 *                  |         ),
 *                  |   See class_core.inc for a huge amount of examples.
 */


class all extends plugin {
    static function plInfo()
    {
        return (array(
                    "plShortName"   => tr("All"),
                    "plDescription" => tr("All objects"),
                    "plSelfModify"  => TRUE,
                    "plDepends"     => array(),
                    "plPriority"    => 0,
                    "plSection"     => array("administration"),
                    "plCategory"    => array("all" => array("description" => '*&nbsp;'.tr("All"))),
                    "plProvidedAcls"    => array())
               );
    }
}

class core extends plugin {

    static function getPropertyValues($class,$name,$value,$type)
    {
        $list = array();
        switch($name){
            case 'idAllocationMethod':
                $list = array('traditional' => tr('Traditional'), 'pool' => tr('Use samba pool'));
                break;
            case 'passwordDefaultHash':
                $tmp = passwordMethod::get_available_methods();
                foreach($tmp['name'] as $id => $method){
                    $desc = $tmp[$id]['name'];
                    $list[$method] = $desc;
                }
                break;
            case 'theme':
                $cmd = "cd ../ihtml/themes; find . -name 'img.styles' | sed s/'^[^\/]*\/\([^\/]*\).*'/'\\1'/g";
                $res = `$cmd`  ; 
                $list = array();
                foreach(preg_split("/\n/",$res) as $entry){
                    if(!empty($entry)){
                        $list[$entry] = $entry;
                    }
                }
                break;
            case 'accountPrimaryAttribute':
                $list = array('uid' => 'uid', 'cn' => 'cn');
                break;
            case 'loginAttribute':
                $list = array(
                            'uid' => 'uid',
                            'mail' => 'mail',
                            'both' => 'uid & mail');
                break;
            case 'timezone': 
                $tmp = timezone::_get_tz_zones();
                foreach($tmp['TIMEZONES'] as $tzname => $offset){
                    if($offset >= 0){
                        $list[$tzname] = $tzname." ( + ".sprintf("%0.2f",$offset/(60*60))." ".tr("hours").")";
                    }else{
                        $offset = $offset * -1;
                        $list[$tzname] = $tzname." ( - ".sprintf("%0.2f",($offset/(60*60)))." ".tr("hours").")";
                    }
                }
                break;
            case 'mailAttribute':
                $list = array('mail' => 'mail','uid' => 'uid');
                break;
            case 'mailMethod': 
                $tmp = array();
                if(class_available('mailMethod')){
                    $tmp = mailMethod::get_methods();
                }
                $list =array();
                foreach($tmp as $vName => $vValue){
                    $vName = preg_replace('/^mailMethod/','', $vName);
                    $list[$vName] = $vValue;
                }
                $list[''] = tr("None");
                break;
            case 'language':
                $tmp = get_languages(TRUE);
                $list[""] = tr("Automatic");
                foreach($tmp as $key => $desc){
                    $list[$key] = $desc;
                }
                break;
            case 'modificationDetectionAttribute': 
                $list = array('entryCSN' => 'entryCSN (OpenLdap)','textCSN'=>'textCSN (Sun DS)');
                break;
            default: echo $name." ";$list = array();
        }

        if(!isset($list[$value])){
            $list[$value] = $value." (".tr("User value").")";
        }

        return($list);
    }

    static function plInfo()
    {
        return (array(
                    "plShortName" => tr("Core"),
                    "plDescription" => tr("GOsa core plugin"),
                    "plSelfModify"  => FALSE,
                    "plDepends"     => array(),
                    "plPriority"    => 0,
                    "plSection"     => array("administration"),

                    "plRequirements"=> array(
                        'ldapSchema' => array(
                            'gosaObject' => '>=2.7',
                            'gosaAccount' => '>=2.7',
                            'gosaLockEntry' => '>=2.7',
                            'gosaDepartment' => '>=2.7',
                            'gosaCacheEntry' => '>=2.7',
                            'gosaProperties' => '>=2.7',
                            'gosaConfig' => '>=2.7'
                            ),
                        'onFailureDisablePlugin' => array(get_class())
                        ),



                    "plCategory"    => array("all"),
                    "plProperties"  => array(

                        array(
                            "name"          => "htaccessAuthentication",
                            "type"          => "bool",
                            "default"       => "false",
                            "description"   => tr("Enables htaccess instead of LDAP authentication. This can be used to enable other authentication mechanisms like Kerberos for the GOsa login."),
                            "check"         => "gosaProperty::isBool",
                            "migrate"       => "",
                            "group"         => "authentification",
                            "mandatory"     => TRUE),

                        array(
                            "name"          => "statsDatabaseEnabled",
                            "type"          => "bool",
                            "default"       => "false",
                            "description"   => tr("Enables the usage statistics module."),
                            "check"         => "gosaProperty::isBool",
                            "migrate"       => "",
                            "group"         => "core",
                            "mandatory"     => TRUE),

                        array(
                                "name"          => "statsDatabaseDirectory",
                                "type"          => "path",
                                "default"       => "/var/spool/gosa/stats",
                                "description"   => tr("Database file to be used by the usage statistics module."),
                                "check"         => "gosaProperty::isWriteablePath",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => TRUE),

                        array(
                            "name"          => "logging",
                            "type"          => "bool",
                            "default"       => "true",
                            "description"   => tr("Enables event logging in GOsa. Setting it to 'On' make GOsa log every action a user performs via syslog. If you use this in combination with rsyslog and configure it to MySQL logging, you can browse all events in GOsa."),

                            "check"         => "gosaProperty::isBool",
                            "migrate"       => "",
                            "group"         => "core",
                            "mandatory"     => TRUE),

                        array(
                                "name"          => "listSummary",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enables a status bar on the bottom of lists displaying a summary of type and number of elements in the list."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "visual",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "passwordMinLength",
                                "type"          => "integer",
                                "default"       => "",
                                "description"   => tr("Specify the minimum length for newly entered passwords."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "password",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "passwordMinDiffer",
                                "type"          => "integer",
                                "default"       => "",
                                "description"   => tr("Specify the minimum number of characters that have to differ between old and newly entered passwords."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "password",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "passwordProposalHook",
                                "type"          => "command",
                                "default"       => "",
                                "description"   => tr("Command to generate password proposals. If a command has been specified, the user can decide whether to use an automatic password or a manually specified one.")." ".tr("Example").": /usr/bin/apg -n1",
                                "check"         => "gosaProperty::isCommand",
                                "migrate"       => "",
                                "group"         => "password",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "displayErrors",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable display of PHP errors on the top of the page. Disable this feature in production environments to avoid the exposure of sensitive data.")." ".sprintf(tr("Related option").": developmentMode"),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "debug",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "developmentMode",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Show messages that may assist plugin development. Be aware that this option may produce some ACL related false error messages!"),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "debug",
                                "mandatory"     => TRUE),


                        array(
                                "name"          => "schemaCheck",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enable LDAP schema verification during login. The recommended setting is 'On' because it enables efficient methods to create missing subtrees in the LDAP."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "debug",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "copyPaste",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable copy and paste for most objects managed by GOsa."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "copyPaste",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "forceGlobals",
                                "type"          => "noLdap",
                                "default"       => "false",
                                "description"   => tr("Enable PHP security checks for disabled register_global settings."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "security",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "forceSSL",
                                "type"          => "noLdap",
                                "default"       => "false",
                                "description"   => tr("Enable automatic redirection to HTTPS based administration."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "security",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "ldapStats",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable logging of detailed information of LDAP operations."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "debug",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "ldapFollowReferrals",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable LDAP referral chasing."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "ldap",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "ldapFilterNestingLimit",
                                "type"          => "integer",
                                "default"       => 200,
                                "description"   => tr("Specify LDAP element filter limit. If the limit is not 0, GOsa speeds up group queries by putting several queries into a single query. This is known to produce problems on some LDAP servers (i.e. Sun DS) and needs to be lowered or disabled."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "ldap",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "ldapSizelimit",
                                "type"          => "integer",
                                "default"       => 200,
                                "description"   => tr("Specify the maximum number of entries GOsa will request from an LDAP server. A warning is displayed if this limit is exceeded."), 
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "ldapSizeIgnore",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Disable checks for LDAP size limits."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "warnSSL",
                                "type"          => "noLdap",
                                "default"       => "true",
                                "description"   => tr("Enable warnings for non encrypted connections."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "security",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "ppdGzip",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enable compression for PPD files."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "ppd",
                                "mandatory"     => FALSE),


                        array(
                                "name"          => "ignoreAcl",
                                "type"          => "dn",
                                "default"       => "",
                                "description"   => tr("DN of user with ACL checks disabled. This should only be used to restore lost administrative ACLs."),
                                "check"         => "gosaProperty::isDN",
                                "migrate"       => "",
                                "group"         => "debug",
                                "mandatory"     => FALSE),


                        array(
                                "name"          => "ppdPath",
                                "type"          => "path",
                                "default"       => "/var/spool/ppd",
                                "description"   => tr("Storage path for PPD files."),
                                "check"         => "gosaProperty::isPath",
                                "migrate"       => "",
                                "group"         => "ppd",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "ldapMaxQueryTime",
                                "type"          => "integer",
                                "default"       => "",
                                "description"   => tr("Number of seconds a LDAP query is allowed to take until GOsa aborts the request."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "debug",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "storeFilterSettings",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enables storing of user filters in browser cookies."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "sendCompressedOutput",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enables sending of compressed web page content."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "allowUidProposalModification",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Allows to modify uid-proposals when creating a new user from a user-template."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "modificationDetectionAttribute",
                                "type"          => "switch",
                                "default"       => "entryCSN",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("LDAP attribute which is used to detect changes."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "language",
                                "type"          => "switch",
                                "default"       => "",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("ISO language code which is used to override the automatic language detection."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "theme",
                                "type"          => "switch",
                                "default"       => "default",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("CSS and template theme to be used."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "visual",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "sessionLifetime",
                                "type"          => "integer",
                                "default"       => 600,
                                "description"   => tr("Number of seconds after an inactive session expires. This may be overridden by some systems php.ini/crontab mechanism."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "security",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "templateCompileDirectory",
                                "type"          => "path",
                                "default"       => "/var/spool/gosa",
                                "description"   => tr("Template engine compile directory."),
                                "check"         => "gosaProperty::isWriteablePath",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "debugLevel",
                                "type"          => "integer",
                                "default"       => 0,
                                "description"   => sprintf(tr("Logical AND of the integer values below that controls the debug output on every page load: %s"),
"

DEBUG_TRACE   = 1
DEBUG_LDAP    = 2
DEBUG_MYSQL   = 4
DEBUG_SHELL   = 8
DEBUG_POST    = 16
DEBUG_SESSION = 32
DEBUG_CONFIG  = 64
DEBUG_ACL     = 128
DEBUG_SI      = 256"),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "debug",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "sambaHashHook",
                                "type"          => "command",
                                "default"       => "perl -MCrypt::SmbHash -e \"print join(q[:], ntlmgen %password), $/;\"",
                                "description"   => tr("Command to create Samba NT/LM hashes. Required for password synchronization if you don't use supplementary services."),
                                "check"         => "gosaProperty::isCommand",
                                "migrate"       => "",
                                "group"         => "samba",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "passwordDefaultHash",
                                "type"          => "switch",
                                "default"       => "crypt/md5",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("Default hash to be used for newly created user passwords."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "password",
                                "mandatory"     => FALSE),
                        array(
                                "name"          => "strictPasswordRules",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enable checking for the presence of problematic unicode characters in passwords."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "password",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "accountPrimaryAttribute",
                                "type"          => "switch",
                                "default"       => "cn",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("Specify whether 'cn' or 'uid' style user DNs are generated. For more sophisticated control use the 'accountRDN' setting."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "security",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "userRDN",
                                "type"          => "rdn",
                                "default"       => "ou=people,",
                                "description"   => tr("Location component for user storage inside of departments."),
                                "check"         => "gosaProperty::isRdn",
                                "migrate"       => "migrate_userRDN", 
                                "group"         => "user",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "groupRDN",
                                "type"          => "rdn",
                                "default"       => "ou=groups,",
                                "description"   => tr("Location component for group storage inside of departments."),
                                "check"         => "gosaProperty::isRdn",
                                "migrate"       => "migrate_groupRDN",
                                "group"         => "group",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "gidNumberBase",
                                "type"          => "integer",
                                "default"       => "1000",
                                "description"   => tr("Count base for group IDs. For dynamic ID assignment use the 'nextIdHook' setting."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => TRUE),

                       array(
                                "name"          => "baseIdHook",
                                "type"          => "command",
                                "default"       => "",
                                "description"   => tr("Count base for user IDs. For dynamic ID assignment use the 'nextIdHook' setting."),
                                "check"         => "gosaProperty::isCommand",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "gidNumberPoolMin",
                                "type"          => "integer",
                                "default"       => 10000,
                                "description"   => tr("Lowest assignable group ID for use with the idAllocationMethod set to 'pool'."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "gidNumberPoolMax",
                                "type"          => "integer",
                                "default"       => 40000,
                                "description"   => tr("Highest assignable group ID for use with the idAllocationMethod set to 'pool'."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "uidNumberPoolMin",
                                "type"          => "integer",
                                "default"       => 10000,
                                "description"   => tr("Lowest assignable user ID for use with the idAllocationMethod set to 'pool'."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "uidNumberPoolMax",
                                "type"          => "integer",
                                "default"       => 40000,
                                "description"   => tr("Highest assignable user ID for use with the idAllocationMethod set to 'pool'."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "uidNumberBase",
                                "type"          => "integer",
                                "default"       => "1000",
                                "description"   => tr("Count base for user IDs. For dynamic ID assignment use the 'baseIdHook' setting."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "gosaRpcServer",
                                "type"          => "string",
                                "default"       => "",
                                "description"   => tr("Connection URL for use with the gosa-ng service."),
                                "check"         => "jsonRPC::testConnectionProperties",
                                "migrate"       => "",
                                "group"         => "rpc",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "gosaRpcUser",
                                "type"          => "string",
                                "default"       => "admin",
                                "description"   => tr("User name used to connect to the 'gosaRpcServer'."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "rpc",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "gosaRpcPassword",
                                "type"          => "string",
                                "default"       => "tester",
                                "description"   => tr("Password used to connect to the 'gosaRpcServer'."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "rpc",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "loginAttribute",
                                "type"          => "switch",
                                "default"       => "uid",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("User attribute which is used for log in."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "security",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "timezone",
                                "type"          => "switch",
                                "default"       => "",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("Local time zone."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "honourUnitTags",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable tagging of administrative units. This can be used in conjunction with ACLs (obsolete)."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "useSaslForKerberos",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enable the use of {sasl} instead of {kerberos} for user realms."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "password",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "rfc2307bis",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable RFC 2307bis style groups. This combines the use of 'member' and 'memberUid' attributes."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "personalTitleInDN",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Adjusts the user DN generation to include the users personal title (only in conjunction with accountPrimaryAttribute)."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "storage location",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "nextIdHook",
                                "type"          => "command",
                                "default"       => "",
                                "description"   => tr("Script to be called for finding the next free id for groups or users."),
                                "check"         => "gosaProperty::isCommand",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),
                        array(
                                "name"          => "idGenerator",
                                "type"          => "string",
                                "default"       => "{%sn}-{%givenName[2-4]}",
                                "description"   => tr("Descriptive string for the automatic ID generator. Please read the FAQ file for more information."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "strictNamingRules",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enable strict checking for user IDs and group names."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "minId",
                                "type"          => "integer",
                                "default"       => 40,
                                "description"   => tr("Lowest assignable user or group ID. Only active if idAllocationMethod is set to 'traditional'."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "mailAttribute",
                                "type"          => "switch",
                                "default"       => "mail",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("Attribute to be used for primary mail addresses."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "gosaSharedPrefix",
                                "type"          => "string",
                                "default"       => "",
                                "description"   => tr("Namespace used for shared folders."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "mailUserCreation",
                                "type"          => "string",
                                "default"       => "",
                                "description"   => tr("Namespace rule to create user folders. Please read the FAQ file for more information."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "mailFolderCreation",
                                "type"          => "string",
                                "default"       => "",
                                "description"   => tr("Namespace rule to create folders. Please read the FAQ file for more information."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "imapTimeout",
                                "type"          => "integer",
                                "default"       => 10,
                                "description"   => tr("Seconds after an IMAP connection is considered dead."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "mailMethod",
                                "type"          => "switch",
                                "default"       => "",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("Class name of the mail method to be used."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "cyrusUseSlashes",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enable slashes instead of dots as a name space separator for Cyrus IMAP."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "vacationTemplateDirectory",
                                "type"          => "path",
                                "default"       => "/etc/gosa/vacation",
                                "description"   => tr("Directory to store vacation templates. Please read the FAQ file for more information."),
                                "check"         => "gosaProperty::isWriteablePath",
                                "migrate"       => "",
                                "group"         => "mail",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "ldapTLS",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable TLS for LDAP connections."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "security",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "honourIvbbAttributes",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable IVBB used by german authorities."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "sambaIdMapping",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Maintain sambaIdmapEntry objects to improve performance on some Samba versions."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "samba",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "handleExpiredAccounts",
                                "type"          => "bool",
                                "default"       => "true",
                                "description"   => tr("Enable checks to determine whether an account is expired or not."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "sambaSID",
                                "type"          => "string",
                                "default"       => "",
                                "description"   => tr("String containing the SID for Samba setups without the Domain object in LDAP."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "samba",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "sambaRidBase",
                                "type"          => "integer",
                                "default"       => "",
                                "description"   => tr("String containing the RID base for Samba setups without the Domain object in LDAP."),
                                "check"         => "gosaProperty::isInteger",
                                "migrate"       => "",
                                "group"         => "samba",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "enableSnapshots",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable manual object snapshots."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "snapshot",
                                "mandatory"     => TRUE),

                        array(
                                "name"          => "snapshotBase",
                                "type"          => "dn",
                                "default"       => "ou=snapshots,dc=localhost,dc=de",
                                "description"   => tr("Base DN for snapshot storage."),
                                "check"         => "gosaProperty::isDn",
                                "migrate"       => "",
                                "group"         => "snapshot",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "snapshotAdminDn",
                                "type"          => "dn",
                                "default"       => "cn=admin,dc=localhost,dc=de",
                                "description"   => tr("DN of the snapshot administrator."),
                                "check"         => "gosaProperty::isDn",
                                "migrate"       => "",
                                "group"         => "snapshot",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "snapshotAdminPassword",
                                "type"          => "string",
                                "default"       => "secret",
                                "description"   => tr("Password of the snapshot administrator."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "snapshot",
                                "mandatory"     => FALSE),

                        array(
                                "name"          => "idAllocationMethod",
                                "type"          => "switch",
                                "default"       => "traditional",
                                "defaults"      => "core::getPropertyValues",
                                "description"   => tr("Method for user and group ID generation. Note: only the 'traditional' method is safe due to PHP limitations."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "id",
                                "mandatory"     => TRUE),
                        array(
                                "name"          => "snapshotURI",
                                "type"          => "uri",
                                "default"       => "ldap://localhost:389",
                                "description"   => tr("URI of server to be used for snapshots."),
                                "check"         => "",
                                "migrate"       => "",
                                "group"         => "snapshot",
                                "mandatory"     => FALSE),
                        array(
                                "name"          => "forceTranslit",
                                "type"          => "bool",
                                "default"       => "false",
                                "description"   => tr("Enable transliteration of cyrillic characters for UID generation."),
                                "check"         => "gosaProperty::isBool",
                                "migrate"       => "",
                                "group"         => "core",
                                "mandatory"     => TRUE)
                            )));
    }
}
?>
