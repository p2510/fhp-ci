<?php
include_once 'connectdb.php'; // Include the database connection file
session_start(); // Start the session

// Check if the user is logged in and has the role "Admin"
if (empty($_SESSION['useremail']) || $_SESSION['role'] !== 'Admin') {
    header('location:../index.php'); // Redirect to the homepage if not an admin
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Decode the JSON data sent by the client
    $data = json_decode(file_get_contents('php://input'), true);
    
    if (!empty($data)) {
        foreach ($data as $form) {
            // Retrieve form information and convert to uppercase
            $secteur_code = strtoupper($form['txtsecteur_code']); // Ensure secteur_code is provided in the form
            $secteur_name = strtoupper($form['txtsecteur_name']);
            $departement = strtoupper($form['txtdepartement']);
            $sous_prefecture = strtoupper($form['txtsous_prefecture']);
            $localite = strtoupper($form['txtlocalite']);
            $nom = strtoupper($form['txtnom']);
            $prenom = strtoupper($form['txtprenom']);
            $date_naissance = $form['txtdate_naissance']; // Keep the date unchanged
            $lieu_naissance = strtoupper($form['txtlieu_naissance']);
            $sous_pref_naissance = strtoupper($form['txtsous_pref_naissance']);
            $departement_naissance = strtoupper($form['txtdepartement_naissance']);
            $type_piece_identite = strtoupper($form['txttype_piece_identite']);
            $numero_piece = strtoupper($form['txtnumero_piece']);
            $autre_piece = strtoupper($form['txtautre_piece']);
            $contact_telephonique = $form['txtcontact_telephonique']; // Keep the phone number unchanged
            $superficie_totale = $form['txtsuperficie_totale']; // Keep the area unchanged
            $delegue_village = strtoupper($form['txtdelegue_village']);
            $created_by = $_SESSION['username']; // Retrieve the name of the logged-in user

            // Generate the producteur_code
            $random_digits = str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT); // Generate a 7-digit number
            $producteur_code = $secteur_code . $random_digits; // Combine the secteur_code and random digits
            $photo_name = '';

            // Handle photo upload
            if (!empty($form['photo'])) {
                $photoDataURL = $form['photo']; // The photo in base64 with prefix
                $photoData = explode(',', $photoDataURL)[1]; // Retrieve only the Base64 part
                $decodedImage = base64_decode($photoData); // Decode the base64 image
            
                // Set photo name and path for storage
                $photoFileName = $producteur_code . ".jpg";
                $photoPath = "uploads/" . $photoFileName;
            
                // Check if the 'uploads' directory exists, create if not
                if (!file_exists('uploads')) {
                    mkdir('uploads', 0777, true);
                }
            
                // Save the image on the server
                if (file_put_contents($photoPath, $decodedImage) !== false) {
                    $_SESSION['status'] = "Photo uploaded and saved successfully.";
                    $photo_name = $photoFileName; // Store the photo file name
                    echo json_encode(['status' => 'success', 'message' => 'Photo saved successfully.']);
                } else {
                    $_SESSION['status'] = "Failed to save the photo.";
                    echo json_encode(['status' => 'error', 'message' => "Failed to save the photo."]);
                }
            } else {
                $_SESSION['status'] = "Missing photo.";
                echo json_encode(['status' => 'error', 'message' => 'Missing photo.']);
            }
            
            // Handle signature upload
            $signatureDataURL = $form['signature']; // Contains the signature in base64
            if (!empty($signatureDataURL)) {
                // Extract the base64 part of the image
                $signatureData = explode(',', $signatureDataURL)[1];
                $decodedImage = base64_decode($signatureData); // Decode the base64 signature

                // Set signature file name
                $signatureFileName = "SIGN_" . $producteur_code . ".png";
                $signaturePath = "signatures/" . $signatureFileName;

                // Ensure the 'signatures' directory exists
                if (!file_exists('signatures')) {
                    mkdir('signatures', 0777, true); // Create the directory if it does not exist
                }

                // Save the signature as a PNG file
                file_put_contents($signaturePath, $decodedImage);
            } else {
                $_SESSION['status'] = "Missing signature";
                echo json_encode(['status' => 'error', 'message' => 'Missing signature']);
                exit();
            }

            // Prepare an insert query
            $stmt = $pdo->prepare("INSERT INTO tbl_producteurs (
                producteur_code, secteur_code, secteur_name, departement, sous_prefecture, localite, nom, prenom, date_naissance,
                lieu_naissance, sous_pref_naissance, departement_naissance, type_piece_identite, numero_piece, autre_piece,
                contact_telephonique, superficie_totale, delegue_village, photo, signature, created_by
            ) VALUES (
                :producteur_code, :secteur_code, :secteur_name, :departement, :sous_prefecture, :localite, :nom, :prenom, :date_naissance,
                :lieu_naissance, :sous_pref_naissance, :departement_naissance, :type_piece_identite, :numero_piece, :autre_piece,
                :contact_telephonique, :superficie_totale, :delegue_village, :photo, :signature, :created_by
            )");

            // Bind parameters to the query
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
            $stmt->bindParam(':signature', $signatureFileName); // Save the signature file name
            $stmt->bindParam(':created_by', $created_by);

            // Execute the query
            if ($stmt->execute()) {
                echo json_encode(['status' => 'success', 'message' => 'Producer added successfully']);
                sendlog(
                    $pdo,
                    'Creation',
                    $_SESSION['username'] . " created producer No. ".$pdo->lastInsertId()." - $nom $prenom",
                    'Success',
                    $_SESSION['userid'],
                    $_SESSION['username'],
                    'Producer',
                    $pdo->lastInsertId(),
                    "$nom $prenom"
                );
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Failed to add producer']);
                sendlog(
                    $pdo,
                    'Creation',
                    $_SESSION['username'] . " failed to create producer $nom $prenom",
                    'Failure',
                    $_SESSION['userid'],
                    $_SESSION['username'],
                    'Producer',
                    null,
                    "$nom $prenom"
                );
            }
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'No data received']); // No data received
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request']); // Invalid request
}
?>