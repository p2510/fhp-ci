<?php
include_once 'connectdb.php';
session_start();
include_once 'guard.php';
AccessGuard::protectPage('category');

if ($_SESSION['useremail'] == '' ) {
    header('location:../index.php');
}

if ($_SESSION['role'] == 'Admin') {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}
sendlog(
  $pdo,
  'Consultation',
  $_SESSION['username'] . " a consulté la liste des secteurs",
  'Succès',

  $_SESSION['userid'],
  $_SESSION['username'],

  'Secteur',
  null,
  'N/A',
);
if (isset($_POST['btnsave'])) {
    $secteur_code = $_POST['txtsecteur_code'];
    $secteur_name = $_POST['txtsecteur_name'];

    if (empty($secteur_code) || empty($secteur_name)) {
        $_SESSION['status'] = 'Les champs de code et nom de secteur sont vides';
        $_SESSION['status_code'] = 'warning';
    } else {
        $insert = $pdo->prepare('INSERT INTO tbl_secteurs (secteur_code, secteur_name) VALUES (:code, :name)');
        $insert->bindParam(':code', $secteur_code);
        $insert->bindParam(':name', $secteur_name);

        if ($insert->execute()) {
            $_SESSION['status'] = 'Secteur ajouté avec succès';
            $_SESSION['status_code'] = 'success';

            sendlog(
              $pdo,
              'Création',
              $_SESSION['username'] . " a créé le secteur $secteur_name ($secteur_code)",
              'Succès',

              $_SESSION['userid'],
              $_SESSION['username'],

              'Secteur',
              $pdo->lastInsertId(),
              $secteur_name,
            );
        } else {
            $_SESSION['status'] = "Échec de l'ajout du secteur";
            $_SESSION['status_code'] = 'warning';

            sendlog(
              $pdo,
              'Création',
              $_SESSION['username'] . " n'a pas pu créer le secteur $secteur_name ($secteur_code)",
              'Succès',

              $_SESSION['userid'],
              $_SESSION['username'],

              'Secteur',
              null,
              '$secteur_name',
            );
        }
    }
}

if (isset($_POST['btnupdate'])) {
    $secteur_code = $_POST['txtsecteur_code'];
    $secteur_name = $_POST['txtsecteur_name'];
    $id = $_POST['txtsecteur_id'];

    if (empty($secteur_code) || empty($secteur_name)) {
        $_SESSION['status'] = 'Les champs de code et nom de secteur sont vides';
        $_SESSION['status_code'] = 'warning';
    } else {
        $update = $pdo->prepare('UPDATE tbl_secteurs SET secteur_code = :code, secteur_name = :name WHERE secteur_id = :id');
        $update->bindParam(':code', $secteur_code);
        $update->bindParam(':name', $secteur_name);
        $update->bindParam(':id', $id);

        if ($update->execute()) {
            $_SESSION['status'] = 'Secteur mis à jour avec succès';
            $_SESSION['status_code'] = 'success';

            sendlog(
              $pdo,
              'Modification',
              $_SESSION['username'] . " a modifié le secteur $secteur_name ($secteur_code)",
              'Succès',

              $_SESSION['userid'],
              $_SESSION['username'],

              'Secteur',
              $id,
              $secteur_name,
            );
        } else {
            $_SESSION['status'] = 'Échec de la mise à jour du secteur';
            $_SESSION['status_code'] = 'warning';

            sendlog(
              $pdo,
              'Modification',
              $_SESSION['username'] . " n'a pas pu modifier le secteur $secteur_name ($secteur_code)",
              'Échec',

              $_SESSION['userid'],
              $_SESSION['username'],

              'Secteur',
              $id,
              $secteur_name,
            );
        }
    }
}

if (isset($_POST['btndelete'])) {
    $delete = $pdo->prepare('DELETE FROM tbl_secteurs WHERE secteur_id = :id');
    $delete->bindParam(':id', $_POST['btndelete']);

    if ($delete->execute()) {
        $_SESSION['status'] = 'Secteur supprimé';
        $_SESSION['status_code'] = 'success';

        sendlog(
            $pdo,
            'Suppression',
            $_SESSION['username'] . ' a supprimé le secteur N°' . $_POST['btndelete'],
            'Succès',

            $_SESSION['userid'],
            $_SESSION['username'],

            'Secteur',
            $_POST['btndelete'],
            'N/A',
        );
    } else {
        $_SESSION['status'] = 'Échec de la suppression du secteur';
        $_SESSION['status_code'] = 'warning';

        sendlog(
          $pdo,
          'Suppression',
          $_SESSION['username'] . " n'a pas pu supprimer le secteur N°" . $_POST['btndelete'],
          'Échec',

          $_SESSION['userid'],
          $_SESSION['username'],

          'Secteur',
          $_POST['btndelete'],
          'N/A',
      );
    }
}
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Secteurs</h1>

                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card card-warning card-outline">
                <div class="card-header">
                    <h5 class="m-0">Secteurs FPH-CI</h5>
                </div>

                <form action="" method="post">
                    <div class="card-body">
                        <div class="row">
                            <?php
                            if (isset($_POST['btnedit'])) {
                                $select = $pdo->prepare('SELECT * FROM tbl_secteurs WHERE secteur_id = :id');
                                $select->bindParam(':id', $_POST['btnedit']);
                                $select->execute();

                                if ($select) {
                                    $row = $select->fetch(PDO::FETCH_OBJ);

                                    echo '<div class="col-md-4">
                                                          <div class="form-group">
                                                            <label for="exampleInputEmail1">Code du Secteur</label>
                                                            <input type="hidden" class="form-control" value="' .
                                        $row->secteur_id .
                                        '" name="txtsecteur_id">
                                                            <input type="text" class="form-control" value="' .
                                        $row->secteur_code .
                                        '" name="txtsecteur_code">
                                                          </div>
                                                          <div class="form-group">
                                                            <label for="exampleInputEmail1">Nom du Secteur</label>
                                                            <input type="text" class="form-control" value="' .
                                        $row->secteur_name .
                                        '" name="txtsecteur_name">
                                                          </div>
                                                          <div class="card-footer">
                                                            <button type="submit" class="btn btn-info" name="btnupdate">Mettre à jour</button>
                                                          </div>
                                                        </div>';
                                }
                            } else {
                                echo '<div class="col-md-4">
                                                      <div class="form-group">
                                                        <label for="exampleInputEmail1">Code du Secteur</label>
                                                        <input type="text" class="form-control" placeholder="Code du Secteur" name="txtsecteur_code">
                                                      </div>
                                                      <div class="form-group">
                                                        <label for="exampleInputEmail1">Nom du Secteur</label>
                                                        <input type="text" class="form-control" placeholder="Nom du Secteur" name="txtsecteur_name">
                                                      </div>
                                                      <div class="card-footer">
                                                        <button type="submit" class="btn btn-warning" name="btnsave">Enregistrer</button>
                                                      </div>
                                                    </div>';
                            }
                            ?>
                            <div class="col-md-8">
                                <table id="table_secteur" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <td>#</td>
                                            <td>Code Secteur</td>
                                            <td>Nom Secteur</td>
                                            <td>Modifier</td>
                                            <td>Supprimer</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $select = $pdo->prepare('SELECT * FROM tbl_secteurs ORDER BY secteur_id ASC');
                                        $select->execute();

                                        while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                            echo '<tr>
                                                                        <td>' .
                                                $row->secteur_id .
                                                '</td>
                                                                        <td>' .
                                                $row->secteur_code .
                                                '</td>
                                                                        <td>' .
                                                $row->secteur_name .
                                                '</td>
                                                                        <td>
                                                                          <button type="submit" class="btn btn-primary" value="' .
                                                $row->secteur_id .
                                                '" name="btnedit">Modifier</button>
                                                                        </td>
                                                                        <td>
                                                                          <button type="submit" class="btn btn-danger" value="' .
                                                $row->secteur_id .
                                                '" name="btndelete">Supprimer</button>
                                                                        </td>
                                                                      </tr>';
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include_once 'footer.php'; ?>

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

<script>
$(document).ready(function() {
    $('#table_secteur').DataTable();
}); <
</script>