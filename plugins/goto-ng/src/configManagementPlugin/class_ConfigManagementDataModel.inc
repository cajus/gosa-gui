<?php

class ConfigManagementDataModel
{
    public $data = array();
    public $typeToPath = array();
    public $idToPath = array();
    public $dnToPath = array();
    public $config = NULL;

    function __construct($config)
    {
        $this->config = &$config;
        $this->data = array();
        $this->data['linear'] = array();
        $this->data['recursive'] = array();
        $this->addItem('root', '','root', array());
    }

    function getDataModel()
    {
        return($this->data);
    }

    function moveItem($from, $to)
    {
        // Get source entries
        $itemFrom = &$this->data['linear'][$from];
        $parentFrom = &$this->data['linear'][$itemFrom['parentPath']];

        // Extract 'to' informations out of the path. 
        $name = preg_replace("/^.*\//","", $to);
        $toParentPath = preg_replace("/\/[^\/]*$/","", $to);
        $parentTo = &$this->data['linear'][$toParentPath];
        $parentToDn = $parentTo['dn'];
        $dn = rtrim("cn={$name},{$parentToDn}",',');

        // Append the 'from' entry to the 'to' parent children. 
        $parentTo['children'][$to] = $parentFrom['children'][$from];
        $parentTo['children'][$to]['path']= $to;
        $parentTo['children'][$to]['name']= $name;
        $parentTo['children'][$to]['dn']= $dn;

        // Unset the source path
        unset($parentFrom['children'][$from]);
        unset($this->data['linear'][$from]);

        // Append the linear entry.
        $this->data['linear'][$to] = &$parentTo['children'][$to];

        // Update id->Path mapping
        $id = $this->data['linear'][$to]['id'];
        $this->idToPath[$id] = $to;
        $this->dnToPath[$dn] = $to;

    }

    function removeItem($path)
    {
        $item = &$this->data['linear'][$path];
        $parent = &$this->data['linear'][$item['parentPath']];
        unset($parent['children'][$path]);
        unset($this->data['linear'][$path]);
    }

    function addItem($type, $path, $name, $values = array(), $status = "")
    {
        if($path == ""){
            $parentItem = &$this->data['recursive'];
            $parentId = NULL;
            $parentDn = $this->config->current['BASE'];
        }elseif(isset($this->data['linear'][$path])){
            $parentItem = &$this->data['linear'][$path]['children'];
            $parentId = $this->data['linear'][$path]['id'];
            $parentDn = $this->data['linear'][$path]['dn'];
        }else{
            trigger_error("Parent item ({$path}) does not exists!");
            return(FALSE);
        }

        $this->currentID ++;
        $entryPath = "{$path}/{$name}";
        $entryDn  = rtrim("cn={$name},{$parentDn}",',');
        $entryId =  $this->currentID;
        
        $entry['path'] = $entryPath;
        $entry['dn'] = $entryDn;
        $entry['id'] = $entryId;
        $entry['parentId'] = $parentId;
        $entry['name'] = $name;
        $entry['path'] = $entryPath;
        $entry['parentPath'] = $path;
        $entry['type'] = $type;
        $entry['status'] = $status;
        $entry['values'] = $values;
        $entry['children'] = array();

        $parentItem[$entryPath] = &$entry;
        $this->data['linear'][$entryPath] = &$parentItem[$entryPath];

        $this->idToPath[$entryId] = $entryPath;
        $this->dnToPath[$entryDn] = $entryPath;

        $this->typeToPath[$type][$name] = $entryPath;
    
        return($entryId);
    }

    function pathToDn($path)
    {
        
    }

    function hasChildren($path)
    {
        if( $this->itemExistsByPath($path) && 
            $this->data['linear'][$path]['children'] && 
            count($this->data['linear'][$path]['children'] )){
                return(TRUE);
        }
        return(FALSE);
    }

    function itemExistsByPath($path)
    {
        return(isset($this->data['linear'][$path]));
    }
    
    function getItemByPath($path)
    {
        if(isset($this->data['linear'][$path])){
            return($this->data['linear'][$path]);
        }
        return(NULL);
    }

    function setItemStatus($path, $status)
    {
        if(!$this->itemExistsByPath($path)){
            trigger_error("Invalid item path '{$path}'!");
        }else{
            $this->data['linear'][$path]['status'] = $status;
        }
    }

    function setItemValues($path, $values)
    {
        if(!$this->itemExistsByPath($path)){
            trigger_error("Invalid item path '{$path}'!");
        }else{
            $this->data['linear'][$path]['values'] = $values;
        }
    }

    function getItemsByType($types)
    {
        $res = array();
        foreach($this->data['linear'] as $path => $item){
            if(in_array_strict($item['type'],$types)) $res[] = $item;
        }
        return($res);
    }


    function getItemById($id)
    {
        $path = NULL;
        if(isset($this->idToPath[$id])){
            $path = $this->idToPath[$id];
        }else{
            return(NULL);
        }
        if(isset($this->data['linear'][$path])){
            return($this->data['linear'][$path]);
        }
        return(NULL);
    }

    function getItemByDn($dn)
    {
        $path = NULL;
        if(isset($this->dnToPath[$dn])){
            $path = $this->dnToPath[$dn];
        }else{
            return(NULL);
        }
        if(isset($this->data['linear'][$path])){
            return($this->data['linear'][$path]);
        }
        return(NULL);
    }
}

?>
