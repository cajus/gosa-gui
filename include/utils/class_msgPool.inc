<?php
define ("LDAP_READ",   1);
define ("LDAP_ADD",    2);
define ("LDAP_MOD",    3);
define ("LDAP_DEL",    4);
define ("LDAP_SEARCH", 5);
define ("LDAP_AUTH",   6);

/*! \brief Some common needed messages */ 
class msgPool
{

  public static function deleteInfo($name= "",$type = "")
  {
    if ($name == "") { 
      if($type == ""){
        return (tr("This object will be deleted!"));
      }else{
        return (sprintf(tr("This %s object will be deleted!"), bold($type)));
      }
    }
    if (!is_array($name)){
      if($type == ""){
        return (sprintf(tr("This object will be deleted: %s"), "<br><br>$name"));
      }else{
        return (sprintf(tr("This %s object will be deleted: %s"), bold($type), "<br><br>$name"));
      }
    }
    if (count($name) == 1){
      if($type == ""){
        return (tr("This object will be deleted:")."<br>".msgPool::buildList($name));
      }else{
        return (sprintf(tr("This %s object will be deleted:"), bold($type)). "<br>".msgPool::buildList($name));
      }
    }
    if($type == ""){
      return (sprintf(tr("These objects will be deleted: %s"), "<br><br>".msgPool::buildList($name)));
    }else{
      return (sprintf(tr("These %s objects will be deleted: %s"), bold($type), "<br>".msgPool::buildList($name)));
    }
  }


  public static function permDelete($name= "")
  {
    if ($name == "") { 
      return (tr("You have no permission to delete this object!"));
    }

    if (!is_array($name)){
      return (tr("You have no permission to delete the object:")."<br><br>$name");
    }

    if (count($name) == 1){
      return (tr("You have no permission to delete the object:")."<br>".msgPool::buildList($name));
    }

    return (tr("You have no permission to delete these objects:")."<br>".msgPool::buildList($name));
  }


  public static function permCreate($name= "")
  {
    if ($name == "") { 
      return (tr("You have no permission to create this object!"));
    }

    if (!is_array($name)){
      return (tr("You have no permission to create the object:")."<br><br>$name");
    }

    if (count($name) == 1){
      return (tr("You have no permission to create the object:")."<br>".msgPool::buildList($name));
    }

    return (tr("You have no permission to create these objects:")."<br>".msgPool::buildList($name));
  }


  public static function permModify($name= "")
  {
    if ($name == "") { 
      return (tr("You have no permission to modify this object!"));
    }

    if (!is_array($name)){
      return (tr("You have no permission to modify the object:")."<br><br>$name");
    }

    if (count($name) == 1){
      return (tr("You have no permission to modify the object:")."<br>".msgPool::buildList($name));
    }

    return (tr("You have no permission to modify these objects:")."<br>".msgPool::buildList($name));
  }


  public static function permView($name= "")
  {
    if ($name == "") { 
      return (tr("You have no permission to view this object!"));
    }

    if (!is_array($name)){
      return (tr("You have no permission to view the object:")."<br><br>$name");
    }

    if (count($name) == 1){
      return (tr("You have no permission to view the object:")."<br>".msgPool::buildList($name));
    }

    return (tr("You have no permission to view these objects:")."<br>".msgPool::buildList($name));
  }


  public static function permMove($name= "")
  {
    if ($name == "") { 
      return (tr("You have no permission to move this object!"));
    }

    if (!is_array($name)){
      return (tr("You have no permission to move the object:")."<br><br>$name");
    }

    if (count($name) == 1){
      return (tr("You have no permission to move the object:")."<br>".msgPool::buildList($name));
    }

    return (tr("You have no permission to move these objects:")."<br>".msgPool::buildList($name));
  }


  public static function dbconnect($name, $error= "", $dbinfo= "")
  {
    if ($error != ""){
      $error= "<br><br>".tr("Error").": ".bold($error);
    }
    if ($dbinfo != ""){
      $error.= "<br><br>".tr("Connection information").": ".bold($dbinfo);
    }
    return (sprintf(tr("Cannot connect to %s database!"), bold($name)).$error);
  }


  public static function dbselect($name, $error= "", $dbinfo= "")
  {
    if ($error != ""){
      $error= "<br><br>".tr("Error").": ".bold($error);
    }
    if ($dbinfo != ""){
      $error.= "<br><br>".tr("Connection information").": ".bold($dbinfo);
    }
    return (sprintf(tr("Cannot select %s database!"), bold($name)).$error);
  }


  public static function noserver($name)
  {
    return (sprintf(tr("No %s server defined!"), bold($name)));
  }


  public static function dbquery($name, $error= "", $dbinfo= "")
  {
    if ($error != ""){
      $error= "<br><br>".tr("Error").": ".bold($error);
    }
    if ($dbinfo != ""){
      $error.= "<br><br>".tr("Connection information").": ".bold($dbinfo);
    }
    return (sprintf(tr("Cannot query %s database!"), bold($name)).$error);
  }


  public static function reserved($name)
  {
    return (sprintf(tr("The field %s contains a reserved keyword!"), bold($name)));
  }


  public static function cmdnotfound($type, $plugin)
  {
    return (sprintf(tr("Command specified as %s hook for plugin %s does not exist!"), bold($type), bold($plugin)));
  }


  public static function cmdinvalid($type, $command = "",$plugin="")
  {
    if(empty($command)){
      return (sprintf(tr("%s command is invalid!"), bold($type)));
    }elseif($command != "" && $plugin != ""){
      return (sprintf(tr("%s command (%s) for plugin %s is invalid!"), bold($type), bold($command) ,bold($plugin)));
    }elseif($plugin != "" && $command =""){
      return (sprintf(tr("%s command for plugin %s is invalid!"), bold($type), bold($plugin)));
    }else{
      return (sprintf(tr("%s command (%s) is invalid!"), bold($type), bold($command)));
    }
  }


  public static function cmdexecfailed($type, $command = "",$plugin="")
  {
    if(empty($command)){
      return (sprintf(tr("Cannot execute %s command!"), bold($type)));
    }elseif($command != "" && $plugin != ""){
      return (sprintf(tr("Cannot execute %s command (%s) for plugin %s!"), bold($type), bold($command), bold($plugin)));
    }elseif($plugin != "" && $command =""){
      return (sprintf(tr("Cannot execute %s command for plugin %s!"), bold($type), bold($plugin)));
    }else{
      return (sprintf(tr("Cannot execute %s command (%s)!"), bold($type), bold($command)));
    }
  }


  public static function toobig($name, $min= "")
  {
    if ($min == ""){
      return (sprintf(tr("Value for %s is too large!"), bold($name)));
    } else {
      return (sprintf(tr("%s must be smaller than %s!"), bold($name), bold($min)));
    }
  }


  public static function toosmall($name, $min= "")
  {
    if ($min == ""){
      return (sprintf(tr("Value for %s is too small!"), bold($name)));
    } else {
      return (sprintf(tr("%s must be %s or above!"), bold($name), bold($min)));
    }
  }


  public static function depends($name1, $name2)
  {
    return (sprintf(tr("%s depends on %s - please provide both values!"), bold($name1), bold($name2)));
  }


  public static function duplicated($name)
  {
    return (sprintf(tr("There is already an entry with this %s attribute in the system!"), bold($name)));
  }


  public static function required($name)
  {
    return (sprintf(tr("The required field %s is empty!"), bold($name)));
  }


  public static function invalid($name, $data= "", $regex= "", $example= "")
  {
    /* Stylize example */
    if ($example != ""){
      $example= "<br><br>".tr("Example").": ".bold($example);
    }

    /* If validChars are posted, take data and paint all invalid
       characters... */
    if ($regex) {
      $result= "";
      $mismatch= "";

      mb_internal_encoding('UTF-8');
      for($i=0; $i<=mb_strlen($data);$i++){
        $currentChar= mb_substr($data, $i,1);
        if (preg_match("$regex", $currentChar)){
          $result.= $currentChar;
        } else {
          $result.= "<font style='color:red;text-decoration:underline;'>".($currentChar)."</font>";
          $mismatch.= $currentChar;
        }
      }

      return sprintf(tr("The Field %s contains invalid characters"), bold($name)).". ".
        (strlen($mismatch)==1?sprintf(tr("%s is not allowed:"), bold($mismatch)):sprintf(tr("%s are not allowed!"), bold($mismatch))).
        "<br><br> \"$result\"$example";
    } else {
      return sprintf(tr("The Field %s contains invalid characters!"), bold($name))."!$example";
    }
  }


  public static function missingext($name)
  {
    return sprintf(tr("Missing %s PHP extension!"), bold($name));
  }


  public static function cancelButton()
  {
    return sprintf(tr("Cancel"));
  }


  public static function okButton()
  {
    return sprintf(tr("OK"));
  }


  public static function applyButton()
  {
    return sprintf(tr("Apply"));
  }


  public static function saveButton()
  {
    return sprintf(tr("Save"));
  }


  public static function addButton($what= "")
  {
    return $what == "" ? sprintf(tr("Add")): sprintf(tr("Add %s"), $what);
  }


  public static function delButton($what= "")
  {
    return $what == "" ? sprintf(tr("Delete")): sprintf(tr("Delete %s"), $what);
  }


  public static function setButton($what= "")
  {
    return $what == "" ? sprintf(tr("Set")): sprintf(tr("Set %s"), $what);
  }


  public static function editButton($what= "")
  {
    return $what == "" ? sprintf(tr("Edit...")): sprintf(tr("Edit %s..."), $what);
  }


  public static function backButton($what= "")
  {
    return tr("Back");
  }


  public static function buildList($data)
  {
    $objects= "<ul class='object-list'>";
    foreach ($data as $key => $value){
      if (is_numeric($key)){
        $objects.= "<li>\n".LDAP::makeReadable($value)."</li>";
      } else {
        $objects.= "<li>\n$value <span>".LDAP::makeReadable($key)."</span></li>";
      }
    }
    $objects.= "</ul>";
    return($objects);
  }

  public static function noValidExtension($name)
  {
    return sprintf(tr("This account has no valid %s extensions!"), bold($name));
  }

  public static function featuresEnabled($name, $depends= "")
  {
    if ($depends == ""){
      return sprintf(tr("This account has %s settings enabled. You can disable them by clicking below."), bold($name));
    } else {
      if (count($depends) == 1){
        return sprintf(tr("This account has %s settings enabled. To disable them, you'll need to remove the %s settings first!"), bold($name), bold($depends));
      } else {
        $deps= "";
        foreach ($depends as $dep){
          $deps.= "$dep / ";
        }
        $deps= preg_replace("/ \/ $/", "", $deps);
        return sprintf(tr("This account has %s settings enabled. To disable them, you'll need to remove the %s settings first!"), bold($name), bold($deps));
      }
    }
  }


  public static function featuresDisabled($name, $depends= "")
  {
    if ($depends == ""){
      return sprintf(tr("This account has %s settings disabled. You can enable them by clicking below."), bold($name));
    } else {
      if (count($depends) == 1){
        return sprintf(tr("This account has %s settings disabled. To enable them, you'll need to add the %s settings first!"), bold($name), bold($depends));
      } else {
        $deps= "";
        foreach ($depends as $dep){
          $deps.= "$dep / ";
        }
        $deps= preg_replace("/ \/ $/", "", $deps);
        return sprintf(tr("This account has %s settings disabled. To enable them, you'll need to add the %s settings first!"), bold($name), bold($deps));
      }
    }
  }


  public static function addFeaturesButton($name)
  {
    return sprintf(tr("Add %s settings"), $name);
  }


  public static function removeFeaturesButton($name)
  {
    return sprintf(tr("Remove %s settings"), $name);
  }


  public static function clickEditToChange()
  {
    return tr("Click the 'Edit' button below to change informations in this dialog");
  }


  public static function months()
  {
    return array(tr("January"), tr("February"), tr("March"), tr("April"),
        tr("May"), tr("June"), tr("July"), tr("August"), tr("September"),
        tr("October"), tr("November"), tr("December"));
  }


  public static function weekdays()
  {
    return array( tr("Sunday"), tr("Monday"), tr("Tuesday"), tr("Wednesday"), tr("Thursday"), tr("Friday"), tr("Saturday"));
  }


  public static function mysqlerror($error,  $plugin= "")
  {
    /* Assign headline depending on type */
    $headline= tr("MySQL operation failed!");
    return $headline."<br><br>".tr("Error").": ".bold($error);
  }


  public static function ldaperror($error, $dn= "", $type= 0, $plugin= "")
  {
    /* Assign headline depending on type */
    $typemap= array(1 => tr("read operation"), tr("add operation"), tr("modify operation"),
        tr("delete operation"), tr("search operation"), tr("authentication"));

    if (isset($typemap[$type])){
      $headline= sprintf(tr("LDAP %s failed!"), bold($typemap[$type]));
    } else {
      $headline= tr("LDAP operation failed!");
    }

    /* Fill DN information */
    $dn_info="";
    if ($dn != ""){
      $dn_info= "<br><br>".tr("Object").": ".bold(LDAP::fix($dn));
    }

    return $headline.$dn_info."<br><br>".tr("Error").": ".bold($error);
  }


  public static function incorrectUpload($reason= "")
  {
    if ($reason == ""){
      return tr("Upload failed!");
    }

    return sprintf(tr("Upload failed: %s"), "<br><br>".bold($reason));
  }


  public static function siError($error= "")
  {
    if ($error == ""){
      return tr("Communication failure with the infrastructure service!");
    }
    return sprintf(tr("Communication failure with the infrastructure service: %s"), "<br><br>".$error);
  }


  public static function rpcError($error= "")
  {
    if ($error == ""){
      return tr("Communication failure with the GOsa-NG service!");
    }
    return sprintf(tr("Communication failure with the GOsa-NG service: %s"), "<br><br>".$error);
  }


  public static function stillInUse($type, $objects= array())
  {
    if (!is_array($objects)){
      return sprintf(tr("This %s is still in use by this object: %s"), bold($type), "<br><br>".$objects);
    }
    if (count($objects) == 1){
      return sprintf(tr("This %s is still in use by this object: %s"), bold($type), "<br>".msgPool::buildList($objects));
    }
    if (count($objects) == 0){
      return sprintf(tr("This %s is still in use."), bold($type));
    }
    return sprintf(tr("This %s is still in use by these objects: %s"), bold($type), "<br>".msgPool::buildList($objects));
  }


  public static function fileDoesNotExist($file)
  {
    return sprintf(tr("File %s does not exist!"), bold($file));
  }


  public static function cannotReadFile($file)
  {
    return sprintf(tr("Cannot open file %s for reading!"), bold($file));
  }


  public static function cannotWriteFile($file)
  {
    return sprintf(tr("Cannot open file %s for writing!"), bold($file));
  }


  public static function invalidConfigurationAttribute($attr)
  {
    return sprintf(tr("The value for %s is currently unconfigured or invalid, please check your configuration file!"), bold($attr));
  }


  public static function cannotDeleteFile($file)
  {
    return sprintf(tr("Cannot delete file %s!"), bold($file));
  }


  public static function cannotCreateFolder($path)
  {
    return sprintf(tr("Cannot create folder %s!"), bold($path));
  }


  public static function cannotDeleteFolder($path)
  {
    return sprintf(tr("Cannot delete folder %s!"), bold($path));
  }


  public static function checkingFor($what)
  {
    return sprintf(tr("Checking for %s support"), bold($what));
  }


  public static function installPhpModule($what)
  {
    return sprintf(tr("Install and activate the %s PHP module."), bold($what));
  }


  public static function class_not_found($plugin)
  {
    return (sprintf(tr("Cannot initialize class %s! Maybe there is a plugin missing in your gosa setup?"), bold($plugin)));
  }


  public static function check_base()
  {
    return tr("The supplied base is not valid and has been reset to its previous value!");
  }

}
// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
