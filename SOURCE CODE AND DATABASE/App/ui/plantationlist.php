<?php
include_once 'connectdb.php';
session_start();
include_once 'guard.php';

if ($_SESSION['useremail'] == "" ) {
    header('location:../index.php');
}
AccessGuard::protectPage('plantationlist');

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

include_once 'import_excel.php'; // Incluez le traitement d'importation
?>

<!-- Ajoutez le code du formulaire d'importation dans une fenêtre modale -->
<div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="importModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="importModalLabel">Importer Plantations par Excel</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="import_excel_plantation.php" method="post" enctype="multipart/form-data">
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
                    <h1 class="m-0">Liste des Plantations</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#importModal">
                            Importer Plantations par Excel
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
                            <h5 class="m-0">Liste des Plantations :</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-hover" id="table_plantation">
                                <thead>
                                    <tr>
                                        <td>Code Plantation</td>
                                        <td>Code Producteur</td>
                                        <td>Nom Secteur</td>
                                        <td>Superficie Hectare</td>
                                        <td>Geolocalisé</td>
                                        <td>Action</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    // Remplacez 'tbl_plantations' par votre table réelle contenant les plantations
                                    $select = $pdo->prepare("SELECT * FROM tbl_plantations ORDER BY code_plantation ASC");
                                    $select->execute();

                                    while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                        echo '
<tr>
<td>' . $row->code_plantation . '</td>
<td>' . $row->producteur_code . '</td>
<td>' . $row->secteur_name . '</td>
<td>' . $row->superficie_hectares . '</td>
<td>' . $row->geolocalise . '</td>

<td>
    <div class="btn-group">
        <a href="viewplantation.php?id=' . $row->id . '" class="btn btn-warning btn-xs" role="button"><span class="fa fa-eye" style="color:#ffffff" data-toggle="tooltip" title="Voir Plantation"></span></a>
        <a href="editplantation.php?id=' . $row->id . '" class="btn btn-success btn-xs" role="button"><span class="fa fa-edit" style="color:#ffffff" data-toggle="tooltip" title="Éditer Plantation"></span></a>
        <button data-id="' . $row->id . '" class="btn btn-danger btn-xs btndelete">
            <span class="fa fa-trash" style="color:#ffffff" data-toggle="tooltip" title="Supprimer Plantation"></span>
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
    $('#table_plantation').DataTable();

    // Initialise les tooltips
    $('[data-toggle="tooltip"]').tooltip();

    // Gérer la suppression d'une plantation
    $('.btndelete').click(function() {
        var tdh = $(this);
        var id = $(this).data("id"); // Récupère l'ID depuis l'attribut 'data-id'

        console.log("ID de la plantation à supprimer : ", id);

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
                // Envoie une requête AJAX pour la suppression de la plantation
                $.ajax({
                    url: 'plantationdelete.php', // Chemin vers le fichier PHP qui gère la suppression
                    type: 'post',
                    data: {
                        pid: id // Envoie l'ID correctement
                    },
                    success: function(response) {
                        console.log("Réponse du serveur : ", response);

                        if (response.includes('succès')) {
                            tdh.parents('tr').hide();
                            Swal.fire(
                                'Supprimé!',
                                'La plantation a été supprimée avec succès.',
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
                        console.error("Erreur dans la requête AJAX : ", error);
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