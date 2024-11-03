<?php
include_once 'connectdb.php';
session_start();
$id = $_POST['pidd']; // 'pidd' correspond à l'ID envoyé via AJAX pour la suppression
$sql = "DELETE FROM tbl_producteurs WHERE producteur_id = :id"; // Assurez-vous que le champ est correct
$delete = $pdo->prepare($sql);
$delete->bindParam(':id', $id, PDO::PARAM_INT);

if ($delete->execute()) {
    echo "Producteur supprimé avec succès";
    sendlog(
      $pdo,
      'Suppression',
      $_SESSION['username'] . " a supprimé le producteur N°".$id,
      'Succès',

      $_SESSION['userid'],
      $_SESSION['username'],

      'Producteur',
      $id,
      'N/A',
    );
} else {
    echo "Erreur lors de la suppression du producteur";
    sendlog(
      $pdo,
      'Suppression',
      $_SESSION['username'] . " n'a pas pu supprimer le producteur N°".$id,
      'Échec',

      $_SESSION['userid'],
      $_SESSION['username'],

      'Producteur',
      $id,
      'N/A',
    );
}
?>
