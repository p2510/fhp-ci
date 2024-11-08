<?php
                    include_once 'connectdb.php';
                    session_start();
                    include_once 'guard.php';


                    if ($_SESSION['useremail'] == "" ) {
                        header('location:../index.php');
                    }
                    AccessGuard::protectPage('addplantation');

                    if ($_SESSION['role'] == "Admin") {
                        include_once 'header.php';
                    } else {
                        include_once 'headeruser.php';
                    }

                    // Génération du code de plantation
                    $random_digits = str_pad(rand(0, 9999999), 7, '0', STR_PAD_LEFT);
                    $code_plantation = "PL" . $random_digits;

                    // Logique pour l'ajout de plantation
                    if (isset($_POST['btnadd'])) {
                        $producteur_code = $_POST['txtproducteur_code'];
                        $secteur_code = $_POST['txtsecteur_code'];
                        $secteur_name = $_POST['txtsecteur_name'];
                        $departement = strtoupper($_POST['txtdepartement']);
                        $sous_prefecture = strtoupper($_POST['txtsous_prefecture']);
                        $village = strtoupper($_POST['txtvillage']);
                        $superficie_hectares = $_POST['txtsuperficie_hectares'];
                        $production_annuelle_estimee = $_POST['txtproduction_annuelle_estimee'];
                        $annee_plantation = $_POST['txtannee_plantation'];
                        $geolocalise = $_POST['txtgeolocalise'];
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



</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- Main Content -->
        <div class="content">
            <div class="container-fluid">

                <div class="content-wrapper">
                    <div class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1 class="m-0">Ajouter une Plantation</h1>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <!-- Card pour afficher les informations du producteur -->
                                <div class="col-lg-12 mb-3">
                                    <div class="card card-info">
                                        <div class="card-header">
                                            <h5 class="m-0">Informations du Producteur</h5>
                                        </div>
                                        <div class="card-body" id="producer-info" style="display: none;">
                                            <p><strong>Nom:</strong> <span id="producer-name"></span></p>
                                            <p><strong>Prénom:</strong> <span id="producer-firstname"></span></p>
                                            <p><strong>Secteur:</strong> <span id="producer-sector-code"></span> -
                                                <span id="producer-sector-name"></span>
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Card pour le formulaire d'ajout de plantation -->
                                <div class="col-lg-12">
                                    <div class="card card-primary card-outline">
                                        <div class="card-header">
                                            <h5 class="m-0">Formulaire d'Ajout de Plantation</h5>
                                        </div>
                                        <form action="" id="plantation-form" method="post"
                                            onsubmit="return fetchProducerInfo();">
                                            <div class="card-body">
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="txtcode_plantation">Code Plantation</label>
                                                        <input type="text" class="form-control"
                                                            name="txtcode_plantation" id="txtcode_plantation"
                                                            value="<?php echo $code_plantation; ?>" readonly
                                                            maxlength="100">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="txtproducteur_code">Code Producteur</label>
                                                        <input type="text" class="form-control" id="txtproducteur_code"
                                                            name="txtproducteur_code" required
                                                            placeholder="Tapez le code du producteur..."
                                                            oninput="searchProducer()" list="producersList"
                                                            maxlength="100">
                                                        <datalist id="producersList">
                                                            <?php
                                                $select = $pdo->prepare("SELECT * FROM tbl_producteurs ORDER BY producteur_code");
                                                $select->execute();
                                                while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                                    echo "<option value='" . $row['producteur_code'] . "' data-name='" . $row['nom'] . "' data-firstname='" . $row['prenom'] . "' data-secteur-code='" . $row['secteur_code'] . "' data-secteur-name='" . $row['secteur_name'] . "'>" . $row['producteur_code'] . " - " . $row['nom'] . " " . $row['prenom'] . "</option>";
                                                }
                                                ?>
                                                        </datalist>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="secteur_selector">Secteur</label>
                                                        <select class="form-control" id="secteur_selector"
                                                            name="txtsecteur_code" required
                                                            onchange="updateSecteurName()">
                                                            <option value="" disabled selected>Choisissez un secteur
                                                            </option>
                                                            <?php
                                                $select = $pdo->prepare("SELECT * FROM tbl_secteurs ORDER BY secteur_id");
                                                $select->execute();
                                                while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                                    echo "<option value='" . $row['secteur_code'] . "' data-secteur-name='" . $row['secteur_name'] . "'>" . $row['secteur_name'] . "</option>";
                                                }
                                                ?>
                                                        </select>
                                                    </div>
                                                    <!-- Champ caché pour stocker le nom du secteur sélectionné -->
                                                    <input type="hidden" id="txtsecteur_name" name="txtsecteur_name">

                                                    <div class="form-group col-md-6">
                                                        <label for="txtdepartement">Département</label>
                                                        <input type="text" class="form-control" name="txtdepartement"
                                                            id="txtdepartement" required maxlength="225">
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="txtsous_prefecture">Sous-Préfecture</label>
                                                        <input type="text" class="form-control"
                                                            name="txtsous_prefecture" id="txtsous_prefecture" required
                                                            maxlength="225">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="txtvillage">Village</label>
                                                        <input type="text" class="form-control" name="txtvillage"
                                                            id="txtvillage" required maxlength="225">
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="txtsuperficie_hectares">Superficie (ha)</label>
                                                        <input type="number" class="form-control"
                                                            name="txtsuperficie_hectares" id="txtsuperficie_hectares"
                                                            step="0.00001" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="txtproduction_annuelle_estimee">Production
                                                            Annuelle Estimée</label>
                                                        <input type="number" class="form-control"
                                                            name="txtproduction_annuelle_estimee"
                                                            id="txtproduction_annuelle_estimee" step="0.00001" required>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="txtannee_plantation">Année de Plantation</label>
                                                        <input type="number" class="form-control"
                                                            name="txtannee_plantation" id="txtannee_plantation"
                                                            min="1900" max="2099" step="1" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="txtgeolocalise">Géolocalisé</label>
                                                        <select class="form-control" name="txtgeolocalise"
                                                            id="txtgeolocalise" required>
                                                            <option value="oui">Oui</option>
                                                            <option value="non">Non</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card-footer">
                                                <button type="submit" class="btn btn-primary"
                                                    name="btnadd">Ajouter</button>
                                                <a href="plantationlist.php" class="btn btn-danger">Annuler</a>
                                                <button type="button" class="btn btn-success " id="synchro">Synchroniser
                                                </button>
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
    function searchProducer() {
        const input = document.getElementById('txtproducteur_code');
        const value = input.value;
        const options = document.getElementById('producersList').options;

        for (let i = 0; i < options.length; i++) {
            if (options[i].value === value) {
                document.getElementById('producer-name').innerText = options[i].dataset.name;
                document.getElementById('producer-firstname').innerText = options[i].dataset.firstname;
                document.getElementById('producer-sector-code').innerText = options[i].dataset.secteurCode;
                document.getElementById('producer-sector-name').innerText = options[i].dataset.secteurName;
                document.getElementById('producer-info').style.display = 'block';
                return;
            }
        }

        document.getElementById('producer-info').style.display = 'none';
    }

    function fetchProducerInfo() {
        const input = document.getElementById('txtproducteur_code');
        const value = input.value;
        const options = document.getElementById('producersList').options;

        for (let i = 0; i < options.length; i++) {
            if (options[i].value === value) {
                document.getElementById('producer-name').innerText = options[i].dataset.name;
                document.getElementById('producer-firstname').innerText = options[i].dataset.firstname;
                document.getElementById('producer-sector-code').innerText = options[i].dataset.secteurCode;
                document.getElementById('producer-sector-name').innerText = options[i].dataset.secteurName;
                return true; // Continue the form submission
            }
        }
        alert("Producteur introuvable. Veuillez vérifier le code.");
        return false; // Stop the form submission
    }

    function updateSecteurName() {
        var secteurSelector = document.getElementById("secteur_selector");
        var selectedOption = secteurSelector.options[secteurSelector.selectedIndex];
        var secteurName = selectedOption.getAttribute("data-secteur-name");

        // Mettre à jour le champ caché avec le nom du secteur
        document.getElementById("txtsecteur_name").value = secteurName;
    }

    // Function to save the form data offline when there is no internet connection
    let resultOnline

    function saveFormOffline() {
        const form = document.getElementById('plantation-form'); // Get the form element
        const formData = new FormData(form); // Create a FormData object from the form
        const data = {}; // Initialize an empty object to store form data

        // Add form data to the object
        formData.forEach((value, key) => {
            data[key] = value; // Store each form field in the data object
        });
        const offlineFormsPlantation = JSON.parse(localStorage.getItem('offlineFormsPlantation')) ||
    []; // Get existing offline forms from localStorage
        offlineFormsPlantation.push(data); // Add the current form data to the array
        localStorage.setItem('offlineFormsPlantation', JSON.stringify(
            offlineFormsPlantation)); // Store the updated array back in localStorage

        alert('Formulaire sauvegardé hors ligne !'); // Alert the user that the form has been saved offline

    }


    // Event listener for when the DOM is fully loaded
    document.addEventListener("DOMContentLoaded", function() {


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
        document.getElementById("plantation-form").addEventListener("submit", function(event) {



            if (resultOnline) {
                console.log('en ligne')
            } else {
                event.preventDefault(); // Prevent the form from being sent
                saveFormOffline(); // Call the function to save the form offline
                console.log('offfline')

            }

        });

    });

    // Function to synchronize the offline form data with the server
    async function syncForms() {
        const offlineFormsPlantation = JSON.parse(localStorage.getItem('offlineFormsPlantation')) ||
    []; // Retrieve offline forms from localStorage

        if (offlineFormsPlantation.length > 0) { // Check if there are any offline forms to sync
            try {
                const response = await fetch('syncFormsPlantation.php', { // Send a POST request to syncForms.php
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json' // Set the content type to JSON
                    },
                    body: JSON.stringify(offlineFormsPlantation) // Send the offline forms as JSON
                });

                if (response.ok) { // Check if the response is OK
                    localStorage.removeItem('offlineFormsPlantation'); // Clear localStorage after successful sync
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