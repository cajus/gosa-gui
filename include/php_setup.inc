<?php
/*
 * This code is part of GOsa (http://www.gosa-project.org)
 * Copyright (C) 2003-2008 GONICUS GmbH
 *
 * ID: $$Id: php_setup.inc 20955 2011-07-27 07:33:04Z hickert $$
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


# LOad 
require_once("../include/constants.inc");


// Load available classes 
if(!isset($_SESSION['class_mapping'])){
    $class_mapping = get_classes("../");
}else{
    $class_mapping = $_SESSION['class_mapping'];
}

/*! \brief  A special gettext method which respects the plugins translation-catalog.
 *          Call to tr("") will translate the given string using the plugins messages.po 
 *          instead of the core message.po.
 */
function tr($str, $domain = NULL)
{   
    global $BASE_DIR;
    if($domain == NULL){
        $trace = debug_backtrace();
        if(preg_match("/^".preg_quote($BASE_DIR,'/')."\/plugins\//", $trace[0]['file'])){
            $domain = preg_replace("/^".preg_quote($BASE_DIR,'/')."\/plugins\/([^\/]*).*$/", "\\1", $trace[0]['file']);
            if($domain){
                return(dgettext($domain, $str));
            }
        }
        return(gettext($str));
    }else{
        return(dgettext($domain, $str));
    }
    
    return(tr($str));
}



function gosaRaiseError($errno, $errstr, $errfile, $errline)
{
  global $error_collector,$config, $error_collector_mailto;

  // To avoid recursion - restore original error handler.
  restore_error_handler();

  /* Return if error reporting is set to zero 
   * Also exclude statements prefixed with @ - Comment out the block below to see suppressed errors. 
   * e.g. @call_function_but_hide_errors()
   */
  if (error_reporting() == 0){
    set_error_handler('gosaRaiseError', E_WARNING |  E_NOTICE | E_USER_ERROR | E_USER_WARNING | E_USER_NOTICE | E_STRICT) ;
    return;
  }

  /* Workaround for buggy imap_open error outputs */
  if (preg_match('/imap_open/', $errstr)){
    set_error_handler('gosaRaiseError', E_WARNING |  E_NOTICE | E_USER_ERROR | E_USER_WARNING | E_USER_NOTICE | E_STRICT) ;
    return;
  }

  /* Hide ldap size limit messages */
  if (preg_match('/ldap_error/', $errstr)){
    if (preg_match('/sizelimit/', $errstr)){
      set_error_handler('gosaRaiseError', E_WARNING |  E_NOTICE | E_USER_ERROR | E_USER_WARNING | E_USER_NOTICE | E_STRICT) ;
      return;
    }
  }

  /* Error messages are hidden in GOsa, so we only send them to the logging class and abort here */
  if(isset($config->data) && $config->get_cfg_value("core","displayErrors") != "true"){

    /* Write to syslog */
    if(class_exists("log") && !preg_match("/No such object/",$errstr)){
      new log("view","error","",array(),"PHP error: $errstr ($errfile, line $errline)");
    }

    set_error_handler('gosaRaiseError', E_WARNING |  E_NOTICE | E_USER_ERROR | E_USER_WARNING | E_USER_NOTICE | E_STRICT) ;
    return;
  }
 
  /* Send all errors to logging class, except "Ldap : No such object" messages*/
  if(class_exists("log") && !preg_match("/No such object/",$errstr)){
    new log("debug","all",$errfile,array(),"Type:".$errno.", Message:".$errstr.", File:".$errfile.", Line: ".$errline);
  }

  // Log errors in usage DB
  if(class_exists('stats') && !preg_match("/No such object/",$errstr)){
      stats::log('error', $class = 'ERROR', $category = array(),  $action = __FUNCTION__, 
              $amount = 1, $duration = 0, $errno);
  }

  /* Create header as needed */
  if ($error_collector == ""){

    /* Mailto body header */
    if(function_exists("prepare4mailbody")){
      $version= "unknown";
      if(function_exists("get_gosa_version")){
	      $version= get_gosa_version();
      }
      $error_collector_mailto .=prepare4mailbody(
                                "Oups. Seems like you've catched some kind of bug inside GOsa/PHP. You may want to help ".
                                "us to improve the software stability. If so, please provide some more information below.".
                                "\n\n".
                                "*** GOsa bug report ***".
                                "\nGOsa Version: $version".
                                "\n\n".
                                "Please describe what you did to produce this error as detailed as possible. Can you ".
                                "reproduce this bug using the demo on http://www.gosa-project.org ?".
                                "\n\n".
                                "*** PHP error information ***\n\n");
      }
   
     
    if (class_exists('session') && session::is_set('js') && session::get('js')==FALSE){
      $error_collector= "<div>";
    } else {

        $warning_image = (is_callable('image')) ? 
            image('images/toolbar-warning.png') : "<image src='images/toolbar-warning.png' border=0>";
        $mailto_image = (is_callable('image')) ? 
            image('images/mailto.png') : "<image src='images/mailto.png' border=0>";

        $error_collector= "
        <table summary=\"\" class='error-collector'>
          <tr>
           <td style='width:32px'>{$warning_image}</td>
           <td><span>".tr("Generating this page caused the PHP interpreter to raise some errors!")."</span></td>
           <td align='right'>
            <a href=\"mailto:gosa-bugs@oss.gonicus.de?subject=GOsa%20bugreport&amp;body=%BUGBODY%\">
                {$mailto_image}&nbsp;".tr("Send bug report")."
            </a>
           </td>
           <td align='right'>
            <button onClick=\"$('errorbox').toggle();\">".tr("Toggle details")."</button>
            </td>
          </tr>
        </table>
        <div id='errorbox' style='position:absolute; z-index:150; display: none;'>";
    }
  }
 
  /* Create error header */
  $error_collector.= "<table summary=\"\" width=\"100%\" cellspacing=0 style='background-color:#402005;color:white;border:2px solid red'><tr><td colspan=3><h1 style='color:white'>".tr("PHP error")." \"$errstr\"</h1></td></tr>";

  $error_collector_mailto .= prepare4mailbody("=== Error === \n");
  $error_collector_mailto .= prepare4mailbody("PHP error: $errstr ($errfile, line $errline)\n");
  $error_collector_mailto .= prepare4mailbody("=== /Error === \n\n");
  
  /* Extract traceback data - if available */
  if (function_exists('debug_backtrace')){
    $trace= debug_backtrace();

    $error_collector_mailto .= prepare4mailbody("=== Trace ===");

    /* Generate trace history */
    for ($index= 0, $c= count($trace); $index<$c; $index++){


      $ct= $trace[$index];
      $loc= "";
      if (isset($ct['class'])){
        $loc.= tr("class")." ".$ct['class'];
        if (isset($ct['function'])){
          $loc.= " / ";
        }
      }
      if (isset($ct['function'])){
        $loc.= tr("function")." ".$ct['function'];
      }
      if (isset($ct['type'])){
        switch ($ct['type']){
          case "::":
            $type= tr("static");
          break;

          case "->":
            $type= tr("method");
          break;
        }
      } else {
        $type= "-";
      }
      $args= "";
      if (isset($ct['args'])){
        foreach ($ct['args'] as $arg){
       
          /* Avoid convertig object to string errors */ 
          if(is_object($arg)){
            $arg = "CLASS:&nbsp;".get_class($arg);
          }
  
          $args.= htmlentities("\"$arg\", ");
        }
      }
      $args= preg_replace("/, $/", "", $args);
      if ($args == ""){
        $args= "-";
      }
      if(isset($ct['file'])) {
        $file= $ct['file'];
      }else{
        $file="";
      }
      if(isset($ct['line'])) {
        $line= $ct['line'];
      }else{
        $line="";
      }
      $color= ($index&1)?'#404040':'606060';
      $error_collector.= "<tr style='background-color:$color'><td style='padding-left:20px' width=\"30%\">".tr("Traceback")."[$index]: $loc</td>";
      $error_collector.= "<td>".tr("File").": $file (".tr('Line')." $line)</td><td width=\"10%\">".tr("Type").": $type</td></tr>";
      $error_collector.= "<tr style='background-color:$color'><td colspan=3 style='padding-left:20px;'>".tr("Arguments").": $args</td></tr>";

      /* Add trace part to mailto body */
      $error_collector_mailto .= prepare4mailbody(
                                   "\nTrace[".$index."]:".$loc.
                                   "\nFile : ".$file.
                                   "\nLine : ".$line.
                                   "\nType : ".$type.
                                   "\n  ".$args.
                                   "\n");

    }
  }

  $error_collector_mailto .= prepare4mailbody("=== /Trace === \n");

  /* Close error table */
  $error_collector.= "</table>";

  /* Flush in case of fatal errors */
  set_error_handler('gosaRaiseError', E_WARNING |  E_NOTICE | E_USER_ERROR | E_USER_WARNING | E_USER_NOTICE | E_STRICT) ;
  if (preg_match('/^fatal/i', $errstr)){
    echo $error_collector."</div>";
    flush();
    exit;
  }
}


function prepare4mailbody($string)
{
  $string = html_entity_decode($string);

  $from = array(
                "/%/",
                "/ /",
                "/\n/",
                "/\r/",
                "/!/",
                "/#/",
                "/\*/",
                "/\//",
                "/</",
                "/>/",
                "/\?/",
                "/\"/");

  $to = array(
                "%25",
                "%20",
                "%0A",
                "%0D",
                "%21",
                "%23",
                "%2A",
                "%2F",
                "%3C",
                "%3E",
                "%3F",
                "%22");

  $string = preg_replace($from,$to,$string);

  return($string);
}

/* Function to include all class_ files starting at a given directory base */
function get_classes($folder= ".")
{
  static $base_dir= "";
  static $result= array();

  if ($base_dir == ""){
    if ($folder == "."){
      $base_dir= getcwd();
    } else {
      $base_dir= $folder;
    }
  }

  $currdir=getcwd();
  if ($folder){
    chdir("$folder");
  }

  $dh = opendir(".");
  while(is_resource($dh) && false !== ($file = readdir($dh))){

    if (preg_match("/.*\.svn.*/", $file) ||
        preg_match("/.*smarty.*/i",$file) ||
        preg_match("/.*\.tpl.*/",$file) ||
        ($file==".") ||($file =="..")){
      continue;
    }

    /* Recurse through all "common" directories */
    if (is_dir($file) && !file_exists("{$file}/excludeFromAutoLoad")){
      get_classes($file);
      continue;
    }

    /* Only take care about .inc and .php files... */
    if (!(preg_match('/\.php$/', $file) || preg_match('/\.inc$/', $file))){
      continue;
    }

    /* Include existing class_ files */
    $contents= file($file);
    foreach($contents as $line){
      $line= chop($line);
      if (preg_match('/^\s*class\s*\w.*$/', $line)){
        $class= preg_replace('/^\s*class\s*(\w+).*$/', '\1', $line);
        $result[$class]= preg_replace("%".BASE_DIR."[/]%", "", "$currdir/$folder/$file");
      }
    }
  }

  @closedir($dh);
  chdir($currdir);

  return ($result);
}


function dummy_error_handler()
{
}

/* Bail out for incompatible/old PHP versions */
if (!version_compare(phpversion(),"5.2.0",">=")){
  echo "PHP version needs to be 5.2.0 or above to run GOsa. Aborted.";
  exit();
}

/* Set timezone */
date_default_timezone_set("GMT");

/* Get base dir for reference */
$BASE_DIR= BASE_DIR;
$ROOT_DIR= $BASE_DIR."/html";
error_reporting (E_ALL | E_STRICT);

/* Register error handler */
$error_collector= "";
$error_collector_mailto= "";

set_error_handler('gosaRaiseError', E_WARNING |  E_NOTICE | E_USER_ERROR | E_USER_WARNING | E_USER_NOTICE | E_STRICT) ;

$variables_order= "ES";
ini_set("register_globals",0);
ini_set("track_vars",1);
ini_set("display_errors",1);
ini_set("report_memleaks",1);
ini_set("include_path",".:$BASE_DIR/include:$BASE_DIR/include/utils/excel:/usr/share/php");

/* Do smarty setup */
require(PATH_TO_SMARTY);
$smarty = new Smarty;
$smarty->template_dir = $BASE_DIR.'/ihtml/';
$smarty->caching= false;

// To be able to switch between smarty version 2/3                                                                      
if(defined('SMARTY_PHP_REMOVE')){                                                                                       
    $smarty->php_handling= SMARTY_PHP_REMOVE;                                                                           
}else{                                                                                                                  
    $smarty->php_handling= Smarty::PHP_REMOVE;                                                                          
}                                                                                                                       

// Register GOsa contributed smarty plugins
$d = opendir("$BASE_DIR/include/smartyAddons");
while($file = readdir($d)){
    if(preg_match("/\.php$/", $file)) require_once("$BASE_DIR/include/smartyAddons/{$file}");
}

//$smarty->setCaching(Smarty::CACHING_LIFETIME_CURRENT);
//$smarty->cache_dir = CACHE_DIR."/tmp/";

$smarty->registerPlugin("block", "tr", "smarty_block_tr");
$smarty->registerPlugin("block", "render", "smarty_block_render");
$smarty->registerPlugin("function", "msgPool", "smarty_function_msgPool");
$smarty->registerPlugin("function", "image", "smarty_function_image");
$smarty->registerPlugin("function", "factory", "smarty_function_factory");

/* Global FPDF define */
define('FPDF_FONTPATH', '/usr/share/php/fpdf/font/');

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
