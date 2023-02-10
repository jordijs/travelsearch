<?php

$dblink = 'mysql:host=localhost;dbname=vueling';
$dbuser = 'root';
$dbpassword = '';

try {

    $dbh = new PDO($dblink, $dbuser, $dbpassword);

    echo 'Connected';


}catch (PDOexception $error) {
    print $error->getMessage();
    die();
}