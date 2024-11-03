<?php

include_once 'connectdb.php';
session_start();

if ($_SESSION['useremail'] == ""  OR $_SESSION['role'] == "User") {
    header('location:../index.php');
}

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

if (isset($_POST['btnsave'])) {

    $discount = $_POST['txtdiscount'];

    if (empty($discount)) {
        $_SESSION['status'] = "Feild is Empty";
        $_SESSION['status_code'] = "warning";
    } else {
        $insert = $pdo->prepare("insert into tbl_taxdis (discount) values(:discount)");
        $insert->bindParam(':discount', $discount);

        if ($insert->execute()) {
            $_SESSION['status'] = "Discount Added successfully";
            $_SESSION['status_code'] = "success";
        } else {
            $_SESSION['status'] = "Failed";
            $_SESSION['status_code'] = "warning";
        }
    }
}

if (isset($_POST['btnupdate'])) {

    $discount = $_POST['txtdiscount'];
    $id = $_POST['txtid'];

    if (empty($discount)) {
        $_SESSION['status'] = "Field is Empty";
        $_SESSION['status_code'] = "warning";
    } else {
        $update = $pdo->prepare("update tbl_taxdis set discount=:discount where taxdis_id=" . $id);
        $update->bindParam(':discount', $discount);

        if ($update->execute()) {
            $_SESSION['status'] = "Discount Update successfully";
            $_SESSION['status_code'] = "success";
        } else {
            $_SESSION['status'] = "Failed";
            $_SESSION['status_code'] = "warning";
        }
    }
}

?>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Reduction</h1>
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
            <div class="card card-warning card-outline">
                <div class="card-header">
                    <h5 class="m-0">Ajout de Reduction</h5>
                </div>
                <form action="" method="post">
                    <div class="card-body">
                        <div class="row">
                            <?php
                            if (isset($_POST['btnedit'])) {
                                $select = $pdo->prepare("select * from tbl_taxdis where taxdis_id =" . $_POST['btnedit']);
                                $select->execute();
                                if ($select) {
                                    $row = $select->fetch(PDO::FETCH_OBJ);
                                    echo '<div class="col-md-4">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" placeholder="Enter Category" value="' . $row->taxdis_id . '" name="txtid">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Reduction(%)</label>
                                            <input type="text" class="form-control" placeholder="Enter Discount" value="' . $row->discount . '" name="txtdiscount">
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-info" name="btnupdate">Update</button>
                                    </div>
                                </div>';
                                }
                            } else {
                                echo '<div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Reduction(%)</label>
                                        <input type="text" class="form-control" placeholder="Enter Discount" name="txtdiscount">
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-warning" name="btnsave">Enregister</button>
                                    </div>
                                </div>';
                            }
                            ?>
                            <div class="col-md-8">
                                <table id="table_tax" class="table table-striped table-hover ">
                                    <thead>
                                        <tr>
                                            <td>#</td>
                                            <td>Reduction</td>
                                            <td>Modifier</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $select = $pdo->prepare("select * from tbl_taxdis order by taxdis_id ASC");
                                        $select->execute();
                                        while ($row = $select->fetch(PDO::FETCH_OBJ)) {
                                            echo '<tr>
                                        <td>' . $row->taxdis_id . '</td>
                                        <td>' . $row->discount . '</td>
                                        <td><button type="submit" class="btn btn-primary" value="' . $row->taxdis_id . '" name="btnedit">Modifier</button></td>
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
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?php
include_once "footer.php";
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
<script>
    $(document).ready(function() {
        $('#table_tax').DataTable();
    });
</script>
