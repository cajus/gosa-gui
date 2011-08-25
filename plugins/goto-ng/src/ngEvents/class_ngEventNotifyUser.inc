<?php

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

    function check()
    {
        $messages = array();
        return($messages);
    }
    

    function send()
    {
        $rpc = $this->config->getRpcHandle();
        $res = $rpc->notifyUser($this->recipientsArray, $this->title, $this->message, $this->timeout);
        if(!$rpc->success()){
            msg_dialog::display(_("Error"), msgPool::rpcError($rpc->get_error()), ERROR_DIALOG);
            return(FALSE);
        }else{
            return(TRUE);
        }
    }

    function setRecipients($users, $groups)
    {
        $this->recipientsArray = $users;
        $this->recipientsArray = array_unique($this->recipientsArray);
        $this->recipientsStr = implode($this->recipientsArray, ", "); 
        if(count($groups)) print "Groups are not yet supported!";
    }

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

    function save_object()
    {
        if(isset($_POST['recipients'])){
            $this->recipientsArray = preg_split("/[\s]*,[\s]*/", get_post('recipients'),-1, PREG_SPLIT_NO_EMPTY);
            $this->recipientsArray = array_unique($this->recipientsArray);
            $this->recipientsStr = implode($this->recipientsArray, ", "); 
        }
        if(isset($_POST['timeout'])) $this->timeout = get_post('timeout');
        if(isset($_POST['title'])) $this->title = get_post('title');
        if(isset($_POST['message'])) $this->message = get_post('message');
    }
}

?>
