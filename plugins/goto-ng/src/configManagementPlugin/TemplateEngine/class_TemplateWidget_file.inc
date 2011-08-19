<?php

class TemplateWidget_file extends TemplateWidget
{
    /*! \brief  Constructs the template widget and sets the default values.
     *  @param  Config  The GOsa configuration object.
     *  @param  String  A name for the widget.
     *  @param  String  The initial value.
     *  @param  String  A description.
     *  @param  String  True/False  Must-Value/Optional-Value.
     *  @param  String  The widget type.
     *  @param  String  A display name for the widget.
     */
    function __construct(&$config, $name, $value, $description,$syntax,$required,$type,$display, $values=array())
    {
        $value = base64_decode($value);
        TemplateWidget::__construct($config, $name, $value, $description,$syntax,$required,$type,$display, $values);
    }


    /*! \brief  Returns the current value.
     *  @return  Mixed  The widgets value.
     */
    function getValue()
    {
        return(base64_encode($this->value));
    }


    function render()
    {
        $disabled = (!$this->enabled || !$this->writeable)? "disabled" : "";
        $name = (!$this->enabled || !$this->writeable)? "dummy".rand(0,10000) : $this->postName;

        $title = set_post($this->description);  
        if(mb_strlen($this->value) == 0){   
            $ret = "<i>".tr("No file uploaded yet")."</i>";
            $ret.= "<br> <input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"2000000\">
                <input id=\"{$name}\" 
                name=\"{$name}\" 
                {$disabled}
                type=\"file\" 
                size=\"20\" 
                maxlength=\"255\" 
                accept=\"*.*\">&nbsp;";
            $ret.= "<button {$disabled} name='{$name}_Upload'>".tr("Upload")."</button>";
        }else{
            $ret = "<i>".tr("File uploaded").": ".mb_strlen($this->value)." ".tr("Bytes");
            $ret.= "&nbsp;<button {$disabled} name='{$name}_Remove'>".msgPool::delButton()."</button>";
        }
        return($ret);
    }

    function save_object()
    {
        if(isset($_POST["{$this->postName}_Upload"]) && isset($_FILES[$this->postName]['tmp_name'])){
            $this->value = file_get_contents(gosa_file_name($_FILES[$this->postName]['tmp_name']));
        }
        if(isset($_POST["{$this->postName}_Remove"])) $this->value ="";
    }
}

?>
