<?php

$json = file_get_contents('./prod.json');
$json = json_decode($json, true);

// $fmt = [];

var_dump($json);

?>