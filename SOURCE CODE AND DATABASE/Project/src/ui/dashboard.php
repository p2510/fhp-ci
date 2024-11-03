<?php

include_once 'connectdb.php';
session_start();

if ($_SESSION['useremail'] == '') {
    header('location:../index.php');
}

include_once 'header.php';

// $select =$pdo->prepare("select sum(total) as gt , count(invoice_id) as invoice from tbl_invoice");
// $select->execute();

// $row=$select->fetch(PDO::FETCH_OBJ);

// $total_order=$row->invoice;
// $grand_total=$row->gt;

$select = $pdo->prepare('select count(*) as total_producteurs from tbl_producteurs');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_product = $row->total_producteurs;

$select = $pdo->prepare("select count(*) as total_delegue from tbl_producteurs where delegue_village='oui'");
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_delegue = $row->total_delegue;

$select = $pdo->prepare('select count(*) as total_secteurs from tbl_secteurs');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_secteurs = $row->total_secteurs;

$select = $pdo->prepare('select count(*) as total_user from tbl_user');
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);
$total_users = $row->total_user;

?>

<!-- ChartJS -->
<script src="../plugins/chart.js/Chart.min.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
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
                          <h3><?php echo $total_product; ?></h3>

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
                          <h3><?php echo $total_secteurs; ?></h3>
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
                          <h3><?php echo $total_delegue; ?></h3>

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
                          <h3><?php echo $total_users; ?></h3>

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
                        $select = $pdo->prepare("select DATE_FORMAT(`created_at`, '%Y-%m-%d') as created_at , count(*) as total  from tbl_producteurs  group by created_at LIMIT 50");
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
                      <table class="table table-striped table-hover " id="table_ajouts">
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
                              $select = $pdo->prepare('select secteur_code, secteur_name, count(*) as total from tbl_producteurs group by secteur_name order by total desc limit 5');
                              $select->execute();
                              $counter=1;
                              while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                  echo '
                                    <tr>
                                      <td>'.$counter.'</td>
                                      <td>'.$row->secteur_name.'</td>
                                      <td>'.$row->secteur_code.'</td>
                                      <td><span class="badge badge-success">' .$row->total.'</span></td>
                                    </tr>';
                                    $counter+=1;
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
                    <table class="table table-striped table-hover " id="table_ajouts">
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

                            $select = $pdo->prepare('select * from tbl_producteurs  order by producteur_id DESC LIMIT 5');
                            $select->execute();

                            while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                echo '
                            <tr>
                              <td><a href="editproducteur.php?id=' .$row->producteur_id .'">' .$row->producteur_id .'</a></td>
                              <td><span class="badge badge-danger">' .$row->producteur_code .'</span></td>
                              <td><span class="badge badge-dark">' .$row->secteur_name .'</span></td>
                              <td><span class="badge badge-dark">' .$row->created_at .'</span></td>
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
                            <table class="table table-striped table-hover " id="table_recentorder">
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
                                    $select = $pdo->prepare('select * from tbl_user  order by userid DESC LIMIT 10');
                                    $select->execute();

                                    while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                      echo '
                                  <tr>
                                    <td><span>' .$row->userid .'</span></td>
                                    <td><span>' .$row->username .'</span></td>
                                    <td><span>' .substr($row->useremail, 0, 15).'...</span></td>
                                    <td><span class="badge badge-dark">' .$row->role .'</span></td>
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

<script>
    $(document).ready(function() {
        $('#table_recentorder').DataTable({

            "order": [
                [0, "desc"]
            ]
        });
    });
</script>
