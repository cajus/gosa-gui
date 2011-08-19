<?php
if ($remove_lock){
    if(session::is_set('ConfigManagement')){
        $macl = session::get('ConfigManagement');
        $macl->remove_lock();
    }
}

/* Remove this plugin from session
 */
if ( $cleanup ){
    session::un_set('ConfigManagement');
}else{

    /* Create ConfigManagement object on demand */
    if (!session::is_set('ConfigManagement')){
        $ConfigManagement= new ConfigManagement ($config, $ui);
        session::set('ConfigManagement',$ConfigManagement);
    }
    $ConfigManagement = session::get('ConfigManagement');
    $display= $ConfigManagement->save_object();
    $display= $ConfigManagement->execute();

    /* Reset requested? */
    if (isset($_GET['reset']) && $_GET['reset'] == 1){
        session::un_set ('ConfigManagement');
    }

    /* Show and save dialog */
    session::set('ConfigManagement',$ConfigManagement);
}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
