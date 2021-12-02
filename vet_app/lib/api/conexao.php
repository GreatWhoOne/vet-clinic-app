<?php

// Variaveis de conexão com o banco de dados
$mysqli = new mysqli("localhost", "admin", "admin", "VetWeb");

// Verifica conexão
if ($mysqli->connect_errno) {
    die("Falha na conexão");
} else {
   // echo "Deu bom";
}
