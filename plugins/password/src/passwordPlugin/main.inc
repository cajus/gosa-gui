<?php
/*
 * This code is part of GOsa (http://www.gosa-project.org)
 * Copyright (C) 2003-2008 GONICUS GmbH
 *
 * ID: $$Id: main.inc 13288 2008-12-12 14:54:13Z hickert $$
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


/* Remove locks created by this plugin 
*/
$lock_msg="";
if ($remove_lock){
  if(session::is_set('password')){
    session::un_set('password');
  }
}

/* Remove this plugin from session 
*/
if ( $cleanup ){
  session::un_set('password');
  session::un_set('edit');
}else{

  /* Reset requested? */
  if (isset($_POST['edit_cancel'])){
    session::un_set ('edit');
    session::un_set ('password');
  }

  /* Create password object on demand */
  if (!session::is_set('password') || (isset($_GET['reset']) && $_GET['reset'] == 1)){
    session::set('password', new password ($config, $ui->dn));
  }
  $password = session::get('password');

  /* Execute formular */
  $display.= $password->execute ();

}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
