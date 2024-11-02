<?php
include_once 'connectdb.php';
session_start();

function getStockStatus($currentStock) {
    if ($currentStock <= 20) {
        return 'Stock Bas';
    } else {
        return 'En Stock';
    }
}

if ($_SESSION['useremail'] == ""  OR $_SESSION['role'] == "User") {
    header('location:../index.php');
}

if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
} else {
    include_once 'headeruser.php';
}

$select = $pdo->prepare("SELECT * FROM tbl_product WHERE stock <= 20 ORDER BY stock ASC");
$select->execute();
$products = $select->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Produits a Stock bas</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card card-warning card-outline">
                        <div class="card-header">
                            <h5 class="m-0">Produits a Faible Stock</h5>
                        </div>

                        <div class="card-body">
                            <table id="quantityTable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Produit</th>
                                        <th>Stock Actuel</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    foreach ($products as $product) {
                                        echo '<tr>';
                                        echo '<td>' . $product['product'] . '</td>';
                                        echo '<td>' . $product['stock'] . '</td>';
                                        echo '<td style="color: red;">' . getStockStatus($product['stock']) . '</td>';
                                        echo '<td><form action="editproduct.php" method="get"><input type="hidden" name="id" value="' . $product['pid'] . '"/><button type="submit" class="btn btn-danger" name="editStock">Modifier Stock</button></form></td>';
                                        echo '</tr>';
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<?php
include_once 'footer.php';

if (isset($_SESSION['status']) && $_SESSION['status'] != '') {
    echo '<script> Swal.fire({ icon: "' . $_SESSION['status_code'] . '", title: "' . $_SESSION['status'] . '" }); </script>';
    unset($_SESSION['status']);
}
?>

<script>
    $(document).ready(function () {
        $('#quantityTable').DataTable();
    });
</script>
