<?php

class filterConfigManagement {

    static function query($base, $scope, $filter, $attributes, $category, $objectStorage= "")
    {
        // Walk through the data array till we reach the correct level, then 
        //  create the list of entries.
        $data = session::get('CONFIG_ITEM');
        if(!$data) return(array());

        // Prepare filter, strip out regex regex related chars, except for *
        $filter = preg_replace('/\*/','____STAR____', $filter);
        $filter = preg_quote($filter,'/');
        $filter = preg_replace('/____STAR____/','.*', $filter);

        // Add entries 
        $ret = array();
        if($data['path'] != "/root"){
            $back = array(); 
            $back['dn'] = $data['dn'];
            $back[] = 'dn';
            $back['cn'] = array('.', 'count' => 1);
            $back[] = 'cn';
            $back['description'] = array($data['type'], 'count' => 1);
            $back[] = 'description';
            $back['objectClass'] = array($data['type'], 'count' => 1);
            $back[] = 'objectClass';
            $back['count'] = 3;
            $ret[] = $back;
        }

        foreach($data['children'] as $item){
            filterConfigManagement::addEntry($ret, $item, $scope == 'sub', $filter);
        }
        return($ret);
    }

    static function addEntry(&$ret, $item, $recursive = FALSE, $filter)
    {
        if(preg_match("/".$filter."/",$item['name'])){
            $entry = array();
            $entry['dn'] = $item['dn'];
            $entry[] = 'dn';
            $entry['cn'] = array($item['name'], 'count' => 1);
            $entry[] = 'cn';
            $entry['id'] = array($item['id'], 'count' => 1);
            $entry[] = 'id';
            $entry['description'] = array($item['type'], 'count' => 1);
            $entry[] = 'description';
            $entry['objectClass'] = array($item['type'],'count' => 1);
            $entry[] = 'objectClass';
            $entry['count'] = 5;

            $ret[] = $entry;
        }

        if($recursive && isset($item['children']) && count($item['children'])){
            foreach($item['children'] as $item){
                filterConfigManagement::addEntry($ret, $item, $recursive,$filter);
            }
        }

    }
}

?>
