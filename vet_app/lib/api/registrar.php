<?php

require "conexao.php";

$name = $_POST['nome'];
$cpf = $_POST['cpf'];
$gender = $_POST['sexo'];
$birthDate = $_POST['dataNasc'];
$email = $_POST['email'];
$pass = $_POST['senha'];

// $name = "Teste";
// $cpf = "12609432089";
// $gender = "M";
// $birthDate = "1997-09-13";
// $email = "teste@hotmail.com";
// $pass = "teste123";

$sql = "INSERT INTO PROPRIETARIO VALUES(NULL, '$name', '$cpf', '$gender', '$birthDate','$email', '$pass')";

$query = $mysqli->query($sql);

if ($query) {
    echo json_encode("Success");
}
