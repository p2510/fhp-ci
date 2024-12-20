<?php
include_once 'connectdb.php';
session_start();
include_once 'guard.php';


if ($_SESSION['useremail'] == "") {
    header('location:../index.php');
}
AccessGuard::protectPage('addproduct');


// Logique pour l'ajout de producteur
if (isset($_POST['btnsave'])) {
    // Récupérer les informations du formulaire et les convertir en majuscules
    $secteur_code = strtoupper($_POST['txtsecteur_code']);
    $secteur_name = strtoupper($_POST['txtsecteur_name']);
    $departement = strtoupper($_POST['txtdepartement']);
    $sous_prefecture = strtoupper($_POST['txtsous_prefecture']);
    $localite = strtoupper($_POST['txtlocalite']);
    $nom = strtoupper($_POST['txtnom']);
    $prenom = strtoupper($_POST['txtprenom']);
    $date_naissance = $_POST['txtdate_naissance']; // Garder la date inchangée
    $lieu_naissance = strtoupper($_POST['txtlieu_naissance']);
    $sous_pref_naissance = strtoupper($_POST['txtsous_pref_naissance']);
    $departement_naissance = strtoupper($_POST['txtdepartement_naissance']);
    $type_piece_identite = strtoupper($_POST['txttype_piece_identite']);
    $numero_piece = strtoupper($_POST['txtnumero_piece']);
    $autre_piece = strtoupper($_POST['txtautre_piece']);
    $contact_telephonique = $_POST['txtcontact_telephonique']; // Garder le numéro inchangé
    $superficie_totale = $_POST['txtsuperficie_totale']; // Garder la superficie inchangée
    $delegue_village = strtoupper($_POST['txtdelegue_village']);
    $created_by = $_SESSION['username']; // Récupérer le nom de l'utilisateur connecté

    // Génération du producteur_code
    $random_digits = str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT); // Génère un nombre à 7 chiffres
    $producteur_code = $secteur_code . $random_digits;

    // Gérer l'upload de la photo
    $photo_name = $producteur_code . '.jpg';
    $photo_tmp = $_FILES['photo']['tmp_name'];
    $photo_path = "uploads/" . $photo_name; // Assurez-vous que le dossier 'uploads' existe et est accessible en écriture 

    $photo_verso_name = "verso" . $producteur_code . ".jpg";
    $photo_verso_tmp = $_FILES['photo_verso']['tmp_name'];
    $photo_verso_path = "pieces/" . $photo_verso_name;

    $photo_recto_name = "recto" . $producteur_code . ".jpg";
    $photo_recto_tmp = $_FILES['photo_recto']['tmp_name'];
    $photo_recto_path = "pieces/" . $photo_recto_name;

    if (move_uploaded_file($photo_tmp, $photo_path) && move_uploaded_file($photo_recto_tmp, $photo_recto_path) && move_uploaded_file($photo_verso_tmp, $photo_verso_path)) {
        $_SESSION['status'] = "Photo téléchargée avec succès";
    } else {
        $_SESSION['status'] = "Échec du téléchargement de la photo";
    }

    // Traitement de la signature
    $signatureDataURL = $_POST['signature']; // Contient la signature en base64
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
        echo "<script>
              alert('Signature manquante. Vous allez être redirigé vers la page d\'ajout.');
              window.location.href = 'addproduct.php';
            </script>";
        exit();
    }

    // Enregistrement des données du producteur
    $insert = $pdo->prepare("INSERT INTO tbl_producteurs (
        producteur_code, secteur_code, secteur_name, departement, sous_prefecture, localite, nom, prenom, date_naissance,
        lieu_naissance, sous_pref_naissance, departement_naissance, type_piece_identite, numero_piece, autre_piece,
        contact_telephonique, superficie_totale, delegue_village, photo, signature, photo_recto, photo_verso, created_by)
        VALUES (
        :producteur_code, :secteur_code, :secteur_name, :departement, :sous_prefecture, :localite, :nom, :prenom, :date_naissance,
        :lieu_naissance, :sous_pref_naissance, :departement_naissance, :type_piece_identite, :numero_piece, :autre_piece,
        :contact_telephonique, :superficie_totale, :delegue_village, :photo, :signature, :photo_recto, :photo_verso ,  :created_by)");

    $insert->bindParam(':producteur_code', $producteur_code);
    $insert->bindParam(':secteur_code', $secteur_code);
    $insert->bindParam(':secteur_name', $secteur_name);
    $insert->bindParam(':departement', $departement);
    $insert->bindParam(':sous_prefecture', $sous_prefecture);
    $insert->bindParam(':localite', $localite);
    $insert->bindParam(':nom', $nom);
    $insert->bindParam(':prenom', $prenom);
    $insert->bindParam(':date_naissance', $date_naissance);
    $insert->bindParam(':lieu_naissance', $lieu_naissance);
    $insert->bindParam(':sous_pref_naissance', $sous_pref_naissance);
    $insert->bindParam(':departement_naissance', $departement_naissance);
    $insert->bindParam(':type_piece_identite', $type_piece_identite);
    $insert->bindParam(':numero_piece', $numero_piece);
    $insert->bindParam(':autre_piece', $autre_piece);
    $insert->bindParam(':contact_telephonique', $contact_telephonique);
    $insert->bindParam(':superficie_totale', $superficie_totale);
    $insert->bindParam(':delegue_village', $delegue_village);
    $insert->bindParam(':photo', $photo_name);
    $insert->bindParam(':signature', $signatureFileName); // Enregistrer le nom du fichier signature
    $insert->bindParam(':photo_recto', $photo_recto_name);
    $insert->bindParam(':photo_verso', $photo_verso_name);
    $insert->bindParam(':created_by', $created_by);

    if ($insert->execute()) {
        echo "<script>
              alert('Producteur ajouté avec succès');
              window.location.href = 'productlist.php';
            </script>";
        sendlog(
            $pdo,
            'Création',
            $_SESSION['username'] . " a créé le producteur N°" . $pdo->lastInsertId() . " - $nom $prenom",
            'Succès',

            $_SESSION['userid'],
            $_SESSION['username'],

            'Producteur',
            $pdo->lastInsertId(),
            "$nom $prenom",
        );
        exit();
    } else {
        $_SESSION['status'] = "Échec de l'ajout du producteur";
        $_SESSION['status_code'] = "error";
        sendlog(
            $pdo,
            'Création',
            $_SESSION['username'] . " n'a pas pu créer le producteur $nom $prenom",
            'Échec',

            $_SESSION['userid'],
            $_SESSION['username'],

            'Producteur',
            null,
            "$nom $prenom",
        );
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="./../dist/img/fph-ci.png">
    <title>FPH-CI Producteurs</title>

    <link rel="manifest" href="./pwa/manifest.json">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="./../plugins/fontawesome-free/css/all.min.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="./../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="./../plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="./../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="./../dist/css/adminlte.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="./../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="./../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="./../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">


    <!-- jQuery and other scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="./../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css"></script>
    <!-- pdfmake -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.js"></script>
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="./../plugins/sweetalert2/sweetalert2.min.css">

    <script>
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('./service-worker.js')
                .then(registration => {
                    console.log('Service Worker enregistré avec succès:', registration);
                })
                .catch(error => {
                    console.log('Échec de l\'enregistrement du Service Worker:', error);
                });
        });
    }
    </script>
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block"></li>
                <li class="nav-item d-none d-sm-inline-block"></li>
            </ul>
        </nav>

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="dashboard.php" class="brand-link">
                <img src="./../dist/img/fph-ci.png" alt="AdminLTE Logo" style="opacity: .8; width:70px">
                <span class="brand-text font-weight-light">FPH-CI Producteurs</span>
            </a>
            <div class="sidebar">
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="./../dist/img/avatar2.png" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block"><?php echo $_SESSION['username']; ?></a>
                    </div>
                </div>
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">


                        <li class="nav-item">
                            <a href="dashboard.php" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Tableau de Bord
                                </p>
                            </a>
                        </li>
                        <li class="nav-header">PRODUCTEURS</li>
                        <li class="nav-item">
                            <a href="category.php" class="nav-link">
                                <i class="nav-icon fas fa-map-pin"></i>
                                <p>
                                    Secteurs
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="addproduct.php" class="nav-link">
                                <i class="nav-icon fas fa-user"></i>
                                <p>
                                    Ajouter Producteurs
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="productlist.php" class="nav-link">
                                <i class="nav-icon fas fa-list"></i>
                                <p>
                                    Liste Producteurs
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="orderlist.php" class="nav-link">
                                <i class="nav-icon fas fa-address-card"></i>
                                <p>
                                    Carte de Producteurs
                                </p>
                            </a>
                        </li>
                        <li class="nav-header">DIVERS</li>
                        <li class="nav-item">
                            <a href="delegue.php" class="nav-link">
                                <i class="nav-icon fas fa-calculator"></i>
                                <p>
                                    Delegué Village
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="addplantation.php" class="nav-link">
                                <i class="nav-icon fas fa-plus"></i>
                                <p>
                                    Ajouter Plantation
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="plantationlist.php" class="nav-link">
                                <i class="nav-icon fas fa-list"></i>
                                <p>
                                    Liste plantation
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="paymentInfo.php" class="nav-link">
                                <i class="nav-icon fas fa-credit-card"></i>
                                <p>
                                    Information de Paiement
                                </p>
                            </a>
                        </li>
                        <li class="nav-header">ADMINISTRATION</li>
                        <li class="nav-item">
                            <a href="stats.php" class="nav-link">
                                <i class="nav-icon fas fa-chart-bar"></i>
                                <p>
                                    Rapport Statistique
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="registration.php" class="nav-link">
                                <i class="nav-icon far fa-user-plus"></i>
                                <p>Gestion des utilisateurs</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="logs.php" class="nav-link">
                                <i class="nav-icon far fa-history"></i>
                                <p>Historique des actions</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="trafic.php" class="nav-link">
                                <i class="nav-icon far fa-history"></i>
                                <p>Trafic</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="changepassword.php" class="nav-link">
                                <i class="nav-icon fas fa-user-lock"></i>
                                <p>
                                    Changer le mot de passe
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="logout.php" class="nav-link">
                                <i class="nav-icon fas fa-sign-out-alt"></i>
                                <p>
                                    Deconnexion
                                </p>
                            </a>
                        </li>

                    </ul>
                </nav>
            </div>
        </aside>

        <!-- Main Content -->

        <div class="content">
            <div class="container-fluid">

                <div class="content-wrapper">
                    <div class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <?php echo ($_SESSION['role'])   ?>
                                    <h1 class="m-0">Ajouter un Producteur</h1>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card card-primary card-outline">
                                        <div class="card-header">
                                            <h5 class="m-0">Formulaire d'Ajout de Producteur</h5>
                                        </div>
                                        <form action="" method="post" enctype="multipart/form-data"
                                            id="producteur-form">
                                            <div class="card-body">
                                                <div class="row">
                                                    <!-- Colonne gauche -->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Secteur</label>
                                                            <select class="form-control" id="secteur_selector"
                                                                name="txtsecteur_name" required>
                                                                <option value="" disabled selected>Choisissez un
                                                                    secteur</option>
                                                                <?php
                                                                $select = $pdo->prepare("SELECT * FROM tbl_secteurs ORDER BY secteur_id DESC");
                                                                $select->execute();
                                                                while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                                                    echo '<option value="' . $row['secteur_name'] . '" data-secteur_code="' . $row['secteur_code'] . '">' . $row['secteur_name'] . '</option>';
                                                                }
                                                                ?>
                                                            </select>
                                                            <input type="hidden" id="txtsecteur_code"
                                                                name="txtsecteur_code">
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Code Producteur</label>
                                                            <input type="text" class="form-control" id="producteur_code"
                                                                name="producteur_code"
                                                                placeholder="Le code producteur généré apparaîtra ici"
                                                                disabled>
                                                        </div>


                                                        <div class="form-group">
                                                            <label>Département</label>
                                                            <input type="text" class="form-control"
                                                                name="txtdepartement" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Sous-Préfecture</label>
                                                            <input type="text" class="form-control"
                                                                name="txtsous_prefecture" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Localité</label>
                                                            <input type="text" class="form-control" name="txtlocalite"
                                                                required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Nom</label>
                                                            <input type="text" class="form-control" name="txtnom"
                                                                placeholder="Entrez le nom" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Prénom</label>
                                                            <input type="text" class="form-control" name="txtprenom"
                                                                placeholder="Entrez le prénom" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Contact Téléphonique</label>
                                                            <input type="text" class="form-control"
                                                                name="txtcontact_telephonique" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Superficie Totale</label>
                                                            <input type="number" class="form-control"
                                                                name="txtsuperficie_totale" step="0.01" required>
                                                        </div>


                                                        <div class="form-group">
                                                            <label>Délégué Village</label>
                                                            <input type="text" class="form-control"
                                                                name="txtdelegue_village" required>
                                                        </div>
                                                    </div>

                                                    <!-- Colonne droite -->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Date de naissance</label>
                                                            <input type="date" class="form-control"
                                                                name="txtdate_naissance" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Lieu de naissance</label>
                                                            <input type="text" class="form-control"
                                                                name="txtlieu_naissance" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Sous-préfecture du lieu de naissance</label>
                                                            <input type="text" class="form-control"
                                                                name="txtsous_pref_naissance" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Département du lieu de naissance</label>
                                                            <input type="text" class="form-control"
                                                                name="txtdepartement_naissance" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Type de pièce d'identité</label>
                                                            <select class="form-control" name="txttype_piece_identite">
                                                                <option value="CNI">CNI</option>
                                                                <option value="Passeport">Passeport</option>
                                                                <option value="Permis de conduire">Permis de
                                                                    conduire</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Numéro de pièce</label>
                                                            <input type="text" class="form-control"
                                                                name="txtnumero_piece">
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Autre pièce</label>
                                                            <input type="text" class="form-control"
                                                                name="txtautre_piece">
                                                        </div>



                                                        <div class="form-group">
                                                            <label>Photo</label>
                                                            <input type="file" class="form-control" name="photo"
                                                                id="photo-input" accept="image/*">
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Photo de la pièce recto</label>
                                                            <input type="file" class="form-control" name="photo_recto"
                                                                id="photo-recto" accept="image/*">
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Photo de la pièce verso</label>
                                                            <input type="file" class="form-control" name="photo_verso"
                                                                id="photo-verso" accept="image/*">
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group">
                                                                <label>Signature</label>
                                                                <!-- Canvas for the signature pad -->
                                                                <canvas id="signature-pad" class="signature-pad"
                                                                    width="500" height="200"
                                                                    style="border: 1px solid #000;"></canvas>

                                                                <!-- Hidden input to store the base64 data of the signature -->
                                                                <input type="hidden" name="signature"
                                                                    id="signature_image">

                                                                <!-- Clear signature button -->
                                                                <button type="button" id="clear-signature"
                                                                    class="btn btn-warning mt-2">Effacer la
                                                                    signature</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card-footer col-md-6">
                                                    <div class="form-group">

                                                        <button type="submit" class="btn btn-primary"
                                                            name="btnsave">Enregistrer Producteur</button>
                                                        <button type="button" class="btn btn-success "
                                                            id="synchro">Synchroniser
                                                        </button>
                                                    </div>
                                                </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
        <div class="p-3">
            <h5>Title</h5>
            <p>Sidebar content</p>
        </div>
    </aside>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">

        </div>
        <!-- Default to the left -->
        <strong></strong>
    </footer>
    </div>
    <!-- ./wrapper -->
    </div>



    <script>
    // Function to save the form data offline when there is no internet connection
    let resultOnline

    function saveFormOffline() {
        const form = document.getElementById('producteur-form'); // Get the form element
        const formData = new FormData(form); // Create a FormData object from the form

        const photo_input = document.getElementById('photo-input'); // Get the photo input element
        const photo_recto = document.getElementById('photo-recto'); // Get the photo input element
        const photo_verso = document.getElementById('photo-verso'); // Get the photo input element

        const data = {}; // Initialize an empty object to store form data

        // Function to handle file input and convert to Base64
        function handlePhotoInput(photoInputElement, dataKey) {
            return new Promise((resolve, reject) => {
                if (photoInputElement.files.length > 0) {
                    const file = photoInputElement.files[0]; // Get the first file from the input
                    console.log(file); // Log the selected file to the console
                    const reader = new FileReader(); // Create a FileReader object

                    // This function is called when the file reading is complete
                    reader.onloadend = function() {
                        const base64String = reader.result; // Get the Base64 string from the reader
                        console.log(base64String); // Log the Base64 string to the console

                        // Add the photo converted to Base64 to the data object
                        data[dataKey] = base64String;
                        resolve(); // Resolve the promise when the photo is ready
                    };

                    reader.onerror = function(error) {
                        reject(error); // Reject the promise if there's an error
                    };

                    reader.readAsDataURL(file); // Convert the file to Base64
                } else {
                    console.log(`Aucune photo sélectionnée pour ${dataKey}.`); // Log if no photo is selected
                    resolve(); // Resolve immediately if no photo is selected
                }
            });
        }

        // Add form data to the object
        formData.forEach((value, key) => {
            data[key] = value; // Store each form field in the data object
        });

        // Handle the photos in parallel
        Promise.all([
                handlePhotoInput(photo_input, 'photo'),
                handlePhotoInput(photo_recto, 'photo_recto'),
                handlePhotoInput(photo_verso, 'photo_verso')
            ])
            .then(() => {
                // After all photos are processed, store the form data in localStorage
                const offlineForms = JSON.parse(localStorage.getItem('offlineForms')) ||
            []; // Get existing offline forms from localStorage
                offlineForms.push(data); // Add the current form data to the array
                localStorage.setItem('offlineForms', JSON.stringify(
                    offlineForms)); // Store the updated array back in localStorage

                alert('Formulaire sauvegardé hors ligne !'); // Alert the user that the form has been saved offline
                form.reset(); // Reset the form for new entries
            })
            .catch((error) => {
                console.error('Erreur lors de la sauvegarde du formulaire hors ligne :', error);
                alert('Une erreur est survenue. Veuillez réessayer.'); // Show error alert if something goes wrong
            });
    }


    // Event listener for when the DOM is fully loaded
    document.addEventListener("DOMContentLoaded", function() {
        const signaturePad = new SignaturePad(document.getElementById(
            'signature-pad')); // Initialize the signature pad

        function getRandomString() {
            return Math.random().toString(36).substring(2, 15)
        }
        async function isOnline() {

            if (!window.navigator.onLine) return false;


            // Crée l'URL en ajoutant 'ping.php' au dossier courant
            const currentUrl = window.location.href;
            const url = new URL(currentUrl);
            url.pathname = url.pathname.replace(/[^/]*$/, '') + 'ping.php';

            // Ajoute un paramètre aléatoire pour éviter le cache
            url.searchParams.set('rand', getRandomString());
            try {
                const response = await fetch(url.toString(), {
                    method: 'HEAD'
                });
                return response.ok;
            } catch {
                return false;
            }
        }

        (async function() {
            resultOnline = await isOnline();
            console.log("Statut de connexion :", resultOnline);
        })();


        // Event listener for the form submission
        document.getElementById("producteur-form").addEventListener("submit", function(event) {
            if (signaturePad.isEmpty()) { // Check if the signature pad is empty
                alert("Veuillez signer avant d'enregistrer."); // Alert if signature is missing
                event.preventDefault(); // Prevent form submission
                return; // Exit the function if no signature
            }

            const dataURL = signaturePad.toDataURL(); // Get the signature as a data URL
            document.getElementById('signature_image').value =
                dataURL; // Set the data URL in a hidden input field
            console.log(resultOnline)
            if (resultOnline) {
                console.log('en ligne')
            } else {
                event.preventDefault(); // Prevent the form from being sent
                saveFormOffline(); // Call the function to save the form offline
                console.log('offfline')

            }

        });

        // Event listener to clear the signature pad
        document.getElementById('clear-signature').addEventListener('click', function() {
            signaturePad.clear(); // Clear the signature pad
        });
    });

    // Function to synchronize the offline form data with the server
    async function syncForms() {
        const offlineForms = JSON.parse(localStorage.getItem('offlineForms')) ||
    []; // Retrieve offline forms from localStorage

        if (offlineForms.length > 0) { // Check if there are any offline forms to sync
            try {
                const response = await fetch('syncForms.php', { // Send a POST request to syncForms.php
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json' // Set the content type to JSON
                    },
                    body: JSON.stringify(offlineForms) // Send the offline forms as JSON
                });

                if (response.ok) { // Check if the response is OK
                    localStorage.removeItem('offlineForms'); // Clear localStorage after successful sync
                    alert(
                        'Formulaires synchronisés avec succès !'); // Alert that the forms were successfully synced
                } else {
                    alert(
                        'Erreur lors de la synchronisation des formulaires.'); // Alert in case of error during sync
                }
            } catch (error) {
                console.error('Erreur:', error); // Log any errors encountered during the fetch
            }
        }
    }

    // Event listener to handle producer code generation based on sector selection
    document.getElementById('secteur_selector').addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex]; // Get the selected option
        const secteur_code = selectedOption.getAttribute(
            'data-secteur_code'); // Get the data attribute for sector code

        if (secteur_code) {
            const randomDigits = Math.floor(1000000 + Math.random() * 9000000); // Generate random digits
            const producteurCode = secteur_code + randomDigits; // Combine sector code with random digits
            document.getElementById('producteur_code').value =
                producteurCode; // Set the producer code input value
            document.getElementById('txtsecteur_code').value =
                secteur_code; // Fill the hidden field with the sector code
        }
    });

    // Event listener to check connection and synchronize data on button click
    document.getElementById('synchro').addEventListener('click', function() {
        if (resultOnline) { // Check if the browser is online
            alert('Synchronisation des données...'); // Alert the user that synchronization is starting
            syncForms(); // Call the function to synchronize forms
        } else {
            alert(
                'Aucune connexion Internet détectée. Les données ne peuvent pas être synchronisées.'
            ); // Alert if no internet
        }
    });

    // Check the connection every 30 minutes
    setInterval(() => {
        if (resultOnline) { // If online
            syncForms(); // Synchronize forms if online
        }
    }, 1800000); // Check every 30 minutes (1800000 milliseconds)
    </script>



    <!-- jQuery -->
    <script src="./../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="./../plugins/bootstrap/js/bootstrap.bundle.min.js">
    </script>


    <!-- Select2 -->
    <script src="./../plugins/select2/js/select2.full.min.js">
    </script>

    <!-- AdminLTE App -->
    <script src="./../dist/js/adminlte.min.js"></script>
    <script src="./../plugins/datatables/jquery.dataTables.min.js">
    </script>
    <script src="./../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js">
    </script>
    <script src="./../plugins/datatables-responsive/js/dataTables.responsive.min.js">
    </script>
    <script src="./../plugins/datatables-responsive/js/responsive.bootstrap4.min.js">
    </script>
    <script src="./../plugins/datatables-buttons/js/dataTables.buttons.min.js">
    </script>
    <script src="./../plugins/datatables-buttons/js/buttons.bootstrap4.min.js">
    </script>
    <script src="./../plugins/jszip/jszip.min.js"></script>
    <script src="./../plugins/pdfmake/pdfmake.min.js"></script>
    <script src="./../plugins/pdfmake/vfs_fonts.js"></script>
    <script src="./../plugins/datatables-buttons/js/buttons.html5.min.js">
    </script>
    <script src="./../plugins/datatables-buttons/js/buttons.print.min.js">
    </script>
    <script src="./../plugins/datatables-buttons/js/buttons.colVis.min.js">
    </script>

    <!-- SweetAlert2 -->
    <script src="./../plugins/sweetalert2/sweetalert2.min.js">
    </script>
</body>

</html>