<?php

class durationTimeChart extends memoryUsageChart
{
    protected $title = 'Plugin duration';
    protected $enableCaching = TRUE;

    function __construct(&$config)
    {
        parent::__construct($config);
        $this->graphName = get_class();

        // Generate graph which displays the memory usage over time
        $this->series = array(
                'max_dur' => tr('Maximum'),
                'avg_dur' => tr('Average'),
                'min_dur' => tr('Minimum'));
        $this->dataName = "usagePerInterval";
    }
}
?>
