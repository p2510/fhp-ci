<?php
include_once 'connectdb.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['btnimport'])) {
    require __DIR__ . '/../vendor/autoload.php';

    if (isset($_FILES['excel']['name'])) {
        try {
            $inputFileName = $_FILES['excel']['tmp_name'];

            $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileName);
            $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);

            foreach ($sheetData as $row) {
                
                $barcode = $row['A'];
                $product = $row['B'];
                $category = $row['C'];
                $description = $row['D'];
                $stock = $row['E'];
                $purchaseprice = $row['F'];
                $saleprice = $row['G'];
                $expiry_date = $row['H'];

                $insert = $pdo->prepare("INSERT INTO tbl_product (barcode, product, category, description, stock, purchaseprice, saleprice, expiry_date) 
                                        VALUES (:barcode, :product, :category, :description, :stock, :pprice, :saleprice, :expiry_date)");

                $insert->bindParam(':barcode', $barcode);
                $insert->bindParam(':product', $product);
                $insert->bindParam(':category', $category);
                $insert->bindParam(':description', $description);
                $insert->bindParam(':stock', $stock);
                $insert->bindParam(':pprice', $purchaseprice);
                $insert->bindParam(':saleprice', $saleprice);
                $insert->bindParam(':expiry_date', $expiry_date);

                $insert->execute();
            }

            // Affichage de la notification et redirection
            // Notification de succès et redirection
            $_SESSION['status'] = 'Import Successful!';
            $_SESSION['status_code'] = 'success';
            header('Location: productlist.php');
            exit();
        } catch (\PhpOffice\PhpSpreadsheet\Reader\Exception $e) {
            // Notification d'erreur
            $_SESSION['status'] = 'Error during import: ' . $e->getMessage();
            $_SESSION['status_code'] = 'error';
            header('Location: productlist.php');
            exit();
    }
}
}
?>