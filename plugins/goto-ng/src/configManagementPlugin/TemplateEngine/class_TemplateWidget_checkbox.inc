<?php

class TemplateWidget_checkbox extends TemplateWidget
{
    function render()
    {
        $disabled = (!$this->enabled || !$this->writeable)? "disabled" : "";
        $name = (!$this->enabled || !$this->writeable)? "dummy".rand(0,10000) : $this->postName;

        $str = "";
        $str .= "<input type='checkbox' value='1' name='{$name}' {$disabled}";
        if($this->value && $this->readable) $str .= " checked ";
        $str .= ">";

        $str .= "<input type='hidden' name='{$name}_posted' value='1'>";
        return($str);
    }

    function save_object()
    {
        if(isset($_POST["{$this->postName}_posted"])){
            $this->value = isset($_POST[$this->postName]);
        }
    }
}
?>
