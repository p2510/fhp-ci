<?php
include_once 'connectdb.php';
session_start();
include_once 'guard.php';

if ($_SESSION['useremail'] == ""  ) {

  header('location:../index.php');
}
AccessGuard::protectPage('viewproduct');


if ($_SESSION['role'] == "Admin") {
  include_once 'header.php';
} else {

  include_once 'headeruser.php';
}

include 'barcode/barcode128.php';

$id = $_GET['id'];

// Préparez et exécutez la requête pour obtenir les détails du producteur
$select = $pdo->prepare("SELECT * FROM tbl_producteurs WHERE producteur_id = :id");
$select->bindParam(':id', $id);
$select->execute();

// Récupérer les détails du producteur sous forme d'objet
$row = $select->fetch(PDO::FETCH_OBJ);

if (!$row) {
  echo "<div class='alert alert-danger'>Aucun producteur trouvé avec cet ID.</div>";
  exit;
}

sendlog(
  $pdo,
  'Consultation',
  $_SESSION['username'] . " a consulté le producteur N°" . $id . " - " . $row->nom . " " . $row->prenom,
  'Succès',

  $_SESSION['userid'],
  $_SESSION['username'],

  'Producteur',
  $id,
  $row->nom . " " . $row->prenom,
);

?>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Fiche Technique du Producteur</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Accueil</a></li>
                        <li class="breadcrumb-item active">Fiche Technique</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-info card-outline">
                        <div class="card-header">
                            <h5 class="m-0">Détails du Producteur</h5>
                            <!-- Bouton d'impression -->
                            <div class="d-flex justify-content-end mb-3">
                                <a href="printbill.php?id=<?php echo $row->producteur_id; ?>" class="btn btn-warning"
                                    role="button" target="_blank">
                                    <span class="fa fa-print" style="color:#ffffff" data-toggle="tooltip"
                                        title="Imprimer la Fiche Technique"> Imprimer Fiche Technique</span>
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <?php
              $id = $_GET['id'];

              $select = $pdo->prepare("SELECT * FROM tbl_producteurs WHERE producteur_id = :id");
              $select->bindParam(':id', $id);
              $select->execute();

              while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                echo '
                <div class="row">
                  <!-- Section des informations du producteur -->
                  <div class="col-md-8">
                    <table class="table table-bordered">
                      <tr>
                        <th>Nom Complet</th>
                        <td>' . strtoupper($row->nom) . ' ' . strtoupper($row->prenom) . '</td>
                      </tr>
                      <tr>
                        <th>Code Producteur</th>
                        <td>' . strtoupper($row->producteur_code) . '</td>
                      </tr>
                      <tr>
                        <th>Secteur</th>
                        <td>' . strtoupper($row->secteur_name) . ' (' . strtoupper($row->secteur_code) . ')</td>
                      </tr>
                      <tr>
                        <th>Département</th>
                        <td>' . strtoupper($row->departement) . '</td>
                      </tr>
                      <tr>
                        <th>Sous-Préfecture</th>
                        <td>' . strtoupper($row->sous_prefecture) . '</td>
                      </tr>
                      <tr>
                        <th>Localité</th>
                        <td>' . strtoupper($row->localite) . '</td>
                      </tr>
                      <tr>
                        <th>Date de Naissance</th>
                        <td>' . $row->date_naissance . '</td>
                      </tr>
                      <tr>
                        <th>Lieu de Naissance</th>
                        <td>' . strtoupper($row->lieu_naissance) . '</td>
                      </tr>
                      <tr>
                        <th>Sous-préfecture du Lieu de Naissance</th>
                        <td>' . strtoupper($row->sous_pref_naissance) . '</td>
                      </tr>
                      <tr>
                        <th>Département du Lieu de Naissance</th>
                        <td>' . strtoupper($row->departement_naissance) . '</td>
                      </tr>
                      <tr>
                        <th>Type de Pièce d\'Identité</th>
                        <td>' . strtoupper($row->type_piece_identite) . '</td>
                      </tr>
                      <tr>
                        <th>Numéro de Pièce</th>
                        <td>' . strtoupper($row->numero_piece) . '</td>
                      </tr>
                      <tr>
                        <th>Autre Pièce</th>
                        <td>' . strtoupper($row->autre_piece) . '</td>
                      </tr>
                      <tr>
                        <th>Contact Téléphonique</th>
                        <td>' . $row->contact_telephonique . '</td>
                      </tr>
                      <tr>
                        <th>Superficie Totale</th>
                        <td>' . $row->superficie_totale . ' Hectares</td>
                      </tr>
                      <tr>
                        <th>Délégué Village</th>
                        <td>' . strtoupper($row->delegue_village) . '</td>
                      </tr>
                    </table>
                  </div>
                  <!-- Section de la photo à droite -->
                  <div class="col-md-4 row gap-2">
                  <div class="col-md-12 text-right" style=" margin-left: 0px";>
                    <img src="uploads/' . $row->photo . '" alt="Photo du Producteur" style="width: 300px; height: 300px; object-fit: cover; border: 2px solid #ccc; margin-left: 20px;">
                  </div>

                  <div class="col-md-12 text-right" style=" margin-left: 0px";>
                    <img src="pieces/' . $row->photo_recto . '" alt="Photo du Producteur" style="width: 300px; height: 300px; object-fit: cover; border: 2px solid #ccc; margin-left: 20px;">
                  </div>

                  <div class="col-md-12 text-right" style=" margin-left: 0px";>
                    <img src="pieces/' . $row->photo_verso . '" alt="Photo du Producteur" style="width: 300px; height: 300px; object-fit: cover; border: 2px solid #ccc; margin-left: 20px;">
                  </div>
                  </div>
                </div>

                <!-- Section de la signature en bas, centrée -->
                <div class="row mt-5">
                  <div class="col-md-12 text-center">
                    <h5>Signature du Producteur</h5>
                    <img src="signatures/' . $row->signature . '" alt="Signature du Producteur" style="width: 300px; height: 150px; object-fit: contain; border: 2px solid #000;">
                  </div>
                </div>';
              }
              ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const images = document.querySelectorAll('img');

    images.forEach(img => {
        const originalSrc = img.src;
        img.src = originalSrc + '?' + new Date().getTime();
    });
});
</script>

<?php
include_once "footer.php";
?>

<?php
include_once "footer.php";
?>