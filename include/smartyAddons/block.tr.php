<?php
require_once(SMARTY_PLUGINS_DIR . 'block.t.php');
function smarty_block_tr($params, $text, &$smarty)
{
    $plugin = "";
    if(!isset($params['domain'])){
        if(strlen($text) != 0){
            $trace = debug_backtrace();
            $base = preg_replace("/\/html/","",getcwd());
            foreach($trace as $t_entry){
                if(preg_match("/^".preg_quote($base,'/')."\/plugins\//", $t_entry['file'])){
                    $plugin = preg_replace("/^".preg_quote($base,'/')."\/plugins\/([^\/]*).*$/", "\\1", $t_entry['file']);
                    break;
                }
            }
        }
    }
   
    if($plugin != ""){ 
        $params['domain'] = $plugin;
    }
    return("*".smarty_block_t($params, $text, $smarty));
}

?>
