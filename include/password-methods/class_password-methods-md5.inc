<?php
/*
 * This code is part of GOsa (http://www.gosa-project.org)
 * Copyright (C) 2003-2008 GONICUS GmbH
 *
 * ID: $$Id: class_password-methods-md5.inc 15380 2010-01-27 14:03:19Z cajus $$
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

class passwordMethodMd5 extends passwordMethod
{
	function passwordMethodMd5($config)  
	{
	}


	function is_available()
	{
		if (function_exists('md5')){
			return(true);
		}else{
			return false;
		}
	}


	function generate_hash($pwd)
	{
		return  "{MD5}".base64_encode( pack('H*', md5($pwd)));
	}


  function get_hash_name()
  {
    return "md5";
  }

}

// vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
?>
