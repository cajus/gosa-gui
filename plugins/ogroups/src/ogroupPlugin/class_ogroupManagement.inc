<?php
/*
 * This code is part of GOsa (http://www.gosa-project.org)
 * Copyright (C) 2003-2008 GONICUS GmbH
 *
 * ID: $$Id: class_ogroupManagement.inc 19221 2010-07-29 12:14:19Z hickert $$
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

class ogroupManagement extends management
{
    var $plHeadline     = "Object groups";
    var $plDescription  = "Combine different types of objects to make use of this relationship";
    var $plIcon  = "plugins/ogroups/html/images/plugin.png";

    // Tab definition 
    protected $tabClass = "ogrouptabs";
    protected $tabType = "OGROUPTABS";
    protected $aclCategory = "ogroups";
    protected $aclPlugin   = "ogroup";
    protected $objectName   = "object group";

    function __construct($config,$ui)
    {
        $this->config = $config;
        $this->ui = $ui;

        $this->storagePoints = array(get_ou("group", "ogroupRDN"));

        // Build filter
        if (session::global_is_set(get_class($this)."_filter")){
            $filter= session::global_get(get_class($this)."_filter");
        } else {
            $filter = new filter(get_template_path("ogroup-filter.xml", true));
            $filter->setObjectStorage($this->storagePoints);
        }
        $this->setFilter($filter);

        // Build headpage
        $headpage = new listing(get_template_path("ogroup-list.xml", true));
        $headpage->registerElementFilter("filterProperties", "ogroupManagement::filterProperties");
        $headpage->setFilter($filter);

        // Add copy&paste and snapshot handler.
        if ($this->config->boolValueIsTrue("core", "copyPaste")){
            $this->cpHandler = new CopyPasteHandler($this->config);
        }
        if($this->config->get_cfg_value("core","enableSnapshots") == "true"){
            $this->snapHandler = new SnapshotHandler($this->config);
        }
        parent::__construct($config, $ui, "ogroups", $headpage);

        $this->registerAction("edit_ogroup","editEntry");
        $this->registerAction("edit_phonequeue","editEntry");
        $this->registerAction("edit_workstartup","editEntry");
        $this->registerAction("edit_termgroup","editEntry");
    }


    function editEntry($action="",$target=array(),$all=array(), $altTabClass ="", $altTabType = "", $altAclCategory="")
    {
        $str = management::editEntry($action,$target);
        if(preg_match("/^edit_/",$action)){
            $tab = preg_replace("/^edit_/","",$action);
            if(isset($this->tabObject->by_object[$tab])){
                $this->tabObject->current = $tab;
            }else{
                trigger_error("Unknown tab: ".$tab);
            }
        }
        if(!empty($str)) return($str);
    }


    static function filterProperties($row, $gosaGroupObjects)
    {

        $conv= array(
                "Y" => array("plugins/users/html/images/select_template.png",tr("Templates") , "ogroup"),
                "U" => array("plugins/generic/html/images/head.png"        ,tr("User")        , "ogroup"),
                "G" => array("plugins/groups/html/images/select_group.png"       ,tr("Group")       , "ogroup"),
                "A" => array("plugins/ogroups/html/images/application.png" ,tr("Application") , "ogroup"),
                "D" => array("plugins/departments/department.png"     ,tr("Department")  , "ogroup"),
                "S" => array("plugins/ogroups/html/images/server.png"      ,tr("Server")      , "ogroup"),
                "F" => array("plugins/ogroups/html/images/asterisk.png"    ,tr("Phone")       , "phonequeue"),
                "W" => array("plugins/ogroups/html/images/workstation.png" ,tr("Workstation") , "workstartup"),
                "O" => array("plugins/ogroups/html/images/winstation.png"  ,tr("Windows Install") , "ogroup"),
                "T" => array("plugins/ogroups/html/images/terminal.png"    ,tr("Terminal")    , "termgroup"),
                "P" => array("plugins/ogroups/html/images/printer.png"     ,tr("Printer")     , "ogroup"));

        $types = preg_replace("/[^a-z]/i","",$gosaGroupObjects[0]);
        $result ="";
        for($i = 0 ; $i < strlen($types); $i++){
            $type = $types[$i];
            $result.= image($conv[$type][0], 'listing_edit_'.$conv[$type][2].'_'.$row,$conv[$type][1]);
        }
        return($result);
    }
} 
// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
