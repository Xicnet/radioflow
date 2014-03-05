<?php

function getFacebookId($url) {

    $id =  substr(strrchr($url,'/'),1); 

    $json = file_get_contents('http://graph.facebook.com/'.$id);

    $json = json_decode($json);

    return $json->id;

}


echo getFacebookId($argv[1]);


?>
