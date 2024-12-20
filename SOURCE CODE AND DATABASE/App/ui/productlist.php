<?php
include_once 'connectdb.php';
session_start();
include_once 'guard.php';

if ($_SESSION['useremail'] == "" ) {
    header('location:../index.php');
}
AccessGuard::protectPage('productlist');

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

include_once 'import_excel.php'; // Incluez le traitement d'importation


sendlog(
  $pdo,
  'Consultation',
  $_SESSION['username'] . " a consulté la liste des producteurs",
  'Succès',

  $_SESSION['userid'],
  $_SESSION['username'],

  'Producteur',
  null,
  'N/A',
);

?>

<!-- Ajoutez le code du formulaire d'importation dans une fenêtre modale -->
<div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="importModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="importModalLabel">Importer Producteurs par Excel</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Modifiez l'action du formulaire pour pointer vers le fichier import_excel_producteur.php -->
                <form action="import_excel.php" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="excel">Choisissez le fichier Excel:</label>
                        <input type="file" class="form-control-file" id="excel" name="excel" accept=".xls, .xlsx">
                    </div>
                    <button type="submit" class="btn btn-success" name="btnimport">Importer Fichier Excel</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Liste des Producteurs</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <!-- Ajoutez le bouton pour ouvrir la modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#importModal">
                            Importer Producteurs par Excel
                        </button>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h5 class="m-0">Liste des Producteurs :</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-hover" id="table_producteur">
                                <thead>
                                    <tr>
                                        <td>Code Producteur</td>
                                        <td>Nom Secteur</td>
                                        <td>Nom</td>
                                        <td>Prénom</td>
                                        <td>Superficie Totale</td>
                                        <td>Action</td>
                                    </tr>
                                </thead>

                                <tbody>
                                    <?php
                                    // Remplacez 'tbl_producteurs' par votre table réelle contenant les producteurs
                                    $select = $pdo->prepare("SELECT * FROM tbl_producteurs ORDER BY producteur_id ASC");
                                    $select->execute();

                                    while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                        echo '
<tr>
<td>' . $row->producteur_code . '</td>
<td>' . $row->secteur_name . '</td>
<td>' . $row->nom . '</td>
<td>' . $row->prenom . '</td>
<td>' . $row->superficie_totale . '</td>
<td>
    <div class="btn-group">
        <a href="viewproduct.php?id=' . $row->producteur_id . '" class="btn btn-warning btn-xs" role="button"><span class="fa fa-eye" style="color:#ffffff" data-toggle="tooltip" title="Voir Producteur"></span></a>
        <a href="editproducteur.php?id=' . $row->producteur_id . '" class="btn btn-success btn-xs" role="button"><span class="fa fa-edit" style="color:#ffffff" data-toggle="tooltip" title="Éditer Producteur"></span></a>

        <!-- Utilisation correcte de data-id -->
        <button data-id="' . $row->producteur_id . '" class="btn btn-danger btn-xs btndelete">
            <span class="fa fa-trash" style="color:#ffffff" data-toggle="tooltip" title="Supprimer Producteur"></span>
        </button>
    </div>
</td>
</tr>';

                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<?php
include_once "footer.php";
?>

<script>
$(document).ready(function() {
    // Initialise le tableau avec DataTables
    $('#table_producteur').DataTable();

    // Initialise les tooltips
    $('[data-toggle="tooltip"]').tooltip();

    // Gérer la suppression d'un producteur
    $('.btndelete').click(function() {
        var tdh = $(this);
        var id = $(this).data("id"); // Récupère l'ID depuis l'attribut 'data-id'

        // Affiche l'ID dans la console pour vérifier s'il est bien récupéré
        console.log("ID du producteur à supprimer : ", id);

        Swal.fire({
            title: 'Voulez-vous vraiment supprimer?',
            text: "Cette action est irréversible!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Oui, supprimez-le!'
        }).then((result) => {
            if (result.isConfirmed) {
                // Envoie une requête AJAX pour la suppression du producteur
                $.ajax({
                    url: 'productdelete.php', // Chemin vers le fichier PHP qui gère la suppression
                    type: 'post',
                    data: {
                        pidd: id // Envoie l'ID correctement
                    },
                    success: function(response) {
                        // Affiche la réponse du serveur dans la console
                        console.log("Réponse du serveur : ", response);

                        if (response.includes('succès')) {
                            // Cache la ligne du tableau après suppression réussie
                            tdh.parents('tr').hide();
                            Swal.fire(
                                'Supprimé!',
                                'Le producteur a été supprimé avec succès.',
                                'success'
                            );
                        } else {
                            Swal.fire(
                                'Erreur!',
                                'Une erreur est survenue lors de la suppression.',
                                'error'
                            );
                        }
                    },
                    error: function(xhr, status, error) {
                        // Affiche les erreurs éventuelles dans la console
                        console.error("Erreur dans la requête AJAX : ", error);
                        console.log("Détails de l'erreur : ", xhr.responseText);
                        Swal.fire(
                            'Erreur!',
                            'Impossible de contacter le serveur.',
                            'error'
                        );
                    }
                });
            }
        });
    });
});
</script>

<?php

include_once 'footer.php';

?>

<?php
  if(isset($_SESSION['status']) && $_SESSION['status']!='')

  {

?>
<script>
Swal.fire({
    icon: '<?php echo $_SESSION['status_code']; ?>',
    title: '<?php echo $_SESSION['status']; ?>'
});
</script>
<?php
unset($_SESSION['status']);
  }
  ?>