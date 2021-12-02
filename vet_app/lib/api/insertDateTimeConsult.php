<?php

require "conexao.php";

$dateTime = $_POST['dateTime'];
$idProp = $_POST['idProp'];
$idVet = $_POST['idVet'];

// $nome = "Juan";
// $senha = "Teste";

$sql = "INSERT INTO CONSULTAS VALUES(NULL,'$dateTime','$idProp',NULL,'$idVet')";

$query = $mysqli->query($sql);

if ($query) {
    echo json_encode("Success");
}
