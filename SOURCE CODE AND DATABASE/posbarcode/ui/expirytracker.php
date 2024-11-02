<?php
include_once 'connectdb.php';
session_start();

function getTimeRemaining($expiryDate) {
    $now = new DateTime();
    $expiration = new DateTime($expiryDate);
    $interval = $now->diff($expiration);

    $days = $interval->format('%a');
    $weeks = floor($days / 7);

    if ($days < 7) {
        return $days . ' ' . ($days === 1 ? 'Jour' : 'Jours');
    } elseif ($weeks < 4) {
        return $weeks . ' ' . ($weeks === 1 ? 'Semaine' : 'Semaines');
    } else {
        return 'Plus de 1 Mois';
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

$currentDate = date('Y-m-d');
$nextTwoMonths = date('Y-m-d', strtotime('+2 months', strtotime($currentDate)));

$select = $pdo->prepare("SELECT * FROM tbl_product WHERE expiry_date BETWEEN :currentDate AND :nextTwoMonths ORDER BY expiry_date ASC");
$select->bindParam(':currentDate', $currentDate);
$select->bindParam(':nextTwoMonths', $nextTwoMonths);
$select->execute();
$products = $select->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Gestion date d'Expiration</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card card-success card-outline">
                        <div class="card-header">
                            <h5 class="m-0">Produits a Risque dans les Prochains Mois</h5>
                        </div>

                        <div class="card-body">
                            <table id="expiryTable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Produit</th>
                                        <th>Date d'Expiration</th>
                                        <th>Quantité</th>
                                        <th>Temps Restant</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    foreach ($products as $product) {
                                        echo '<tr>';
                                        echo '<td>' . $product['product'] . '</td>';
                                        echo '<td>' . $product['expiry_date'] . '</td>';
                                        echo '<td>' . $product['stock'] . '</td>';
                                        echo '<td style="color: red;">' . getTimeRemaining($product['expiry_date']) . '</td>';
                                        echo '<td><form action="editproduct.php" method="get"><input type="hidden" name="id" value="' . $product['pid'] . '"/><button type="submit" class="btn btn-primary" name="editExpiry">Modifier Date</button></form></td>';
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
        $('#expiryTable').DataTable();
    });
</script>
