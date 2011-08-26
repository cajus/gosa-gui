<?php

/* \brief   The base class for ngEvents - Events that can be send to an gosa-ng service.
 * \author  Fabian Hickert <hickert@gonicus.de>
 * \date    25.08.2011
 */
class ngEvent
{
    static function isConfigured($config)
    {
        // Check if the service is configured and connected.
        $rpc = $config->getRpcHandle();
        return($rpc->isConfigured());
    } 
}

?>
