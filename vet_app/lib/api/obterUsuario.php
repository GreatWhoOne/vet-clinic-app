<?php

require "conexao.php";

$email = $_POST['email'];
$senha = $_POST['senha'];

// $email = "Juan";
// $senha = "Teste";

$sql = "SELECT * FROM PROPRIETARIO WHERE email='$email' AND senha='$senha'";

$query = $mysqli->query($sql);

if ($query->num_rows > 0) {

    echo "CORRETO";

} else {
    echo "ERROR";
}
