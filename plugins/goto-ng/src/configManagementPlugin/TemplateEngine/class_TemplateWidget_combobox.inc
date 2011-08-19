<?php

class TemplateWidget_combobox extends TemplateWidget
{
    function render()
    {
        $str = "";

        // Build up list data
        $disabled = (!$this->enabled || !$this->writeable)? "disabled" : "";
        $name = (!$this->enabled || !$this->writeable)? "dummy".rand(0,10000) : $this->postName;

        $str .= "<select size='1' name='{$name}' {$disabled}>";
        if($this->readable){
            foreach($this->values as $option => $value){
                if($option == $this->value){
                    $str .= "<option selected value=\"{$option}\">{$value}</option>\n";
                }else{
                    $str .= "<option value=\"{$option}\">{$value}</option>\n";
                }
            }
        }
        $str .= "</select>";
        return($str);
    }
}
?>
