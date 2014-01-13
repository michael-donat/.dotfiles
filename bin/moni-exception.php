<?php
/**
 * Created by PhpStorm.
 * User: donatm
 * Date: 12/01/2014
 * Time: 19:45
 */


$link = new PDO('mysql:dbname=api_moni_core_api;host=127.0.0.1', 'root');

$stmt = $link->query("select * from log where _topic = 'exception' order by id desc limit 5");

while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $row["_msg"] = json_decode($row["_msg"]);
    print_r($row);
}
