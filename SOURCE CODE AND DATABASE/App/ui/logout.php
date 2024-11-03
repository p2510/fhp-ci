<?php
include_once '../ui/connectdb.php';
session_start();

sendlog(
    $pdo,
    'Déconnexion',
    $_SESSION['username'] . " s'est déconnecté",
    'Succès',

    $_SESSION['userid'],
    $_SESSION['username'],

    'Connexion',
    null,
    null,
);

session_destroy();

header('location:../index.php');

?>
