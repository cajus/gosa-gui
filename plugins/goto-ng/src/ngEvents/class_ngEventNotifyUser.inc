<?php

/*
 * This code is part of GOsa (http://www.gosa-project.org)
 * Copyright (C) 2003-2011 GONICUS GmbH
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
 *
 */

/*!
 * \brief   This plugin allows to send notification messages to a set of users
 *          using the gosa-ng service.
 * \author  Fabian Hickert <hickert@gonicus.de>
 * \date    25.08.2011
 *
 * This is a GOsa plugin which renders a dialog to send notifations to users. 
 * These notifcation will be send to a gosa-ng service using rpc.
 *
 *  e.g.
 *      $d = ngEventNotifyUser($config);
 *      $d->setRecipients(['cajus', 'hickert']);
 *      $d->save_object();
 *      print $d->execute();
 *      ...
 *      $d->save_object();
 *      $d->send();
 *
 */
class ngEventNotifyUser extends plugin{

    private $recipientsArray = array();
    private $recipientsStr = "";
    private $title = "";
    private $message = "";
    private $urgency = "normal";
    private $urgencyList = array();
    private $timeout = 60;

    function __construct($config)
    {
        plugin::plugin($config, NULL);
        $this->urgencyList = array(
                "low" => tr("low"),
                "normal" => tr("normal"),
                "critical"=> tr("critical"));
    }


    /*! \brief      Checks the given input values.
     *  @return     Array   An array containing the error messages.
     */
    function check()
    {
        $messages = array();
        if(!preg_match("/^[1-9][0-9]*$/", $this->timeout)){
            $messages[] = msgPool::invalid(_("Timeout"));
        }
        if(empty($this->title)){
            $messages[] = msgPool::required(_("Title"));
        }
        if(empty($this->message)){
            $messages[] = msgPool::required(_("Message"));
        }

        return($messages);
    }
    

    /*! \brief  Sends the notification to the server using rpc.
     *  @return     Boolean True on success else false
     */
    function send()
    {
        // Check if the service is configured and connected
        $rpc = $this->config->getRpcHandle();
        if($rpc->isConfigured() || !$rpc->isConnected()){
            msg_dialog::display(_("Error"), msgPool::rpcError($rpc->get_error()), ERROR_DIALOG);
            return(FALSE);
        }

        // Initiate the request
        $res = $rpc->notifyUser($this->recipientsArray, $this->title, $this->message, intval($this->timeout));
        if(!$rpc->success()){
            msg_dialog::display(_("Error"), msgPool::rpcError($rpc->get_error()), ERROR_DIALOG);
            return(FALSE);
        }else{
            return(TRUE);
        }
    }


    /*! \brief  Sets a new list of recipients.
     *  @param  $users  A list of target user-ids. 
     */
    function setRecipients($users)
    {
        $this->recipientsArray = $users;
        $this->recipientsArray = array_unique($this->recipientsArray);
        $this->recipientsStr = implode($this->recipientsArray, ", "); 
    }


    /*! \brief  Generates the HTML output for this plugin.
     *  @return String  HTML content.  
     */
    function execute()
    {
        $smarty = get_smarty();
        $smarty->assign("recipients", $this->recipientsStr);
        $smarty->assign("title", $this->title);
        $smarty->assign("message", $this->message);
        $smarty->assign("urgencyList", $this->urgencyList);
        $smarty->assign("urgency", $this->urgency);
        $smarty->assign("timeout", $this->timeout);
        return($smarty->fetch(get_template_path('ngEventNotifyUser.tpl', TRUE, dirname(__FILE__))));
    }


    /*! \brief  Checks POST values for relevant information.
     */
    function save_object()
    {
        if(isset($_POST['recipients'])){
            $this->setRecipients(preg_split("/[\s]*,[\s]*/", get_post('recipients'),-1, PREG_SPLIT_NO_EMPTY));
        }
        if(isset($_POST['timeout'])) $this->timeout = get_post('timeout');
        if(isset($_POST['title'])) $this->title = get_post('title');
        if(isset($_POST['message'])) $this->message = get_post('message');
    }
}

?>
