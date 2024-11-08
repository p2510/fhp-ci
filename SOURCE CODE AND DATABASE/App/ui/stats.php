<?php
include_once 'connectdb.php';
session_start();
include_once 'guard.php';

if ($_SESSION['useremail'] == "" ) {
    header('location:../index.php');
}
AccessGuard::protectPage('stats');

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
<script src="../plugins/chart.js/Chart.min.js"></script>
<script>
function generateRandomColor() {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgb(${r}, ${g}, ${b})`;
}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Statistiques avancés</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">

                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h5 class="m-0">Les délégués</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
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
                                        $select = $pdo->prepare("SELECT * FROM tbl_producteurs WHERE delegue_village='oui' ORDER BY producteur_id ASC");
                                        $select->execute();
                                        $data  = $select;

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

                        <div class="card-footer">
                            <?php
                            $query = $pdo->prepare("SELECT * FROM tbl_producteurs WHERE delegue_village='oui'");
                            $query->execute();
                            $total = $query->fetchAll();
                            ?>
                            <h4>Total : <span><?= count($total) ?></span></h4>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card card-danger card-outline">
                        <div class="card-header">
                            <h5 class="mb-0">Nombre de producteur inscrit</h5>
                        </div>
                        <div class="card-body">
                            <?php
                            // Récupération des dates de filtre depuis le formulaire
                            $startDate = isset($_GET['start_date']) ? $_GET['start_date'] : null;
                            $endDate = isset($_GET['end_date']) ? $_GET['end_date'] : null;

                            // Construction de la requête SQL avec les filtres de date
                            $query = "SELECT DATE_FORMAT(`created_at`, '%Y-%m-%d') as created_at, COUNT(*) as total FROM tbl_producteurs";
                            $params = [];

                            if ($startDate && $endDate) {
                                $query .= " WHERE `created_at` BETWEEN :start_date AND :end_date";
                                $params = ['start_date' => $startDate, 'end_date' => $endDate];
                            } elseif ($startDate) {
                                $query .= " WHERE `created_at` >= :start_date";
                                $params = ['start_date' => $startDate];
                            } elseif ($endDate) {
                                $query .= " WHERE `created_at` <= :end_date";
                                $params = ['end_date' => $endDate];
                            }

                            $query .= " GROUP BY created_at";
                            $select = $pdo->prepare($query);
                            $select->execute($params);

                            $ttl = [];
                            $date = [];
                            while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                $ttl[] = $row['total'];
                                $date[] = $row['created_at'];
                            }
                            ?>
                            <form method="GET" action="" class="row">
                                <div class="col-lg-4">
                                    <!-- <label for="start_date" class="form-label">Date de début :</label> -->
                                    <input type="date" id="start_date" class="form-control" name="start_date"
                                        value="<?php echo isset($_GET['start_date']) ? $_GET['start_date'] : ''; ?>">
                                </div>

                                <div class="col-lg-4">
                                    <!-- <label for="end_date" class="form-label">Date de fin :</label> -->
                                    <input type="date" id="end_date" class="form-control" name="end_date"
                                        value="<?php echo isset($_GET['end_date']) ? $_GET['end_date'] : ''; ?>">
                                </div>

                                <div class="col-lg-4">
                                    <button class="btn btn-primary" type="submit">Filtrer</button>
                                </div>
                            </form>
                            <div>
                                <canvas id="myProducteurByDate"></canvas>
                            </div>

                        </div>
                        <div class="card-footer">
                            <h4>Total : <span><?= count($ttl) ?></span></h4>
                        </div>
                        <script>
                        const ctx = document.getElementById('myProducteurByDate')
                        try {
                            new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: <?php echo json_encode($date); ?>,
                                    datasets: [{
                                        label: 'Inscriptions de producteurs',
                                        backgroundColor: 'rgb(255,99,132)',
                                        borderColor: 'rgb(255,99,132)',
                                        data: <?php echo json_encode($ttl); ?>,
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                        } catch (error) {
                            console.log(error);
                        }
                        </script>
                    </div>
                </div>

                <div class="col-lg-6">
                    <?php
                    // Récupération des dates de filtre depuis le formulaire
                    $startDate = isset($_GET['start_date_event']) ? $_GET['start_date_event'] : null;
                    $endDate = isset($_GET['end_date_event']) ? $_GET['end_date_event'] : null;

                    // Construction de la requête SQL avec les filtres de date
                    $query = "SELECT DATE_FORMAT(`created_at`, '%Y-%m-%d') as created_at, COUNT(*) as total FROM tbl_events";
                    $params = [];

                    if ($startDate && $endDate) {
                        $query .= " WHERE `created_at` BETWEEN :start_date AND :end_date";
                        $params = ['start_date' => $startDate, 'end_date' => $endDate];
                    } elseif ($startDate) {
                        $query .= " WHERE `created_at` >= :start_date";
                        $params = ['start_date' => $startDate];
                    } elseif ($endDate) {
                        $query .= " WHERE `created_at` <= :end_date";
                        $params = ['end_date' => $endDate];
                    }

                    $query .= " GROUP BY created_at";
                    $select = $pdo->prepare($query);
                    $select->execute($params);

                    $ttl = [];
                    $date = [];
                    while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                        $ttl[] = $row['total'];
                        $date[] = $row['created_at'];
                    }
                    ?>
                    <div class="card card-danger card-outline">
                        <div class="card-header">
                            <h5 class="mb-0">Nombre d'évènements</h5>
                        </div>
                        <div class="card-body">
                            <form method="GET" action="" class="row">
                                <div class="col-lg-4">
                                    <!-- <label for="start_date" class="form-label">Date de début :</label> -->
                                    <input type="date" id="start_date_event" class="form-control"
                                        name="start_date_event"
                                        value="<?php echo isset($_GET['start_date_event']) ? $_GET['start_date_event'] : ''; ?>">
                                </div>

                                <div class="col-lg-4">
                                    <!-- <label for="end_date" class="form-label">Date de fin :</label> -->
                                    <input type="date" id="end_date_event" class="form-control" name="end_date_event"
                                        value="<?php echo isset($_GET['end_date_event']) ? $_GET['end_date_event'] : ''; ?>">
                                </div>

                                <div class="col-lg-4">
                                    <button class="btn btn-primary" type="submit">Filtrer</button>
                                </div>
                            </form>
                            <canvas id="myEvents"></canvas>
                        </div>
                        <div class="card-footer">
                            <h4>Total : <span><?= count($ttl) ?></span></h4>
                        </div>
                        <script>
                        const events = document.getElementById('myEvents')
                        new Chart(events, {
                            type: "line",
                            data: {
                                labels: <?= json_encode($date) ?>,
                                datasets: [{
                                    label: 'My First Dataset',
                                    data: <?= json_encode($ttl) ?>,
                                    fill: false,
                                    borderColor: 'rgb(75, 192, 192)',
                                    tension: 0.1
                                }]
                            }
                        })
                        </script>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card card-info card-outline">
                        <div class="card-header">
                            <h5 class="mb-0">Nombre de plantation par secteur</h5>
                        </div>
                        <div class="card-body">
                            <?php
                            $query = "SELECT secteur_name AS secteur, COUNT(*) AS total FROM tbl_plantations GROUP BY secteur_name";
                            $select = $pdo->prepare($query);
                            $select->execute();
                            $sect = [];
                            $data = [];

                            while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                $sect[] = $row['secteur'];
                                $data[] = $row['total'];
                            }
                            ?>

                            <div>
                                <canvas id="myPlantation"></canvas>
                            </div>
                            <script>
                            const backgroundColorSect = <?= json_encode($sect); ?>.map(() => generateRandomColor());
                            const plantations = document.getElementById('myPlantation')
                            new Chart(plantations, {
                                type: 'doughnut',
                                data: {
                                    labels: <?= json_encode($sect); ?>,
                                    datasets: [{
                                        label: 'My First Dataset',
                                        data: <?= json_encode($data); ?>,
                                        backgroundColor: backgroundColorSect,
                                        hoverOffset: 4
                                    }]
                                }
                            })
                            </script>
                        </div>

                        <div class="card-footer">
                            <h4>Total : <span><?= count($data) ?></span></h4>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="card card-warning card-outline">
                        <div class="card-header">
                            <h5 class="mb-0">Nombre de produit par catégorie</h5>
                        </div>
                        <div class="card-body">
                            <?php
                            $query = "SELECT category AS category, COUNT(*) AS total FROM tbl_product GROUP BY category";
                            $select = $pdo->prepare($query);
                            $select->execute();
                            $cat = [];
                            $total = [];

                            while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                $cat[] = $row['category'];
                                $total[] = $row['total'];
                            }
                            ?>
                            <div>
                                <canvas id="myProduct" style="height: 200px;"></canvas>
                            </div>

                            <script>
                            const backgroundColors = <?= json_encode($cat); ?>.map(() => generateRandomColor());

                            const product = document.getElementById('myProduct')
                            new Chart(product, {
                                type: 'pie',
                                data: {
                                    labels: <?= json_encode($cat); ?>,
                                    datasets: [{
                                        label: 'My First Dataset',
                                        data: <?= json_encode($total); ?>,
                                        backgroundColor: backgroundColors,
                                        hoverOffset: 4
                                    }]
                                }
                            })
                            </script>
                        </div>
                        <div class="card-footer">
                            <h4>Total : <span><?= count($total) ?></span></h4>
                        </div>
                    </div>
                </div>

                <!-- <div class="col-lg-6">
                    <div class="card card-success card-outline">
                        <div class="card-header">
                            <h5 class="mb-0"></h5>
                        </div>
                    </div>
                </div> -->

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
if (isset($_SESSION['status']) && $_SESSION['status'] != '') {

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