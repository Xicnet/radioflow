<?php

function getFacebookId($url) {
    echo "URL: $url\n";

    $id =  substr(strrchr($url,'/'),1); 
    echo "id: $id\n";

    $json = file_get_contents('http://graph.facebook.com/'.$id);

    $json = json_decode($json);
    echo "json decode: ". print_r($json);

    printf("json id: %s\n", $json->id);
    return $json->id;

}


echo getFacebookId($argv[1]);


?>
