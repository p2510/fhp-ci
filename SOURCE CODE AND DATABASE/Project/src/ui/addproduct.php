<?php
include_once 'connectdb.php';
session_start();

// if ($_SESSION['useremail'] == ""  OR $_SESSION['role'] == "User") { # ATTENDS C'EST SEULEMENT LES ADMINS QUI PEUVENT AJOUTER ?
if ($_SESSION['useremail'] == "") {
  header('location:../index.php');
}

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

// Logique pour l'ajout de producteur
if (isset($_POST['btnsave'])) {
// Récupérer les informations du formulaire et les convertir en majuscules
$secteur_code = strtoupper($_POST['txtsecteur_code']);
$secteur_name = strtoupper($_POST['txtsecteur_name']);
$departement = strtoupper($_POST['txtdepartement']);
$sous_prefecture = strtoupper($_POST['txtsous_prefecture']);
$localite = strtoupper($_POST['txtlocalite']);
$nom = strtoupper($_POST['txtnom']);
$prenom = strtoupper($_POST['txtprenom']);
$date_naissance = $_POST['txtdate_naissance']; // Garder la date inchangée
$lieu_naissance = strtoupper($_POST['txtlieu_naissance']);
$sous_pref_naissance = strtoupper($_POST['txtsous_pref_naissance']);
$departement_naissance = strtoupper($_POST['txtdepartement_naissance']);
$type_piece_identite = strtoupper($_POST['txttype_piece_identite']);
$numero_piece = strtoupper($_POST['txtnumero_piece']);
$autre_piece = strtoupper($_POST['txtautre_piece']);
$contact_telephonique = $_POST['txtcontact_telephonique']; // Garder le numéro inchangé
$superficie_totale = $_POST['txtsuperficie_totale']; // Garder la superficie inchangée
$delegue_village = strtoupper($_POST['txtdelegue_village']);
    $created_by = $_SESSION['username']; // Récupérer le nom de l'utilisateur connecté

    // Génération du producteur_code
    $random_digits = str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT); // Génère un nombre à 7 chiffres
    $producteur_code = $secteur_code . $random_digits;

    // Gérer l'upload de la photo
    $photo_name = $producteur_code . '.jpg';
    $photo_tmp = $_FILES['photo']['tmp_name'];
    $photo_path = "uploads/" . $photo_name; // Assurez-vous que le dossier 'uploads' existe et est accessible en écriture

    if (move_uploaded_file($photo_tmp, $photo_path)) {
        $_SESSION['status'] = "Photo téléchargée avec succès";
    } else {
        $_SESSION['status'] = "Échec du téléchargement de la photo";
    }

    // Traitement de la signature
    $signatureDataURL = $_POST['signature']; // Contient la signature en base64
    if (!empty($signatureDataURL)) {
        // Extraire la partie base64 de l'image
        $signatureData = explode(',', $signatureDataURL)[1];
        $decodedImage = base64_decode($signatureData);

        // Nom du fichier de la signature
        $signatureFileName = "SIGN_" . $producteur_code . ".png";
        $signaturePath = "signatures/" . $signatureFileName;

        // S'assurer que le dossier 'signatures' existe
        if (!file_exists('signatures')) {
            mkdir('signatures', 0777, true); // Créer le dossier s'il n'existe pas
        }

        // Enregistrer l'image en tant que fichier PNG
        file_put_contents($signaturePath, $decodedImage);
    } else {
      $_SESSION['status'] = "Signature manquante";
      echo "<script>
              alert('Signature manquante. Vous allez être redirigé vers la page d\'ajout.');
              window.location.href = 'addproduct.php';
            </script>";
      exit();
    }

    // Enregistrement des données du producteur
    $insert = $pdo->prepare("INSERT INTO tbl_producteurs (
        producteur_code, secteur_code, secteur_name, departement, sous_prefecture, localite, nom, prenom, date_naissance,
        lieu_naissance, sous_pref_naissance, departement_naissance, type_piece_identite, numero_piece, autre_piece,
        contact_telephonique, superficie_totale, delegue_village, photo, signature, created_by)
        VALUES (
        :producteur_code, :secteur_code, :secteur_name, :departement, :sous_prefecture, :localite, :nom, :prenom, :date_naissance,
        :lieu_naissance, :sous_pref_naissance, :departement_naissance, :type_piece_identite, :numero_piece, :autre_piece,
        :contact_telephonique, :superficie_totale, :delegue_village, :photo, :signature, :created_by)");

    $insert->bindParam(':producteur_code', $producteur_code);
    $insert->bindParam(':secteur_code', $secteur_code);
    $insert->bindParam(':secteur_name', $secteur_name);
    $insert->bindParam(':departement', $departement);
    $insert->bindParam(':sous_prefecture', $sous_prefecture);
    $insert->bindParam(':localite', $localite);
    $insert->bindParam(':nom', $nom);
    $insert->bindParam(':prenom', $prenom);
    $insert->bindParam(':date_naissance', $date_naissance);
    $insert->bindParam(':lieu_naissance', $lieu_naissance);
    $insert->bindParam(':sous_pref_naissance', $sous_pref_naissance);
    $insert->bindParam(':departement_naissance', $departement_naissance);
    $insert->bindParam(':type_piece_identite', $type_piece_identite);
    $insert->bindParam(':numero_piece', $numero_piece);
    $insert->bindParam(':autre_piece', $autre_piece);
    $insert->bindParam(':contact_telephonique', $contact_telephonique);
    $insert->bindParam(':superficie_totale', $superficie_totale);
    $insert->bindParam(':delegue_village', $delegue_village);
    $insert->bindParam(':photo', $photo_name);
    $insert->bindParam(':signature', $signatureFileName); // Enregistrer le nom du fichier signature
    $insert->bindParam(':created_by', $created_by);

    if ($insert->execute()) {
      echo "<script>
              alert('Producteur ajouté avec succès');
              window.location.href = 'productlist.php';
            </script>";
      sendlog(
        $pdo,
        'Création',
        $_SESSION['username'] . " a créé le producteur N°".$pdo->lastInsertId()." - $nom $prenom",
        'Succès',

        $_SESSION['userid'],
        $_SESSION['username'],

        'Producteur',
        $pdo->lastInsertId(),
        "$nom $prenom",
      );
      exit();
  } else {
      $_SESSION['status'] = "Échec de l'ajout du producteur";
      $_SESSION['status_code'] = "error";
      sendlog(
        $pdo,
        'Création',
        $_SESSION['username'] . " n'a pas pu créer le producteur $nom $prenom",
        'Échec',

        $_SESSION['userid'],
        $_SESSION['username'],

        'Producteur',
        null,
        "$nom $prenom",
      );
  }

}
?>
<!-- Formulaire HTML avec tous les champs manquants inclus -->
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Ajouter un Producteur</h1>
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
              <h5 class="m-0">Formulaire d'Ajout de Producteur</h5>
            </div>
            <form action="" method="post" enctype="multipart/form-data" id="producteur-form">
              <div class="card-body">
                <div class="row">
                  <!-- Colonne gauche -->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Secteur</label>
                      <select class="form-control" id="secteur_selector" name="txtsecteur_name" required>
                        <option value="" disabled selected>Choisissez un secteur</option>
                        <?php
                        $select = $pdo->prepare("SELECT * FROM tbl_secteurs ORDER BY secteur_id DESC");
                        $select->execute();
                        while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                          echo '<option value="' . $row['secteur_name'] . '" data-secteur_code="' . $row['secteur_code'] . '">' . $row['secteur_name'] . '</option>';
                        }
                        ?>
                      </select>
                      <input type="hidden" id="txtsecteur_code" name="txtsecteur_code">
                    </div>

                    <div class="form-group">
    <label>Code Producteur</label>
    <input type="text" class="form-control" id="producteur_code" name="producteur_code" placeholder="Le code producteur généré apparaîtra ici" disabled>
</div>


                    <div class="form-group">
                      <label>Département</label>
                      <input type="text" class="form-control" name="txtdepartement" required>
                    </div>

                    <div class="form-group">
                      <label>Sous-Préfecture</label>
                      <input type="text" class="form-control" name="txtsous_prefecture" required>
                    </div>

                    <div class="form-group">
                      <label>Localité</label>
                      <input type="text" class="form-control" name="txtlocalite" required>
                    </div>

                    <div class="form-group">
                      <label>Nom</label>
                      <input type="text" class="form-control" name="txtnom" placeholder="Entrez le nom" required>
                    </div>

                    <div class="form-group">
                      <label>Prénom</label>
                      <input type="text" class="form-control" name="txtprenom" placeholder="Entrez le prénom" required>
                    </div>
                  </div>

                  <!-- Colonne droite -->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Date de naissance</label>
                      <input type="date" class="form-control" name="txtdate_naissance" required>
                    </div>

                    <div class="form-group">
                      <label>Lieu de naissance</label>
                      <input type="text" class="form-control" name="txtlieu_naissance" required>
                    </div>

                    <div class="form-group">
                      <label>Sous-préfecture du lieu de naissance</label>
                      <input type="text" class="form-control" name="txtsous_pref_naissance" required>
                    </div>

                    <div class="form-group">
                      <label>Département du lieu de naissance</label>
                      <input type="text" class="form-control" name="txtdepartement_naissance" required>
                    </div>

                    <div class="form-group">
                      <label>Type de pièce d'identité</label>
                      <select class="form-control" name="txttype_piece_identite">
                        <option value="CNI">CNI</option>
                        <option value="Passeport">Passeport</option>
                        <option value="Permis de conduire">Permis de conduire</option>
                      </select>
                    </div>

                    <div class="form-group">
                      <label>Numéro de pièce</label>
                      <input type="text" class="form-control" name="txtnumero_piece">
                    </div>

                    <div class="form-group">
                      <label>Autre pièce</label>
                      <input type="text" class="form-control" name="txtautre_piece">
                    </div>

                    <div class="form-group">
                      <label>Contact Téléphonique</label>
                      <input type="text" class="form-control" name="txtcontact_telephonique" required>
                    </div>

                    <div class="form-group">
  <label>Superficie Totale</label>
  <input type="number" class="form-control" name="txtsuperficie_totale" step="0.01" required>
</div>


                    <div class="form-group">
                      <label>Délégué Village</label>
                      <input type="text" class="form-control" name="txtdelegue_village" required>
                    </div>

                    <div class="form-group">
                      <label>Photo</label>
                      <input type="file" class="form-control" name="photo" accept="image/*">
                    </div>

                    <div class="form-group">
                    <div class="form-group">
  <label>Signature</label>
  <!-- Canvas for the signature pad -->
  <canvas id="signature-pad" class="signature-pad" width="500" height="200" style="border: 1px solid #000;"></canvas>

  <!-- Hidden input to store the base64 data of the signature -->
  <input type="hidden" name="signature" id="signature_image">

  <!-- Clear signature button -->
  <button type="button" id="clear-signature" class="btn btn-warning mt-2">Effacer la signature</button>
</div>
                  </div>
                </div>
              </div>

              <div class="card-footer">
                <button type="submit" class="btn btn-primary" name="btnsave">Enregistrer Producteur</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<?php include_once "footer.php"; ?>


<script>
document.addEventListener("DOMContentLoaded", function () {
  // Initialisation de Signature Pad
  const signaturePad = new SignaturePad(document.getElementById('signature-pad'));

  // Ciblez le formulaire par son ID
  document.getElementById("producteur-form").addEventListener("submit", function(event) {
    if (!signaturePad.isEmpty()) {
      const dataURL = signaturePad.toDataURL();
      document.getElementById('signature_image').value = dataURL;
    } else {
      alert("Veuillez signer avant d'enregistrer.");
      event.preventDefault(); // Empêche la soumission si la signature est manquante
    }
  });

  // Effacer la signature
  document.getElementById('clear-signature').addEventListener('click', function () {
    signaturePad.clear();
  });
});


  // Gérer la génération du code producteur
  document.getElementById('secteur_selector').addEventListener('change', function () {
      const selectedOption = this.options[this.selectedIndex];
      const secteur_code = selectedOption.getAttribute('data-secteur_code');

      if (secteur_code) {
          // Générer les 7 chiffres aléatoires
          const randomDigits = Math.floor(1000000 + Math.random() * 9000000);
          const producteurCode = secteur_code + randomDigits; // Combinaison du code secteur et des chiffres aléatoires

          // Mettre à jour la valeur du champ producteur_code pour afficher le code généré
          document.getElementById('producteur_code').value = producteurCode;

          // Remplir également le champ caché txtsecteur_code
          document.getElementById('txtsecteur_code').value = secteur_code;
      }
  });

</script>
