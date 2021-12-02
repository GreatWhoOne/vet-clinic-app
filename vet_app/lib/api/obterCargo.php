<?php

require "conexao.php";

// $sql = "SELECT * FROM VETERINARIO";

$sql = "select * from CARGO C
inner join FUNCIONARIO F
on C.ID_CARGO = F.ID_CARGO
inner join VETERINARIO V
on F.ID_FUNCIONARIO = V.ID_FUNCIONARIO
inner join ESPECIALIDADE E
on E.ID_ESPECIALIDADE = V.ID_ESPECIALIDADE
WHERE C.ID_CARGO = '3'";

$query = $mysqli->query($sql);
$result = array();

while ($rowData = $query->fetch_assoc()) {

    $result[] = $rowData;
}

echo json_encode($result);
