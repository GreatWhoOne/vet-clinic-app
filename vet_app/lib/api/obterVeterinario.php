<?php

require "conexao.php";

//$sql = "SELECT * FROM VETERINARIO";

//$sql = "Select * from FUNCIONARIO f
//Inner join VETERINARIO v
//on f.id_funcionario = v.id_funcionario";

$sql = "SELECT* FROM CARGO C INNER JOIN FUNCIONARIO F ON C.ID_CARGO = F.ID_CARGO Inner join VETERINARIO v on F.id_funcionario = v.id_funcionario WHERE C.ID_CARGO='3'
";

$query = $mysqli->query($sql);
$result = array();

while ($rowData = $query->fetch_assoc()) {

    $result[] = $rowData;
}

echo json_encode($result);
