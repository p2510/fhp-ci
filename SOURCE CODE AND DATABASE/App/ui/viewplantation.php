<?php
include_once 'connectdb.php';
session_start();
if ($_SESSION['useremail'] == "" OR $_SESSION['role'] == "User") {
    header('location:../index.php');
}

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

$id = $_GET['id'];

// Préparez et exécutez la requête pour obtenir les détails de la plantation
$select = $pdo->prepare("SELECT * FROM tbl_plantations WHERE id = :id");
$select->bindParam(':id', $id);
$select->execute();

// Récupérer les détails de la plantation sous forme d'objet
$row = $select->fetch(PDO::FETCH_OBJ);

if (!$row) {
    echo "<div class='alert alert-danger'>Aucune plantation trouvée avec cet ID.</div>";
    exit;
}
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Fiche Technique de la Plantation</h1>
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
                            <h5 class="m-0">Détails de la Plantation</h5>
                            <!-- Bouton d'impression -->
                            <div class="d-flex justify-content-end mb-3">
                                <a href="printplantation.php?id=<?php echo $row->id; ?>" class="btn btn-warning" role="button" target="_blank">
                                    <span class="fa fa-print" style="color:#ffffff" data-toggle="tooltip" title="Imprimer la Fiche Technique"> Imprimer Fiche Technique</span>
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <!-- Section des informations de la plantation -->
                                <div class="col-md-8">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Code Plantation</th>
                                            <td><?php echo strtoupper($row->code_plantation); ?></td>
                                        </tr>
                                        <tr>
                                            <th>Code Producteur</th>
                                            <td><?php echo strtoupper($row->producteur_code); ?></td>
                                        </tr>
                                        <tr>
                                            <th>Secteur</th>
                                            <td><?php echo strtoupper($row->secteur_name) . ' (' . strtoupper($row->secteur_code) . ')'; ?></td>
                                        </tr>
                                        <tr>
                                            <th>Département</th>
                                            <td><?php echo strtoupper($row->departement); ?></td>
                                        </tr>
                                        <tr>
                                            <th>Sous-Préfecture</th>
                                            <td><?php echo strtoupper($row->sous_prefecture); ?></td>
                                        </tr>
                                        <tr>
                                            <th>Village</th>
                                            <td><?php echo strtoupper($row->village); ?></td>
                                        </tr>
                                        <tr>
                                            <th>Superficie</th>
                                            <td><?php echo $row->superficie_hectares . ' Hectares'; ?></td>
                                        </tr>
                                        <tr>
                                            <th>Production Annuelle Estimée</th>
                                            <td><?php echo $row->production_annuelle_estimee . ' kg'; ?></td>
                                        </tr>
                                        <tr>
                                            <th>Année de Plantation</th>
                                            <td><?php echo $row->annee_plantation; ?></td>
                                        </tr>
                                        <tr>
                                            <th>Géolocalisé</th>
                                            <td><?php echo $row->geolocalise ? 'Oui' : 'Non'; ?></td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- Section de la photo à droite (optionnelle, si vous avez une photo de la plantation) -->
                                <div class="col-md-4 text-right" style="margin-left: 0px;">
                                    <!-- Si vous avez une colonne pour la photo de la plantation, décommentez la section ci-dessous -->
                                    <!-- <img src="uploads/<?php echo $row->photo; ?>" alt="Photo de la Plantation" style="width: 300px; height: 300px; object-fit: cover; border: 2px solid #ccc; margin-left: 20px;"> -->
                                </div>
                            </div>
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
