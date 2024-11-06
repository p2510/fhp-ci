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

$id = $_GET['id'];

if (isset($id)) {
    $delete = $pdo->prepare('delete from tbl_user where userid =' . $id);

    if ($delete->execute()) {
        $_SESSION['status'] = 'Account deleted successfully';
        $_SESSION['status_code'] = 'success';
        sendlog(
            $pdo,
            'Suppression',
            $_SESSION['username'] . ' a supprimé l\'utilisateur N°' . $id,
            'Succès',

            $_SESSION['userid'],
            $_SESSION['username'],

            'Utilisateur',
            $id,
            'N/A',
        );
    } else {
        $_SESSION['status'] = 'Account Is Not Deleted';
        $_SESSION['status_code'] = 'warning';

        sendlog(
          $pdo,
          'Suppression',
          $_SESSION['username'] . " n'a pas pu supprimer l'utilisateur N°".$id,
          'Échec',

          $_SESSION['userid'],
          $_SESSION['username'],

          'Utilisateur',
          $id,
          'N/A',
        );
    }
}

if (isset($_POST['btnsave'])) {
    $username = $_POST['txtname'];
    $useremail = $_POST['txtemail'];
    $userpassword = $_POST['txtpassword'];
    $userrole = $_POST['txtselect_option'];

    if (isset($_POST['txtemail'])) {
        $select = $pdo->prepare("select useremail from tbl_user where useremail='$useremail'");

        $select->execute();

        if ($select->rowCount() > 0) {
            $_SESSION['status'] = 'Email already exists. Create Account From New Email';
            $_SESSION['status_code'] = 'warning';
        } else {
            $insert = $pdo->prepare('insert into tbl_user (username,useremail,userpassword,role) values(:name,:email,:password,:role)');

            $insert->bindParam(':name', $username);
            $insert->bindParam(':email', $useremail);
            $insert->bindParam(':password', $userpassword);
            $insert->bindParam(':role', $userrole);

            if ($insert->execute()) {
                $_SESSION['status'] = 'Insert successfully the user into the database';
                $_SESSION['status_code'] = 'success';

                sendlog(
                    $pdo,
                    'Création',
                    $_SESSION['username'] . " a créé l'utilisateur N°" . $pdo->lastInsertId() . " - $username",
                    'Succès',

                    $_SESSION['userid'],
                    $_SESSION['username'],

                    'Utilisateur',
                    $pdo->lastInsertId(),
                    $username,
                );
            } else {
                $_SESSION['status'] = 'Error inserting the user into the database';
                $_SESSION['status_code'] = 'error';

                sendlog(
                    $pdo,
                    'Création',
                    $_SESSION['username'] . " n'a pas pu créer l'utilisateur $username",
                    'Échec',

                    $_SESSION['userid'],
                    $_SESSION['username'],

                    'Utilisateur',
                    'N/A',
                    $username,
                );
            }
        }
    }
}

sendlog(
    $pdo,
    'Consultation',
    $_SESSION['username'] . ' a consulté la liste des utilisateurs',
    'Succès',

    $_SESSION['userid'],
    $_SESSION['username'],

    'Utilisateur',
    null,
    null,
);

?>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Gestion de Comptes</h1>
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
                    <h5 class="m-0">Gestion de Comptes</h5>
                </div>
                <div class="card-body">

                    <div class="row">

                        <div class="col-md-4">

                            <form action="" method="post">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nom</label>
                                    <input type="text" class="form-control" placeholder="" name="txtname" required>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Adresse</label>
                                    <input type="email" class="form-control" placeholder="" name="txtemail" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mot de Passe</label>
                                    <input type="password" class="form-control" placeholder="" name="txtpassword"
                                        required>
                                </div>

                                <div class="form-group">
                                    <label>Role</label>
                                    <select class="form-control" name="txtselect_option" required>
                                        <option value="" disabled selected>Définir Role</option>
                                        <option>Admin</option>
                                        <option>Middle</option>
                                        <option>User</option>

                                    </select>
                                </div>


                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary" name="btnsave">Ajouter
                                        Membre</button>
                                </div>
                            </form>


                        </div>









                        <div class="col-md-8">

                            <table class="table table-striped table-hover ">
                                <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Nom</td>
                                        <td>Email</td>
                                        <td>Mot de Passe</td>
                                        <td>Role</td>
                                        <td>Supprimer</td>
                                    </tr>

                                </thead>


                                <tbody>

                                    <?php

                                    $select = $pdo->prepare('select * from tbl_user order by userid ASC');
                                    $select->execute();

                                    while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                        echo '
                                    <tr>
                                    <td>' .
                                            $row->userid .
                                            '</td>
                                    <td>' .
                                            $row->username .
                                            '</td>
                                    <td>' .
                                            $row->useremail .
                                            '</td>
                                    <td>' .
                                            $row->userpassword .
                                            '</td>
                                    <td>' .
                                            $row->role .
                                            '</td>
                                    <td>

                                    <a href="registration.php?id=' .
                                            $row->userid .
                                            '" class="btn btn-danger"><i class="fa fa-trash-alt"></i></a>
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