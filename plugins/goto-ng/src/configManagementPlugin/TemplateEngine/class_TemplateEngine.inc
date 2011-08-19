<?php

/*! \brief  A template engine used to render dynamic template
 *           for the GOsa-devices.
 */
class TemplateEngine
{
    private $config;
    private $data = array();    
    private $template = "";
    private $itemType = '';
    private $widgets = array();
    private $hasWriteAcls = FALSE;

    /*! \brief  Constructs the template engine. 
     *  @param  Config  The GOsa configuration object.
     */
    function __construct($config)
    {
        $this->config = &$config;
    }


    /*! \brief  Load/Sets the instruction-set to use for the current
     *           device configuration.
     *          A device configruation tells us what options 
     *           an item can have and what children.
     *  @param  Array   The instruction set to use.
     */
    function load($array)
    {
        $this->data = $array;
    }


    /*! \brief  Set the template which will be used to generate 
     *           the HTML content for this configuration session.
     *  @param  String  A template filename.
     */
    function setTemplate($tmpl)
    {
        $this->template = $tmpl;
    }

    
    /*! \brief  Returns the list of widgets which are currently used 
     *           by the template engine to render the plugin.
     *  @return Array  A list of widgets.
     */
    function getWidgets()
    {
        return($this->widgets);
    }     

    function getItemType()
    {
        return($this->itemType);
    }
   
    
    function editItem($type, $values, $acls = array())
    {
        $this->is_new = FALSE;
        $this->setAcls($acls);
        $this->setValues($type, $values);
    }
 

    function createItem($type, $values, $acls = array())
    {
        $this->is_new = TRUE;
        $this->setAcls($acls);
        $this->setValues($type, $values);
    }

    
    function setAcls($acls)
    {
        $this->acls = $acls;
        $this->hasWriteAcls = preg_match("/w/", implode($acls));
    }
 

    /*! \brief  Sets the current item type we want to render
     *          E.g.  'KickstartTemplate' and the corresponding values.
     *
     *  @param  String  The name of the item we want to render now.
     *  @param  Array   The initial value.
     */
    function setValues($name, $values)
    {
        // Set the current item type and reset the widget list.
        $this->itemType = $name;
        $this->widgets = array();

        // Do nothing if something seems to be wrong. 
        if(!isset($this->data[$this->itemType])){
            echo "Undefined item type '{$name}'!<br>";
            return;
        }

        // Get the options provided by the item and create widget for them.
        $data = $this->data[$this->itemType];
        if(isset($data['options']) && count($data['options'])){
            foreach($data['options'] as $name => $item){
                $widgetClassName = "TemplateWidget_{$item['type']}";

                // Check if the widget is available, if it is not, use a default (string).
                if(!class_available($widgetClassName)){
                    echo "Unknown widget class {$widgetClassName}! Falling back to default widget.<br>";
                    $widgetClassName = "TemplateWidget_string";
                }

                // Prepare the value for the widget 
                if(!isset($values[$name])) $values[$name] = $item['default'];

                $value = $values[$name];
                $syntax = (isset($item['syntax']))? $item['syntax']: "";
                $providedValues = (isset($item['values']))? $item['values']: array();
   
                // Get acl definition
                if(isset($this->acls[$name])) {
                    $acl = $this->acls[$name];
                }else{
                    print "<br> No ACL definition for '{$name}'.";
                    $acl = "";
                }

                // Create the new widget.
                $this->widgets[$name] = new $widgetClassName($this->config, $name, 
                        $value,
                        $item['description'],
                        $syntax,
                        $item['required'],
                        $item['type'],
                        $item['display'],
                        $providedValues); 
               
                // Get Permissions 
                $writeable = preg_match("/w/", $acl);
                $readable = preg_match("/r/", $acl);

                // Check if we've to disable this item.
                if(isset($item['disable']) && $item['disable'] || 
                        (isset($item['initiallyEditableOnly']) && $item['initiallyEditableOnly'] && !$this->is_new)){
                    $writeable = FALSE;
                }

                // Set ACls 
                $this->widgets[$name]->setWriteable($writeable);
                $this->widgets[$name]->setReadable($readable);
            }
        }
    }

    
    function execute(){
        return($this->render());
    }
    

    /*! \brief  Creates the HTML content for the given list of widgets
     *  @return String  The HTML content.
     */
    function render()
    {
        $smarty = get_smarty();
        $smarty->assign("type", $this->itemType);
        $smarty->assign("hasWriteAcls", $this->hasWriteAcls);
        $smarty->assign("typeData", $this->data[$this->itemType]);

        // Tell smarty the HTML-content for each widget and the name that should be
        //  displayed.
        foreach($this->widgets as $widget){
            $smarty->assign($widget->getName(), $widget->render());
            $smarty->assign($widget->getName()."Name", $widget->getDisplayName());
        }
        $template = $smarty->fetch(get_template_path("goto/Config/{$this->template}", TRUE));

        $smarty->assign('template', $template);
        return($smarty->fetch(get_template_path("TemplateEngine/TemplateEngine.tpl", TRUE)));
    }


    /*! \brief  Keep track of posted values.
     */
    function save_object()
    {
        foreach($this->widgets as $widget){
            if($widget->isEnabled() && $widget->isWriteable()){
                $widget->save_object();
            }
        }
    }


    /*! \brief  Check widget values and return a list of errors.
     */
    function check()
    {
        $msgs = array();
        foreach($this->widgets as $widget){
            $msgs = array_merge($msgs, $widget->check());
        }
        return($msgs);
    }
}


?>
