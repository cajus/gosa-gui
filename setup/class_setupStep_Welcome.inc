<?php

/*
   This code is part of GOsa (https://gosa.gonicus.de)
   Copyright (C) 2007 Fabian Hickert

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/


class Step_Welcome  extends setup_step
{
  var $languages      = array();
  var $attributes     = array('instanceUUID');
  var $header_image   = "images/setup/welcome.png";

    var $instanceUUID = "";
    
  function Step_Welcome()
  {
    $this->is_enabled     = TRUE;
    $this->is_active      = TRUE;
    $this->update_strings(); 

    $this->instanceUUID = gen_uuid();
  }

  function update_strings()
  {
    $this->s_title      = tr("Welcome");
    $this->s_info       = tr("The welcome message");
    $this->s_title_long = tr("Welcome to the GOsa setup assistent");
  }
  
  function execute()
  {
    $smarty = get_smarty();
    $smarty->assign('auth_id', session_id());

    $smarty->assign("path",'/tmp/gosa.auth');
    return($smarty->fetch(get_template_path("setup_welcome.tpl",TRUE,dirname(__FILE__))));
  }

  function save_object()
  {
    $id = "";
    
    /* Get auth ID from file */
    $path = '/tmp/gosa.auth';
    if (file_exists($path) && is_readable($path)){
      $contents= file($path);
      $id= chop($contents[0]);
    }

    /* Continue if we've the correct ID */
    if ($id == session_id()){
      $this->is_completed = true;
    } else {
      $this->is_completed = false;
    }

  }
}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
