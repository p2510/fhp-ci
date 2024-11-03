<!-- ChartJS -->
<script src="./../../plugins/chart.js/Chart.min.js"></script>
<!-- Content Wrapper. Contains page content -->

<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Tableau de Bord</h1>
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
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3><?php echo $totals['total_product']; ?></h3>
                                <p>Total Producteurs</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="productlist.php" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3><?php echo $totals['total_secteurs']; ?></h3>
                                <p>Total Secteurs</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="category.php" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>No </h3>
                                <!-- Assurez-vous d'avoir une méthode pour récupérer le total des délégués -->
                                <p>Délégués de Villages</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="delegue.php" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3><?php echo $totals['total_users']; ?></h3>
                                <p>Total Utilisateurs</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="registration.php" class="small-box-footer">More info <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">Ajouts par Date</h5>
                            </div>

                            <div class="card-body">
                                <?php
                                    // Récupération des données pour le graphique
                                    $select = $pdo->prepare("SELECT DATE_FORMAT(`created_at`, '%Y-%m-%d') AS created_at, COUNT(*) AS total FROM tbl_producteurs GROUP BY created_at LIMIT 50");
                                    $select->execute();
                                    $ttl = [];
                                    $date = [];
                                    while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                        $ttl[] = $row['total'];
                                        $date[] = $row['created_at'];
                                    }
                                    ?>
                                <div>
                                    <canvas id="myChart" style="height: 250px"></canvas>
                                </div>
                            </div>

                            <script>
                            const ctx = document.getElementById('myChart');
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
                            </script>
                        </div>
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">Secteurs les plus Actifs</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-hover" id="table_ajouts">
                                    <thead>
                                        <tr>
                                            <td>#</td>
                                            <td>Secteur</td>
                                            <td>Code</td>
                                            <td>Total Producteurs</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $select = $pdo->prepare('SELECT secteur_code, secteur_name, COUNT(*) AS total FROM tbl_producteurs GROUP BY secteur_name ORDER BY total DESC LIMIT 5');
                                            $select->execute();
                                            $counter = 1;
                                            while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                                echo '
                                                <tr>
                                                    <td>' . $counter . '</td>
                                                    <td>' . htmlspecialchars($row->secteur_name) . '</td>
                                                    <td>' . htmlspecialchars($row->secteur_code) . '</td>
                                                    <td><span class="badge badge-success">' . $row->total . '</span></td>
                                                </tr>';
                                                $counter += 1;
                                            }
                                            ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">Ajouts Récents</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-hover" id="table_ajouts">
                                    <thead>
                                        <tr>
                                            <td>#</td>
                                            <td>Code Producteur</td>
                                            <td>Secteur</td>
                                            <td>Date</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $select = $pdo->prepare('SELECT * FROM tbl_producteurs ORDER BY producteur_id DESC LIMIT 5');
                                            $select->execute();

                                            while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                                echo '
                                                <tr>
                                                    <td><a href="editproducteur.php?id=' . $row->producteur_id . '">' . $row->producteur_id . '</a></td>
                                                    <td><span class="badge badge-danger">' . htmlspecialchars($row->producteur_code) . '</span></td>
                                                    <td><span class="badge badge-dark">' . htmlspecialchars($row->secteur_name) . '</span></td>
                                                    <td><span class="badge badge-dark">' . htmlspecialchars($row->created_at) . '</span></td>
                                                </tr>';
                                            }
                                            ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">Utilisateurs récents</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-hover" id="table_recentorder">
                                    <thead>
                                        <tr>
                                            <td>#</td>
                                            <td>Nom</td>
                                            <td>Email</td>
                                            <td>Rôle</td>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <?php
                                        // Requête pour récupérer les 10 utilisateurs récents
                                        $select = $pdo->prepare('SELECT * FROM tbl_user ORDER BY userid DESC LIMIT 10');
                                        $select->execute();

                                        while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                            echo '
                                            <tr>
                                                <td><a href="edituser.php?id=' . $row->userid . '">' . htmlspecialchars($row->userid) . '</a></td>
                                                <td>' . htmlspecialchars($row->username) . '</td>
                                                <td>' . htmlspecialchars($row->useremail) . '</td>
                                                <td>' . htmlspecialchars($row->role) . '</td>
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
            <!-- /.row -->
        </div>
    </div>
</div>

<!-- /.content -->