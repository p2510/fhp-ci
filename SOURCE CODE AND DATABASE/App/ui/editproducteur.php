<?php
ob_start();
session_start();
include_once 'connectdb.php';

if ($_SESSION['useremail'] == ""  OR $_SESSION['role'] == "User") {
    header('location:../index.php');
}

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

$id = $_GET['id'];

// Récupérer les informations du producteur
$select = $pdo->prepare("SELECT * FROM tbl_producteurs WHERE producteur_id = :id");
$select->bindParam(':id', $id);
$select->execute();

$row = $select->fetch(PDO::FETCH_ASSOC);

// Récupérer le secteur_name du producteur
$secteur_name_db = $row['secteur_name'];

// Récupérer le secteur_code à partir du secteur_name dans la table tbl_secteurs
$secteur_code_query = $pdo->prepare("SELECT secteur_code FROM tbl_secteurs WHERE secteur_name = :secteur_name");
$secteur_code_query->bindParam(':secteur_name', $secteur_name_db);
$secteur_code_query->execute();

$secteur_code_row = $secteur_code_query->fetch(PDO::FETCH_ASSOC);
$secteur_code_db = $secteur_code_row['secteur_code'];

// Initialiser les variables avec les valeurs du secteur

// Variables pour pré-remplir le formulaire avec les données actuelles du producteur
$producteur_code_db = $row['producteur_code'];
$nom_db = $row['nom'];
$prenom_db = $row['prenom'];
$secteur_name_db = $row['secteur_name'];
$secteur_code_db = $row['secteur_code'];
$departement_db = $row['departement'];
$sous_prefecture_db = $row['sous_prefecture'];
$localite_db = $row['localite'];
$date_naissance_db = $row['date_naissance'];
$lieu_naissance_db = $row['lieu_naissance'];
$sous_pref_naissance_db = $row['sous_pref_naissance'];
$departement_naissance_db = $row['departement_naissance'];
$type_piece_identite_db = $row['type_piece_identite'];
$numero_piece_db = $row['numero_piece'];
$autre_piece_db = $row['autre_piece'];
$contact_telephonique_db = $row['contact_telephonique'];
$superficie_totale_db = $row['superficie_totale'];
$delegue_village_db = $row['delegue_village'];
$photo_db = $row['photo']; // Photo existante
$signature_db = $row['signature']; // Signature existante

if (isset($_POST['btneditproducteur'])) {
    // Récupérer les informations du formulaire
    $nom_txt = strtoupper($_POST['txtnom']);
    $prenom_txt = strtoupper($_POST['txtprenom']);
    $secteur_name_txt = strtoupper($_POST['txtsecteur_name']);
    $secteur_code_txt = strtoupper($_POST['txtsecteur_code']);
    $departement_txt = strtoupper($_POST['txtdepartement']);
    $sous_prefecture_txt = strtoupper($_POST['txtsous_prefecture']);
    $localite_txt = strtoupper($_POST['txtlocalite']);
    $date_naissance_txt = $_POST['txtdate_naissance'];
    $lieu_naissance_txt = strtoupper($_POST['txtlieu_naissance']);
    $sous_pref_naissance_txt = strtoupper($_POST['txtsous_pref_naissance']);
    $departement_naissance_txt = strtoupper($_POST['txtdepartement_naissance']);
    $type_piece_identite_txt = strtoupper($_POST['txttype_piece_identite']);
    $numero_piece_txt = strtoupper($_POST['txtnumero_piece']);
    $autre_piece_txt = strtoupper($_POST['txtautre_piece']);
    $contact_telephonique_txt = $_POST['txtcontact_telephonique'];
    $superficie_totale_txt = $_POST['txtsuperficie_totale'];
    $delegue_village_txt = strtoupper($_POST['txtdelegue_village']);

    // Gérer la modification ou conservation de la photo
    if (!empty($_FILES['photo']['name'])) {
        $photo_name = $producteur_code_db . '.jpg'; // Nom de la nouvelle photo
        $photo_tmp = $_FILES['photo']['tmp_name'];
        $photo_path = "uploads/" . $photo_name;

        if (move_uploaded_file($photo_tmp, $photo_path)) {
            $_SESSION['status'] = "Photo mise à jour avec succès";
        } else {
            $_SESSION['status'] = "Échec du téléchargement de la photo";
        }
    } else {
        // Garder la photo existante si aucune nouvelle photo n'est uploadée
        $photo_name = $photo_db;
    }

    // Gestion de la signature
    $signatureDataURL = $_POST['signature']; // Contient la signature en base64
    if (!empty($signatureDataURL)) {
        // Extraire la partie base64 de l'image
        $signatureData = explode(',', $signatureDataURL)[1];
        $decodedImage = base64_decode($signatureData);

        // Nom du fichier de la signature
        $signatureFileName = "SIGN_" . $producteur_code_db . ".png";
        $signaturePath = "signatures/" . $signatureFileName;

        // S'assurer que le dossier 'signatures' existe
        if (!file_exists('signatures')) {
            mkdir('signatures', 0777, true); // Créer le dossier s'il n'existe pas
        }

        // Enregistrer la nouvelle signature
        file_put_contents($signaturePath, $decodedImage);
    } else if (isset($_POST['clear_signature'])) {
        // Si l'utilisateur veut effacer la signature existante
        $signatureFileName = ""; // Effacer la signature
    } else {
        // Garder la signature existante
        $signatureFileName = $signature_db;
    }

    // Mise à jour des informations du producteur
    $update = $pdo->prepare("UPDATE tbl_producteurs SET
        nom = :nom, prenom = :prenom, secteur_name = :secteur_name, secteur_code = :secteur_code,
        departement = :departement, sous_prefecture = :sous_prefecture, localite = :localite,
        date_naissance = :date_naissance, lieu_naissance = :lieu_naissance,
        sous_pref_naissance = :sous_pref_naissance, departement_naissance = :departement_naissance,
        type_piece_identite = :type_piece_identite, numero_piece = :numero_piece, autre_piece = :autre_piece,
        contact_telephonique = :contact_telephonique, superficie_totale = :superficie_totale,
        delegue_village = :delegue_village, photo = :photo, signature = :signature
        WHERE producteur_id = :id");

    $update->bindParam(':id', $id);
    $update->bindParam(':nom', $nom_txt);
    $update->bindParam(':prenom', $prenom_txt);
    $update->bindParam(':secteur_name', $secteur_name_txt);
    $update->bindParam(':secteur_code', $secteur_code_txt);
    $update->bindParam(':departement', $departement_txt);
    $update->bindParam(':sous_prefecture', $sous_prefecture_txt);
    $update->bindParam(':localite', $localite_txt);
    $update->bindParam(':date_naissance', $date_naissance_txt);
    $update->bindParam(':lieu_naissance', $lieu_naissance_txt);
    $update->bindParam(':sous_pref_naissance', $sous_pref_naissance_txt);
    $update->bindParam(':departement_naissance', $departement_naissance_txt);
    $update->bindParam(':type_piece_identite', $type_piece_identite_txt);
    $update->bindParam(':numero_piece', $numero_piece_txt);
    $update->bindParam(':autre_piece', $autre_piece_txt);
    $update->bindParam(':contact_telephonique', $contact_telephonique_txt);
    $update->bindParam(':superficie_totale', $superficie_totale_txt);
    $update->bindParam(':delegue_village', $delegue_village_txt);
    $update->bindParam(':photo', $photo_name);
    $update->bindParam(':signature', $signatureFileName);

    if ($update->execute()) {
      sendlog(
        $pdo,
        'Modification',
        $_SESSION['username'] . " a modifié le producteur N°$id - $nom_txt $prenom_txt",
        'Succès',

        $_SESSION['userid'],
        $_SESSION['username'],

        'Producteur',
        $id,
        "$nom_txt $prenom_txt",
      );
      $_SESSION['status'] = "Producteur mis à jour avec succès";
      $_SESSION['status_code'] = "success";
      header('Location: productlist.php');
      exit();
    } else {
        $_SESSION['status'] = "Échec de la mise à jour du producteur";
        $_SESSION['status_code'] = "error";
        sendlog(
          $pdo,
          'Modification',
          $_SESSION['username'] . " n'a pas pu modifier le producteur N°$id - $nom_txt $prenom_txt",
          'Échec',

          $_SESSION['userid'],
          $_SESSION['username'],

          'Producteur',
          $id,
          "$nom_txt $prenom_txt",
        );
    }
}
?>

<!-- Formulaire HTML -->
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Modifier Producteur</h1>
        </div>
      </div>
    </div>
  </div>

  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-12">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h5 class="m-0">Formulaire de modification du producteur</h5>
            </div>

            <form action="" method="post" enctype="multipart/form-data" id="producteur-form">
  <div class="card-body">
    <div class="row">
      <!-- Colonne gauche -->
      <div class="col-md-6">
        <div class="form-group">
          <label>Nom</label>
          <input type="text" class="form-control" name="txtnom" value="<?php echo $nom_db; ?>" required>
        </div>

        <div class="form-group">
          <label>Prénom</label>
          <input type="text" class="form-control" name="txtprenom" value="<?php echo $prenom_db; ?>" required>
        </div>

        <div class="form-group">
  <label>Secteur</label>
  <input type="text" class="form-control" value="<?php echo strtoupper($secteur_name_db) . ' (' . strtoupper($secteur_code_db) . ')'; ?>" readonly>
  <input type="hidden" name="txtsecteur_name" value="<?php echo $secteur_name_db; ?>">
  <input type="hidden" name="txtsecteur_code" value="<?php echo $secteur_code_db; ?>">
</div>


                    <div class="form-group">
                      <label>Département</label>
                      <input type="text" class="form-control" name="txtdepartement" value="<?php echo $departement_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Sous-Préfecture</label>
                      <input type="text" class="form-control" name="txtsous_prefecture" value="<?php echo $sous_prefecture_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Localité</label>
                      <input type="text" class="form-control" name="txtlocalite" value="<?php echo $localite_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Date de naissance</label>
                      <input type="date" class="form-control" name="txtdate_naissance" value="<?php echo $date_naissance_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Lieu de naissance</label>
                      <input type="text" class="form-control" name="txtlieu_naissance" value="<?php echo $lieu_naissance_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Sous-préfecture du lieu de naissance</label>
                      <input type="text" class="form-control" name="txtsous_pref_naissance" value="<?php echo $sous_pref_naissance_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Département du lieu de naissance</label>
                      <input type="text" class="form-control" name="txtdepartement_naissance" value="<?php echo $departement_naissance_db; ?>" required>
                    </div>
                  </div>

                  <!-- Colonne droite -->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Type de pièce d'identité</label>
                      <select class="form-control" name="txttype_piece_identite" required>
                        <option value="CNI" <?php if($type_piece_identite_db == 'CNI') echo 'selected'; ?>>CNI</option>
                        <option value="Passeport" <?php if($type_piece_identite_db == 'Passeport') echo 'selected'; ?>>Passeport</option>
                        <option value="Permis de conduire" <?php if($type_piece_identite_db == 'Permis de conduire') echo 'selected'; ?>>Permis de conduire</option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label>Numéro de pièce</label>
                      <input type="text" class="form-control" name="txtnumero_piece" value="<?php echo $numero_piece_db; ?>">
                    </div>

                    <div class="form-group">
                      <label>Autre pièce</label>
                      <input type="text" class="form-control" name="txtautre_piece" value="<?php echo $autre_piece_db; ?>">
                    </div>

                    <div class="form-group">
                      <label>Contact Téléphonique</label>
                      <input type="text" class="form-control" name="txtcontact_telephonique" value="<?php echo $contact_telephonique_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Superficie Totale (en hectares)</label>
                      <input type="number" class="form-control" name="txtsuperficie_totale" step="0.01" value="<?php echo $superficie_totale_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Délégué Village</label>
                      <input type="text" class="form-control" name="txtdelegue_village" value="<?php echo $delegue_village_db; ?>" required>
                    </div>

                    <div class="form-group">
                      <label>Photo</label>
                      <?php if (!empty($photo_db)): ?>
                          <img src="uploads/<?php echo $photo_db; ?>" alt="Photo actuelle" width="100"><br>
                      <?php endif; ?>
                      <input type="file" class="form-control" name="photo" accept="image/*">
                    </div>

                    <div class="form-group">
                      <label>Signature</label>
                      <canvas id="signature-pad" class="signature-pad" width="400" height="200" style="border: 1px solid #000;"></canvas>
                      <input type="hidden" name="signature" id="signature_image">
                      <button type="button" id="clear-signature" class="btn btn-warning mt-2">Effacer la signature</button>

                      <?php if (!empty($signature_db)): ?>
                        <p>Signature actuelle : <img src="signatures/<?php echo $signature_db; ?>" alt="Signature" width="100"></p>
                      <?php endif; ?>
                    </div>

                  </div>
                </div>
              </div>

              <div class="card-footer">
                <button type="submit" class="btn btn-primary" name="btneditproducteur">Mettre à jour Producteur</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
  // Initialisation de Signature Pad
  const signaturePad = new SignaturePad(document.getElementById('signature-pad'));

  // Ciblez le formulaire par son ID
  document.getElementById("producteur-form").addEventListener("submit", function(event) {
    if (!signaturePad.isEmpty()) {
      const dataURL = signaturePad.toDataURL();
      document.getElementById('signature_image').value = dataURL;
    }
  });

  // Effacer la signature
  document.getElementById('clear-signature').addEventListener('click', function () {
    signaturePad.clear();
  });
});
</script>
