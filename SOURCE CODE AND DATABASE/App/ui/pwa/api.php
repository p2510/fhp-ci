<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // security Cors

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // get form data 
    $nom = $_POST['nom'] ?? '';
    $produit = $_POST['produit'] ?? '';
    $description = $_POST['description'] ?? '';

    // Traitement des données (enregistrement dans une base de données, par exemple)
    // ...

    // return 
    echo json_encode(['success' => true, 'message' => 'Produit ajouté avec succès !']);
} else {
    echo json_encode(['success' => false, 'message' => 'Méthode non autorisée.']);
}
?>