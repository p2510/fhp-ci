<?php
    include_once 'connectdb.php';
    session_start();
    if ($_SESSION['useremail'] == "" ) {
    header('location:../index.php');
    }

// Génération du code de plantation
        $random_digits = str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT);
        $code_plantation = "PL" . $random_digits;
        
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            
        $data = json_decode(file_get_contents('php://input'), true);

        if (!empty($data)) {
        // Logique pour l'ajout de plantation
                foreach ($data as $form) {
                    $producteur_code = $form['txtproducteur_code'];
                    $secteur_code = $form['txtsecteur_code'];
                    $secteur_name = $form['txtsecteur_name'];
                    $departement = strtoupper($form['txtdepartement']);
                    $sous_prefecture = strtoupper($form['txtsous_prefecture']);
                    $village = strtoupper($form['txtvillage']);
                    $superficie_hectares = $form['txtsuperficie_hectares'];
                    $production_annuelle_estimee = $form['txtproduction_annuelle_estimee'];
                    $annee_plantation = $form['txtannee_plantation'];
                    $geolocalise = $form['txtgeolocalise'];
                    $created_by = $_SESSION['username']; // Récupérer le nom de l'utilisateur connecté


                    // Insertion des données dans la base de données
                    $insert = $pdo->prepare("INSERT INTO tbl_plantations (
                    code_plantation, producteur_code, secteur_code, secteur_name, departement, sous_prefecture, village,
                    superficie_hectares, production_annuelle_estimee, annee_plantation, geolocalise,created_by)
                    VALUES (
                    :code_plantation, :producteur_code, :secteur_code, :secteur_name, :departement, :sous_prefecture,
                    :village, :superficie_hectares, :production_annuelle_estimee, :annee_plantation, :geolocalise,:created_by)");

                    $insert->bindParam(':code_plantation', $code_plantation);
                    $insert->bindParam(':producteur_code', $producteur_code);
                    $insert->bindParam(':secteur_code', $secteur_code);
                    $insert->bindParam(':secteur_name', $secteur_name);
                    $insert->bindParam(':departement', $departement);
                    $insert->bindParam(':sous_prefecture', $sous_prefecture);
                    $insert->bindParam(':village', $village);
                    $insert->bindParam(':superficie_hectares', $superficie_hectares);
                    $insert->bindParam(':production_annuelle_estimee', $production_annuelle_estimee);
                    $insert->bindParam(':annee_plantation', $annee_plantation);
                    $insert->bindParam(':geolocalise', $geolocalise);
                    $insert->bindParam(':created_by', $created_by);


                        if ($insert->execute()) {
                        $_SESSION['status'] = "Plantation ajoutée avec succès";
                        echo '<script type="text/javascript">
                        alert("Plantation ajoutée avec succès");
                        window.location.href = "plantationlist.php";
                        </script>';
                        } else {
                        $_SESSION['status'] = "Échec de l\'ajout de la plantation";
                        echo '<script type="text/javascript">
                        alert("Échec de l\'ajout de la plantation");
                        </script>';
                        }
                }

        }
        }
?>