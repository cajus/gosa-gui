<?php

class TemplateWidget_textarea extends TemplateWidget
{
    function render()
    {
        $title = set_post($this->description);

        $disabled = (!$this->enabled || !$this->writeable)? "disabled" : "";
        $name = (!$this->enabled || !$this->writeable)? "dummy".rand(0,10000) : $this->postName;
    
        $value = ($this->readable) ? $this->value : "";
        return("<textarea   title=\"{$title}\"
                            style='width:100%'
                            {$disabled} 
                            rows=4 type='text' 
                            name=\"{$name}\">".set_post($value)."</textarea>");
    }

}

?>
