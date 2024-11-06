<?php
include_once 'connectdb.php';

$id = $_POST['id']; // 'pidd' correspond à l'ID envoyé via AJAX pour la suppression
$sql = "DELETE FROM tbl_plantations WHERE id = :id"; // Assurez-vous que le champ est correct
$delete = $pdo->prepare($sql);
$delete->bindParam(':id', $id, PDO::PARAM_INT);

if ($delete->execute()) {
    echo "Plantation supprimé avec succès";
} else {
    echo "Erreur lors de la suppression du producteur";
}
?>