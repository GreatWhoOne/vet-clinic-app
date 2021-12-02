<?php

require "conexao.php";

$idUser = $_POST['idUser'];

// $idUser = "9";

$sql = "SELECT* FROM CONSULTAS C
INNER JOIN PROPRIETARIO P
ON C.ID_PROPRIETARIO = P.ID_PROPRIETARIO
WHERE C.ID_PROPRIETARIO = '$idUser'";

$query = $mysqli->query($sql);
$result = array();

while ($rowData = $query->fetch_assoc()) {

    $result[] = $rowData;
}

echo json_encode($result);
