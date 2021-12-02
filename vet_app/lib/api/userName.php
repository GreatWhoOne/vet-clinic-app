<?php

require "conexao.php";

$email = $_POST['email'];

//$email = "soprado@gmail.com";

$sql = "Select NOME from PROPRIETARIO where EMAIL = '$email'";
$query = $mysqli->query($sql);
$result = array();

while ($rowData = $query->fetch_assoc()) {

    $result[] = $rowData;
}

echo json_encode($result);
