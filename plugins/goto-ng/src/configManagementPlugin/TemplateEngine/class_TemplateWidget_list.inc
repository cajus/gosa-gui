<?php

class TemplateWidget_list extends TemplateWidget
{
    function __construct(&$config, $name, $value, $description,$syntax,$required,$type,$display,$values)
    {
        if(!$value) $value =array();
        parent:: __construct($config, $name, $value, $description,$syntax,$required,$type,$display,$values);

        $this->listWidget= new sortableListing($this->value);
        $this->listWidget->setEditable(false);
        $this->listWidget->setDeleteable(true);
        $this->listWidget->setInstantDelete(true);
        $this->listWidget->setColspecs(array('*'));
        $this->listWidget->setWidth("100%");
        $this->listWidget->setHeight("70px");
        $this->listWidget->setAcl("");

        $acls = "";
        $acls.= ($this->writeable && $this->enabled) ? 'wdmc' : '';
        $acls.= ($this->readable) ? 'r' : '';
        $this->listWidget->setAcl($acls);
        $this->listWidget->setListData($this->value);
        $this->listWidget->update();
    }


    function render()
    {
        $str = $this->listWidget->render();
        $disabled = (!$this->enabled || !$this->writeable)? "disabled" : "";
        $name = (!$this->enabled || !$this->writeable)? "dummy".rand(0,10000) : $this->postName;

        $str .= "<input type='text' name='{$name}_Input' {$disabled}>";
        $str .= "<button name='{$name}_Add' {$disabled}>".msgPool::addButton()."</button>";
        return($str);
    }

    function save_object()
    {
        $this->listWidget->save_object();
        if(isset($_POST["{$this->postName}_Add"]) && isset($_POST["{$this->postName}_Input"])){
            $input = get_post("{$this->postName}_Input");
            if(!empty($input) && !empty($this->syntax) && !preg_match("/".$this->syntax."/", $input)){
                msg_dialog::displayChecks(array(msgPool::invalid($this->display, $input, "/".$this->syntax."/")));
            }elseif(!empty($input)){
                $this->listWidget->addEntry($input);
            }
        }

        $this->value = array_values($this->listWidget->getMaintainedData());
    }

    /*! \brief  Check the value entry using the provieded syntax.
     * @return  Array   Returns a list of errors
     */
    function check()
    {
        if($this->required && empty($this->value)){
            return(array(msgPool::required($this->display)));
        }
        return(array());
    }
}


?>
