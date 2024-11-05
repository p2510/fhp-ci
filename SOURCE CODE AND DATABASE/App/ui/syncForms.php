<?php
include_once 'connectdb.php'; // Inclure le fichier de connexion
session_start();

// Vérifiez si l'utilisateur est connecté et s'il a le rôle "Admin"
if (empty($_SESSION['useremail']) || $_SESSION['role'] !== 'Admin') {
    header('location:../index.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Décoder les données envoyées par le client
    $data = json_decode(file_get_contents('php://input'), true);

    if (!empty($data)) {
        foreach ($data as $form) {
            // Récupérer les informations du formulaire et les convertir en majuscules
            $secteur_code = strtoupper($form['secteur_code']); // Assurez-vous que secteur_code est dans le formulaire
            $secteur_name = strtoupper($form['secteur_name']);
            $departement = strtoupper($form['txtdepartement']);
            $sous_prefecture = strtoupper($form['txtsous_prefecture']);
            $localite = strtoupper($form['txtlocalite']);
            $nom = strtoupper($form['txtnom']);
            $prenom = strtoupper($form['txtprenom']);
            $date_naissance = $form['txtdate_naissance']; // Garder la date inchangée
            $lieu_naissance = strtoupper($form['txtlieu_naissance']);
            $sous_pref_naissance = strtoupper($form['txtsous_pref_naissance']);
            $departement_naissance = strtoupper($form['txtdepartement_naissance']);
            $type_piece_identite = strtoupper($form['txttype_piece_identite']);
            $numero_piece = strtoupper($form['txtnumero_piece']);
            $autre_piece = strtoupper($form['txtautre_piece']);
            $contact_telephonique = $form['txtcontact_telephonique']; // Garder le numéro inchangé
            $superficie_totale = $form['txtsuperficie_totale']; // Garder la superficie inchangée
            $delegue_village = strtoupper($form['txtdelegue_village']);
            $created_by = $_SESSION['username']; // Récupérer le nom de l'utilisateur connecté

            // Génération du producteur_code
            $random_digits = str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT); // Génère un nombre à 7 chiffres
            $producteur_code = $secteur_code . $random_digits;

            // Gérer l'upload de la photo
            $photo_name = $producteur_code . '.jpg';
            $photo_tmp = $form['photo']['tmp_name']; // Assurez-vous que le fichier photo est correctement transmis
            $photo_path = "uploads/" . $photo_name; // Assurez-vous que le dossier 'uploads' existe et est accessible en écriture 

            if (move_uploaded_file($photo_tmp, $photo_path)) {
                $_SESSION['status'] = "Photo téléchargée avec succès";
            } else {
                $_SESSION['status'] = "Échec du téléchargement de la photo";
            }

            // Traitement de la signature
            $signatureDataURL = $form['signature']; // Contient la signature en base64
            if (!empty($signatureDataURL)) {
                // Extraire la partie base64 de l'image
                $signatureData = explode(',', $signatureDataURL)[1];
                $decodedImage = base64_decode($signatureData);

                // Nom du fichier de la signature
                $signatureFileName = "SIGN_" . $producteur_code . ".png";
                $signaturePath = "signatures/" . $signatureFileName;

                // S'assurer que le dossier 'signatures' existe
                if (!file_exists('signatures')) {
                    mkdir('signatures', 0777, true); // Créer le dossier s'il n'existe pas
                }

                // Enregistrer l'image en tant que fichier PNG
                file_put_contents($signaturePath, $decodedImage);
            } else {
                $_SESSION['status'] = "Signature manquante";
                echo json_encode(['status' => 'error', 'message' => 'Signature manquante']);
                exit();
            }

            // Préparer une requête d'insertion
            $stmt = $pdo->prepare("INSERT INTO tbl_producteurs (
                producteur_code, secteur_code, secteur_name, departement, sous_prefecture, localite, nom, prenom, date_naissance,
                lieu_naissance, sous_pref_naissance, departement_naissance, type_piece_identite, numero_piece, autre_piece,
                contact_telephonique, superficie_totale, delegue_village, photo, signature, created_by
            ) VALUES (
                :producteur_code, :secteur_code, :secteur_name, :departement, :sous_prefecture, :localite, :nom, :prenom, :date_naissance,
                :lieu_naissance, :sous_pref_naissance, :departement_naissance, :type_piece_identite, :numero_piece, :autre_piece,
                :contact_telephonique, :superficie_totale, :delegue_village, :photo, :signature, :created_by
            )");

            // Lier les paramètres
            $stmt->bindParam(':producteur_code', $producteur_code);
            $stmt->bindParam(':secteur_code', $secteur_code);
            $stmt->bindParam(':secteur_name', $secteur_name);
            $stmt->bindParam(':departement', $departement);
            $stmt->bindParam(':sous_prefecture', $sous_prefecture);
            $stmt->bindParam(':localite', $localite);
            $stmt->bindParam(':nom', $nom);
            $stmt->bindParam(':prenom', $prenom);
            $stmt->bindParam(':date_naissance', $date_naissance);
            $stmt->bindParam(':lieu_naissance', $lieu_naissance);
            $stmt->bindParam(':sous_pref_naissance', $sous_pref_naissance);
            $stmt->bindParam(':departement_naissance', $departement_naissance);
            $stmt->bindParam(':type_piece_identite', $type_piece_identite);
            $stmt->bindParam(':numero_piece', $numero_piece);
            $stmt->bindParam(':autre_piece', $autre_piece);
            $stmt->bindParam(':contact_telephonique', $contact_telephonique);
            $stmt->bindParam(':superficie_totale', $superficie_totale);
            $stmt->bindParam(':delegue_village', $delegue_village);
            $stmt->bindParam(':photo', $photo_name);
            $stmt->bindParam(':signature', $signatureFileName); // Enregistrer le nom du fichier signature
            $stmt->bindParam(':created_by', $created_by);

            // Exécuter la requête
            if ($stmt->execute()) {
                echo json_encode(['status' => 'success', 'message' => 'Producteur ajouté avec succès']);
                sendlog(
                    $pdo,
                    'Création',
                    $_SESSION['username'] . " a créé le producteur N°".$pdo->lastInsertId()." - $nom $prenom",
                    'Succès',
                    $_SESSION['userid'],
                    $_SESSION['username'],
                    'Producteur',
                    $pdo->lastInsertId(),
                    "$nom $prenom"
                );
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Échec de l\'ajout du producteur']);
                sendlog(
                    $pdo,
                    'Création',
                    $_SESSION['username'] . " n'a pas pu créer le producteur $nom $prenom",
                    'Échec',
                    $_SESSION['userid'],
                    $_SESSION['username'],
                    'Producteur',
                    null,
                    "$nom $prenom"
                );
            }
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'No data received']); // Pas de données reçues
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request']); // Requête non valide
}
?>

?>