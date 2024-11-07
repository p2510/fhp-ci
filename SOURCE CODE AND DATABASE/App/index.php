<?php
include_once 'ui/connectdb.php';
session_start();



if (isset($_POST['btn_login'])) {
    $useremail = $_POST['txt_email'];
    $password = $_POST['txt_password'];

    // Prépare et exécute la requête pour sélectionner l'utilisateur
    $select = $pdo->prepare("SELECT * FROM tbl_user WHERE useremail = :email AND userpassword = :password");
    $select->bindParam(':email', $useremail);
    $select->bindParam(':password', $password);
    $select->execute();

    $row = $select->fetch(PDO::FETCH_ASSOC);
    if ($row) {
        sendlog(
            $pdo,
            'Connexion',
            $row['username'] . " s'est connecté avec succès",
            'Succès',
            $row['userid'],
            $row['username'],
            'Connexion',
            null,
            null
        );

        // Configuration des variables de session
        $_SESSION['userid'] = $row['userid'];
        $_SESSION['username'] = $row['username'];
        $_SESSION['useremail'] = $row['useremail'];
        $_SESSION['role'] = $row['role'];
        $_SESSION['status'] = 'Connexion Validée';
        $_SESSION['status_code'] = 'success';

        if ($row['role'] == 'Admin') {
            header('refresh: 1; ui/dashboard.php');
            exit;
        } elseif ($row['role'] == 'User') {
            header('refresh: 3; ui/addproduct.php');
            exit;
        } elseif ($row['role'] == 'Middle') {
            header('refresh: 3; ui/dashboard.php'); 
            exit;
        }
    } else {
        // Enregistrement de l'échec de la connexion
        sendlog(
            $pdo,
            'Connexion',
            'Tentative de connexion à ' . $useremail . ' échouée',
            'Échec',
            null,
            'N/A',
            'Connexion',
            null,
            null
        );

        $_SESSION['status'] = 'Mot de passe ou email incorrect';
        $_SESSION['status_code'] = 'error';
    }
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="dist/img/fph-ci.png">
    <title>FPH-CI Identification System | Connexion</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css"> -->

    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
    <!-- Toastr -->
    <link rel="stylesheet" href="plugins/toastr/toastr.min.css">

    <link rel="stylesheet" href="dist/css/adminlte.min.css">


</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <di class="card card-outline card-primary" style="display: flex; align-items: center;">
            <img src="dist/img/fph-ci.png" alt=""
                style="width: 300px; height: auto; margin-right: 10px; padding-top: 20px">
            <div class="card-header text-center">
                <a href="" class="h1"><b>FPH-CI Identification Producteurs</b></a>
            </div>

            <div class="card-body">
                <p class="login-box-msg">Connectez Vous</p>

                <form action="" method="post">
                    <div class="input-group mb-3">

                        <input type="email" class="form-control" placeholder="Email" name="txt_email" required>


                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">

                        <input type="password" class="form-control" placeholder="Mot de Passe" name="txt_password"
                            required>


                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                        </div>
                        <!-- /.col -->
                        <div class="col-6">
                            <button type="submit" class="btn btn-block" name="btn_login"
                                style="background-color: #447748; border-color: #447748; color: #fff;">Connexion</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>


                <!-- /.social-auth-links -->

                <p class="mb-1">

                </p>
                <p class="mb-0">

                </p>
            </div>
            <!-- /.card-body -->
    </div>
    <!-- /.card -->
    </div>
    <!-- /.login-box -->



</body>


</html>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- SweetAlert2 -->
<script src="plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="plugins/toastr/toastr.min.js"></script>
<!-- AdminLTE App -->

<script src="dist/js/adminlte.min.js"></script>





<?php
  if(isset($_SESSION['status']) && $_SESSION['status']!='')

  {

?>
<script>
$(function() {
    var Toast = Swal.mixin({
        toast: true,
        position: 'top',
        showConfirmButton: false,
        timer: 5000
    });


    Toast.fire({
        icon: '<?php echo $_SESSION['status_code']; ?>',
        title: '<?php echo $_SESSION['status']; ?>'
    })
});
</script>


<?php
unset($_SESSION['status']);
  }
  ?>