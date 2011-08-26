<?php

/* \brief   A collection of password related commands that can be send to a gosa-ng 
 *          service.
 * \author  Fabian Hickert <hickert@gonicus.de>
 * \date    25.08.2011
 */
class ngEventPassword extends ngEvent
{
    static function mksmbhash($config, $password)
    {
        // Check if the service is configured and connected.
        $rpc = $config->getRpcHandle();
        if(!$rpc->isConfigured() || !$rpc->isConnected()){
            return(array(NULL, $rpc));
        }else{

            // Initiate the request
            $res = $rpc->mksmbhash($password);
            return(array($res, $rpc));
        }
    } 
}

?>
