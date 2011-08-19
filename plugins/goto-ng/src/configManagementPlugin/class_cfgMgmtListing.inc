<?php

class cfgMgmtListing extends listing{

    function renderNavigation()
    {
        $result= array();
        $enableBack = true;
        $enableRoot = true;
        $enableHome = true;

        $listhead ="";
        $enableHome = false;

        /* Draw root button */
        $result["ROOT"]= image('images/lists/root.png', 'ROOT', tr("Root"));
        $result["BACK"]= image('images/lists/back.png', 'BACK', tr("Go to preceding level"));
        $result["HOME"]= image('images/lists/home.png', 'HOME', tr("Go to current users level"));
        $result["RELOAD"]= image('images/lists/reload.png', 'REFRESH', tr("Reload list"));

        return ($result);
    }



}

?>
