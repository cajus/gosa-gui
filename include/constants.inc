<?php

define ("BASE_DIR", dirname(dirname(__FILE__)));
define ("CONFIG_TEMPLATE_DIR", "../contrib");
define ("PATH_TO_SMARTY", BASE_DIR."/include/smarty/Smarty.class.php");
define ("LOCALE_DIR", dirname(dirname(__FILE__))."/locale");
define ("CACHE_DIR", "/var/cache/gosa");
define ("TEMP_DIR","/var/cache/gosa/tmp");

//// For packaging use ...
// 
// define ("BASE_DIR", dirname(dirname(__FILE__)));
// define ("LOCALE_DIR", dirname(dirname(__FILE__))."/locale");
// if (file_exists("/usr/share/php/smarty3/Smarty.class.php")){
//     define("SMARTY_PATH", "/usr/share/php/smarty3/Smarty.class.php");
// } else {
//     defined("SMARTY_PATH", "/usr/share/php/smarty3/libs/Smarty.class.php");
// }
// define ("CONFIG_TEMPLATE_DIR", "/usr/share/doc/gosa");
// define ("CACHE_DIR", "/var/cache/gosa");
// define ("TEMP_DIR","/var/cache/gosa/tmp");

?>
