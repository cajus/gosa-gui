<?php

class TemplateWidget_stringLong extends TemplateWidget
{
    function render()
    {
        $desc = set_post($this->description);
        $value = ($this->readable) ? set_post($this->value) : "";
        
        $name = " name=\"{$this->postName}\" ";
        $value = " value=\"{$value}\" ";
        $title = (empty($this->description))?"": " title=\"{$desc}\"";
        
        $disabled = (!$this->enabled || !$this->writeable)? "disabled" : "";
        $name = (!$this->enabled || !$this->writeable)? "dummy".rand(0,10000) : $name;
        return("<input type='text' style='width:100%;' {$title} {$name} {$value} {$disabled}>");
    }
}

?>
