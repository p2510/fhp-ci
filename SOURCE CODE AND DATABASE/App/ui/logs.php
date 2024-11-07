<?php

include_once 'connectdb.php';
session_start();
include_once 'guard.php';
AccessGuard::protectPage('logs');
if ($_SESSION['role'] == 'Admin') {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}


// sendlog($pdo,
//   'Consultation',
//   $_SESSION["username"]." a consulté l'historique des événements",
//   'Succès',

//   $_SESSION["userid"],
//   $_SESSION["username"],

//   'Événements',
//   null,
//   null,
// );

error_reporting(0);
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Historique des événements</h1>
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
            <div class="card card-primary card-outline">
                <div class="card-header">
                    <h5 class="m-0">Évenements</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-striped table-hover" id="table_logs">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Acteur</td>
                                        <td>Type</td>
                                        <td>Ressource</td>
                                        <td>Description</td>
                                        <td>Adresse IP</td>
                                        <td>Statut</td>
                                        <td>Date</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $select = $pdo->prepare('select * from tbl_events order by event_id DESC');
                                    $select->execute();
                                    while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                        echo '
                                    <tr>
                                    <td>' .
                                            $row->event_id .
                                            '</td>
                                    <td>' .
                                            $row->actor_name.
                                            '</td>
                                    <td>' .
                                            $row->event_type .
                                            '</td>
                                    <td>' .
                                            $row->subject_type .
                                            '</td>
                                    <td>' .
                                            $row->event_description .
                                            '</td>
                                    <td>' .
                                            $row->event_source_IP .
                                            '</td>
                                    <td><span class="badge badge-'.($row->event_status=='Succès' ? 'success' : 'danger').'">' .
                                            $row->event_status .
                                            '</span></td>
                                    <td>' .
                                            $row->created_at .
                                    '</tr>';
                                    }

                                    ?>

                                </tbody>

                            </table>




                        </div>






                    </div>



                </div>
            </div>



        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script>
$(document).ready(function() {
    // Initialise le tableau avec DataTables
    $("#table_logs").DataTable({
        order: [
            [0, 'desc']
        ],
        columnDefs: [{
            target: 4,
            visible: false
        }],
        "responsive": true,
        "lengthChange": false,
        "autoWidth": false,
        "buttons": ["csv", "excel", "pdf", "colvis"],
    }).buttons().container().appendTo('#table_logs_wrapper .col-md-6:eq(0)');
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