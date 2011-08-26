<?php

/* \brief   A collection of network commands that can be send to a gosa-ng 
 *          service.
 * \author  Fabian Hickert <hickert@gonicus.de>
 * \date    25.08.2011
 */
class ngEventNetwork extends ngEvent
{

    static function networkCompletion($config, $cn)
    {
        // Check if the service is configured and connected.
        $rpc = $config->getRpcHandle();
        if(!$rpc->isConfigured() || !$rpc->isConnected()){
            return(array(NULL, $rpc));
        }else{

            // Initiate the request
            $res = $rpc->networkCompletion($cn);
            return(array($res, $rpc));
        }
    } 

    static function getMacManufacturer($config, $mac)
    {
        // Check if the service is configured and connected.
        $rpc = $config->getRpcHandle();
        if(!$rpc->isConfigured() || !$rpc->isConnected()){
            return(array(NULL, $rpc));
        }else{
        
            // Initiate the request
            $res = $rpc->getMacManufacturer($mac);
            return(array($res, $rpc));
        }
    }

}

?>
