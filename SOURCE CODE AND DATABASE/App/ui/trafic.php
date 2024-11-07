<?php
include_once 'connectdb.php';
session_start();
include_once 'guard.php';

if ($_SESSION['useremail'] == ""  ) {
    header('location:../index.php');
}

AccessGuard::protectPage('trafic');

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}


sendlog(
  $pdo,
  'Consultation',
  $_SESSION['username'] . " a consulté la liste des délégués",
  'Succès',

  $_SESSION['userid'],
  $_SESSION['username'],

  'Producteur',
  null,
  'N/A',
);

?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Trafic</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">

                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h5 class="m-0">Trafic</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-hover" id="table_user">
                                <thead>
                                    <tr>
                                        <td>Utilisateur</td>
                                        <td>Nouveau producteur</td>
                                        <td>Plantation ajoutée</td>
                                        <td>Nombre de modifications</td>

                                    </tr>
                                </thead>

                                <tbody>
                                    <?php
                                 
                                    $query = $pdo->prepare("
                                            SELECT 
                                                u.username AS user,
                                                (SELECT COUNT(*) FROM tbl_producteurs p WHERE p.created_by = u.username) AS nb_producteurs,
                                                (SELECT COUNT(*) FROM tbl_plantations pl WHERE pl.created_by = u.username) AS nb_plantations,
                                                (SELECT COUNT(*) FROM tbl_events e WHERE e.actor_name = u.username AND e.event_type = 'Modification') AS nb_modifications
                                            FROM 
                                                tbl_user u
                                            WHERE 
                                                u.role = 'User'
                                            GROUP BY 
                                                u.username;
                                        ");
                                        $query->execute();
                                       
                                    while ($row = $query->fetch(PDO::FETCH_OBJ)) {
                                        echo '
                                        
                                        <tr>
                                            <td>' . htmlspecialchars($row->user) . '</td>
                                            <td>' . htmlspecialchars($row->nb_producteurs) . '</td>
                                            <td>' . htmlspecialchars($row->nb_plantations) . '</td>
                                            <td>' . htmlspecialchars($row->nb_modifications) . '</td>
                                           
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
    $('#table_user').DataTable();

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