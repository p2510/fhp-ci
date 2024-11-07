<?php

include_once 'connectdb.php';
session_start();

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
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>403 - Accès interdit</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="dashboard.php">dashboard</a></li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="error-page">
            <h2 class="headline text-warning"> 404</h2>

            <div class="error-content">
                <h3><i class="fas fa-exclamation-triangle text-warning"></i> Oops! Accès interdit.</h3>

                <p>
                    Cette page est accessible uniquement aux utilisateurs autorisés. Cliquez ici pour retourner au <a
                        href="dashboard.php">dashboard</a>.
                </p>



            </div>
            <!-- /.error-content -->
        </div>
        <!-- /.error-page -->
    </section>
    <!-- /.content -->
</div>




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