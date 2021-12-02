<?php

require "conexao.php";

$idVet = $_POST['idVet'];
$date = $_POST['date'];

$idVet = "2";
$date = "2021-11-19 13:30:00";

$sql = "SELECT * FROM CONSULTAS WHERE ID_VETERINARIO='$idVet' AND DATA_HORA_CONSULTA='$date'";

// SELECT * FROM CONSULTAS WHERE ID_VETERINARIO='2' AND DATA_HORA_CONSULTA='2021-11-19 13:30:00'

$query = $mysqli->query($sql);

if ($query->num_rows > 0) {

    echo "CORRETO";

} else {
    echo "ERROR";
}
