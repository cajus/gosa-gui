<?php


# Access constants
if(!defined("GROUPWARE_LOOKUP")){
    define ("GROUPWARE_LOOKUP", 1);
    define ("GROUPWARE_READ", 2);
    define ("GROUPWARE_STATUS", 4);
    define ("GROUPWARE_WRITE", 8);
    define ("GROUPWARE_INSERT", 16);
    define ("GROUPWARE_POST", 32);
    define ("GROUPWARE_CREATE", 64);
    define ("GROUPWARE_DELETE", 128);
    define ("GROUPWARE_ADMINISTRATE", 256);

    define ("GROUPWARE_RIGHTS_NONE", 0);
    define ("RIGHTS_GROUPWARE_READ",  GROUPWARE_LOOKUP | GROUPWARE_READ | GROUPWARE_STATUS);
    define ("RIGHTS_GROUPWARE_POST", RIGHTS_GROUPWARE_READ | GROUPWARE_POST);
    define ("GROUPWARE_RIGHTS_APPEND", RIGHTS_GROUPWARE_POST | GROUPWARE_INSERT);
    define ("RIGHTS_GROUPWARE_WRITE", GROUPWARE_RIGHTS_APPEND | GROUPWARE_WRITE | GROUPWARE_CREATE | GROUPWARE_DELETE);
    define ("GROUPWARE_RIGHTS_ALL", RIGHTS_GROUPWARE_WRITE | GROUPWARE_ADMINISTRATE);
}

class GroupwareDefinitions
{
    public static function getPermissions()
    {
        $ret[GROUPWARE_RIGHTS_NONE] = tr("no right");
        $ret[RIGHTS_GROUPWARE_READ] = tr("read right");
        $ret[RIGHTS_GROUPWARE_POST] = tr("post right");
        $ret[GROUPWARE_RIGHTS_APPEND] = tr("append right");
        $ret[RIGHTS_GROUPWARE_WRITE] = tr("write right");
        $ret[GROUPWARE_RIGHTS_ALL] = tr("all rights");
		
		$ret[GROUPWARE_LOOKUP] = tr("lookup right");
		$ret[GROUPWARE_READ] = tr("atomic read right");
		$ret[GROUPWARE_STATUS] = tr("atomic status right");
		$ret[GROUPWARE_WRITE] = tr("atomic write right");
		$ret[GROUPWARE_INSERT] = tr("atomic insert right");
		$ret[GROUPWARE_POST] = tr("atomic post right");
		$ret[GROUPWARE_CREATE] = tr("atomic create right");
		$ret[GROUPWARE_DELETE] = tr("atomic delete right");
		$ret[GROUPWARE_ADMINISTRATE] = tr("atomic admin right");

    //$ret[GROUPWARE_RIGHTS_NONE", 0);
    //$ret[RIGHTS_GROUPWARE_READ",  GROUPWARE_LOOKUP | GROUPWARE_READ | GROUPWARE_STATUS);
    //$ret[RIGHTS_GROUPWARE_POST", RIGHTS_GROUPWARE_READ | GROUPWARE_POST);
    //$ret[GROUPWARE_RIGHTS_APPEND", RIGHTS_GROUPWARE_POST | GROUPWARE_INSERT);
    //$ret[RIGHTS_GROUPWARE_WRITE", GROUPWARE_RIGHTS_APPEND | GROUPWARE_WRITE | GROUPWARE_CREATE | GROUPWARE_DELETE);
    //$ret[GROUPWARE_RIGHTS_ALL"
		
        return($ret);
    }
	
	public static function getDefaultFolderACLs()
	{	
		$r = array();
		$r["Anonym"] = GROUPWARE_RIGHTS_NONE;
		$r["Standard"] = GROUPWARE_RIGHTS_NONE;
		
		return $r;
	}
} 


?>
