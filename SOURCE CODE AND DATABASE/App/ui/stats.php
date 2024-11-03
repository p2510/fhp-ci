<?php

include_once 'connectdb.php';
session_start();

if ($_SESSION['useremail'] == '' or $_SESSION['role'] == 'User') {
    header('location:../index.php');
}

if ($_SESSION['role'] == 'Admin') {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

error_reporting(0);

// sendlog($pdo,
//   'Consultation',
//   $_SESSION["username"]." a consulté les statistiques",
//   'Succès',

//   $_SESSION["userid"],
//   $_SESSION["username"],

//   'Statistiques',
//   null,
//   null,
// );

# Nombre total de producteurs par secteur
$select = $pdo->prepare('select count(*) as total_producteurs from tbl_producteurs');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_producteurs = $row->total_producteurs;



$select = $pdo->prepare('select sum(superficie_totale) as total_superficie from tbl_producteurs');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_superficie = $row->total_superficie;

$select = $pdo->prepare('select count(*) as total_users from tbl_user');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_users = $row->total_users;

$select = $pdo->prepare('select count(distinct(actor_id)) as total_active_users from tbl_events where DATE(created_at) = CURDATE()');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$online_users = $row->total_active_users;


$select = $pdo->prepare('select count(*) as total_producteurs_day from tbl_producteurs where DATE(created_at) = CURDATE()');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_producteurs_day = $row->total_producteurs_day;

$select = $pdo->prepare('select count(*) as total_producteurs_week from tbl_producteurs WHERE YEARWEEK(created_at, 1) = YEARWEEK(CURDATE(), 1)');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_producteurs_week = $row->total_producteurs_week;

$select = $pdo->prepare('select count(*) as total_producteurs_month from tbl_producteurs WHERE MONTH(created_at) = MONTH(CURDATE()) AND YEAR(created_at) = YEAR(CURDATE())');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_producteurs_month = $row->total_producteurs_month;

$select = $pdo->prepare('select count(*) as total_producteurs_year from tbl_producteurs WHERE YEAR(created_at) = YEAR(CURDATE())');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_producteurs_year = $row->total_producteurs_year;
?>


<!-- TODO:
Statistiques Clés pour le Tableau de Bord

-->

<!-- ChartJS -->
<script src="../plugins/chart.js/Chart.min.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Statistiques</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <!-- <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">Starter Page</li> -->
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
                    <!--
                        2. Nombre de Producteurs ajoutés quotidiennement. ✅

                        3. Nombre de Producteurs ajoutés mensuellement. ✅

                        4. Nombre de Producteurs ajoutés annuellement. ✅

                        13. Nombre d'utilisateurs actifs quotidiennement. ⚠️
                    -->
                    <div class="row">
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3><?php echo $total_producteurs; ?></h3>
                                    <p>Total Producteurs</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-danger">
                                <div class="inner">
                                    <h3><?php echo $total_superficie; ?> m&sup2;</h3>
                                    <p>Superficie Totale des Producteurs</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-pie-graph"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3><?php echo $total_users; ?></h3>

                                    <p>Total Utilisateurs</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3><?php echo $online_users; ?></h3>

                                    <p>Utilisateurs actifs</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-people-outline"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-dark">
                                <div class="inner">
                                    <h3><?php echo $total_producteurs_day; ?></h3>
                                    <p>Producteurs ajoutés aujourd'hui</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-light">
                                <div class="inner">
                                    <h3><?php echo $total_producteurs_week; ?></h3>
                                    <p>Producteurs ajoutés cette semaine</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-secondary">
                                <div class="inner">
                                    <h3><?php echo $total_producteurs_month; ?></h3>
                                    <p>Producteurs ajoutés ce mois</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-pie-graph"></i>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-primary">
                                <div class="inner">
                                    <h3><?php echo $total_producteurs_year; ?></h3>
                                    <p>Producteurs ajoutés cette année</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">Performances sur les 30 derniers jours</h5>
                                </div>
                                <div class="card-body">
                                    <?php
                                    // $select = $pdo->prepare("select DATE_FORMAT(`created_at`, '%Y-%m-%d') as created_at , count(*) as total  from tbl_producteurs
                                    $select = $pdo->prepare("WITH RECURSIVE DateRange AS (SELECT CURDATE() AS created_at UNION SELECT created_at - INTERVAL 1 DAY FROM DateRange WHERE created_at > CURDATE() - INTERVAL 29 DAY) SELECT DATE_FORMAT(dr.created_at, '%Y-%m-%d') AS created_at, COUNT(tp.created_at) AS total FROM DateRange dr LEFT JOIN tbl_producteurs tp ON DATE(tp.created_at) = dr.created_at GROUP BY dr.created_at ORDER BY dr.created_at DESC;");
                                    $select->execute();
                                    $ttl = [];
                                    $date = [];
                                    while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                        extract($row);
                                        $ttl[] = $total;
                                        $date[] = $created_at;
                                    }
                                    // echo json_encode($total);
                                    ?>
                                    <div>
                                        <canvas id="perfLine" style="height: 250px"></canvas>
                                    </div>
                                </div>
                                <script>
                                    const perfLineCtx = document.getElementById('perfLine');
                                    new Chart(perfLineCtx, {
                                        type: 'line',
                                        data: {
                                            labels: <?php echo json_encode($date); ?>,
                                            datasets: [{
                                                label: 'Inscriptions de producteurs',
                                                borderColor: '#2B9720',
                                                data: <?php echo json_encode($ttl); ?>,
                                                borderWidth: 2,
                                                fill: false,
                                                // tension: 0.9,
                                            }],
                                        },
                                        options: {
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
                                </script>
                            </div>
                            <div class="card card-warning card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">Statistiques additionnelles</h5>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <p class=" mb-0 font-weight-bold">
                                            Répartition des délégués
                                        </p>
                                        <?php
                                        $select = $pdo->prepare('select count(*) as total_delegue from tbl_producteurs where delegue_village="oui"');
                                        $select->execute();
                                        $row = $select->fetch(PDO::FETCH_OBJ);
                                        $ttl_delegue = $row->total_delegue;

                                        $ttl_cultivateur = $total_producteurs - $ttl_delegue;
                                        ?>
                                        <div class="d-flex justify-content-between">
                                            <p>Délégués : <?php echo $ttl_delegue; ?></p>
                                            <p>Cultivateurs : <?php echo $ttl_cultivateur; ?></p>
                                        </div>
                                        <div class="progress mb-3">
                                            <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="40"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: <?php echo number_format(($ttl_delegue / ($total_producteurs ? $total_producteurs : 1)) * 100, 2); ?>%">
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <p class=" mb-0 font-weight-bold">
                                            Producteurs avec des photos
                                        </p>
                                        <?php
                                        $select = $pdo->prepare('select count(*) as total_photos from tbl_producteurs where photo is not null');
                                        $select->execute();
                                        $row = $select->fetch(PDO::FETCH_OBJ);
                                        $ttl_photos = $row->total_photos;

                                        $ttl_nophotos = $total_producteurs - $ttl_photos;
                                        ?>
                                        <div class="d-flex justify-content-between">
                                            <p>Avec : <?php echo $ttl_photos; ?></p>
                                            <p>Sans : <?php echo $ttl_nophotos; ?></p>
                                        </div>
                                        <div class="progress mb-3">
                                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="40"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: <?php echo number_format(($ttl_photos / ($total_producteurs ? $total_producteurs : 1)) * 100, 2); ?>%">
                                            </div>
                                            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="40"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: <?php echo number_format(($ttl_nophotos / ($total_producteurs ? $total_producteurs : 1)) * 100, 2); ?>%">
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <p class=" mb-0 font-weight-bold">
                                            Producteurs avec des signatures
                                        </p>
                                        <?php
                                        $select = $pdo->prepare('select count(*) as total_signatures from tbl_producteurs where signature is not null');
                                        $select->execute();
                                        $row = $select->fetch(PDO::FETCH_OBJ);
                                        $ttl_signatures = $row->total_signatures;

                                        $ttl_nosignatures = $total_producteurs - $ttl_signatures;
                                        ?>
                                        <div class="d-flex justify-content-between">
                                            <p>Avec : <?php echo $ttl_signatures; ?></p>
                                            <p>Sans : <?php echo $ttl_nosignatures; ?></p>
                                        </div>
                                        <div class="progress mb-3">
                                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="40"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: <?php echo number_format(($ttl_signatures / ($total_producteurs ? $total_producteurs : 1)) * 100, 2); ?>%">
                                            </div>
                                            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="40"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: <?php echo number_format(($ttl_nosignatures / ($total_producteurs ? $total_producteurs : 1)) * 100, 2); ?>%">
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <p class=" mb-0 font-weight-bold">
                                            Producteurs dont les cartes ont été générées
                                        </p>
                                        <?php
                                        $select = $pdo->prepare('select count(distinct(subject_id)) as total_prod_with_cards from tbl_events where event_type="Génération Carte"');
                                        $select->execute();
                                        $row = $select->fetch(PDO::FETCH_OBJ);
                                        $ttl_prod_with_cards = $row->total_prod_with_cards;
                                        $ttl_noprod_with_cards = $total_producteurs - $ttl_prod_with_cards;
                                        ?>
                                        <div class="d-flex justify-content-between">
                                            <p>Cartes générées : <?php echo $ttl_prod_with_cards; ?></p>
                                            <p>Pas de carte : <?php echo $ttl_noprod_with_cards; ?></p>
                                        </div>
                                        <div class="progress mb-3">
                                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="40"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: <?php echo number_format(($ttl_prod_with_cards / ($total_producteurs ? $total_producteurs : 1)) * 100, 2); ?>%">
                                            </div>
                                            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="40"
                                                aria-valuemin="0" aria-valuemax="100"
                                                style="width: <?php echo number_format(($ttl_noprod_with_cards / ($total_producteurs ? $total_producteurs : 1)) * 100, 2); ?>%">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">Producteurs par secteur</h5>
                                    <!-- 1. Nombre total de Producteurs par Secteur. ✅ -->
                                </div>
                                <div class="card-body">
                                    <?php
                                    $select = $pdo->prepare('select secteur_name, count(*) as total from tbl_producteurs group by secteur_name');
                                    $select->execute();
                                    $ttl = [];
                                    $date = [];
                                    while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                        extract($row);
                                        $ttl[] = $total;
                                        $names[] = $secteur_name;
                                    }
                                    // echo json_encode($total);
                                    ?>
                                    <div>
                                        <canvas id="secteurPie" style="height: 250px"></canvas>
                                    </div>
                                </div>
                                <script>
                                    const ctx1 = document.getElementById('secteurPie');
                                    new Chart(ctx1, {
                                        type: 'pie',
                                        data: {
                                            labels: <?php echo json_encode($names); ?>,
                                            datasets: [{
                                                label: 'Répartition par secteur',
                                                backgroundColor: [
                                                    '#B7B3A1', '#134074', '#FD5200', '#FF784F', '#8B9EB7',
                                                    '#228CDB', '#F6F740', '#CF4D6F', '#DDF093', '#F9627D',
                                                    '#28AFB0', '#35012C', '#FFAFC5', '#6F9CEB', '#8DA9C4',
                                                    '#712F79', '#8F2D56', '#2CEAA3', '#AAA1C8', '#2D0605',
                                                    '#A690A4', '#D0D38F', '#95B8D1', '#659157', '#9C92A3',
                                                ],
                                                data: <?php echo json_encode($ttl); ?>,
                                                borderWidth: 1
                                            }]
                                        },
                                    });
                                </script>
                            </div>
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h5 class="m-0">Ajouts par Utilisateur (période : 1 mois)</h5>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-hover " id="table_ajouts">
                                        <thead>
                                            <tr>
                                                <td>Classement</td>
                                                <td>Utilisateur</td>
                                                <td>Producteurs ajoutés</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            // ALL TIME RANKING
                                            // $select = $pdo->prepare('SELECT u.username AS created_by, COUNT(p.created_by) AS total_user FROM tbl_user u LEFT JOIN tbl_producteurs p ON u.username = p.created_by GROUP BY u.username ORDER BY total_user DESC;');
                                            $select = $pdo->prepare('SELECT u.username AS created_by, COUNT(p.created_by) AS total_user FROM tbl_user u LEFT JOIN tbl_producteurs p ON u.username = p.created_by AND MONTH(p.created_at) = MONTH(CURDATE()) AND YEAR(p.created_at) = YEAR(CURDATE()) GROUP BY u.username ORDER BY total_user DESC');
                                            $select->execute();
                                            $rank=1;
                                            while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                                echo '
                                                    <tr>
                                                        <td>'.$rank.'</td>
                                                        <td>'.$row->created_by.'</td>
                                                        <td>'.$row->total_user.'</td>
                                                    </tr>';
                                                $rank+=1;
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col-md-6 -->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

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
