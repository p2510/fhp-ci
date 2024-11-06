                    <?php
                    include_once 'connectdb.php';
                    session_start();

                    if ($_SESSION['useremail'] == "" OR $_SESSION['role'] == "User") {
                        header('location:../index.php');
                    }

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

                        // Insertion des données dans la base de données
                        $insert = $pdo->prepare("INSERT INTO tbl_plantations (
                            code_plantation, producteur_code, secteur_code, secteur_name, departement, sous_prefecture, village, 
                            superficie_hectares, production_annuelle_estimee, annee_plantation, geolocalise) 
                            VALUES (
                            :code_plantation, :producteur_code, :secteur_code, :secteur_name, :departement, :sous_prefecture, 
                            :village, :superficie_hectares, :production_annuelle_estimee, :annee_plantation, :geolocalise)");

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

                    <!-- Formulaire HTML -->
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
                                <p><strong>Secteur:</strong> <span id="producer-sector-code"></span> - <span id="producer-sector-name"></span></p>
                            </div>
                        </div>
                    </div>

                    <!-- Card pour le formulaire d'ajout de plantation -->
                    <div class="col-lg-12">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">Formulaire d'Ajout de Plantation</h5>
                            </div>
                            <form action="" method="post" onsubmit="return fetchProducerInfo();">
                                <div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="txtcode_plantation">Code Plantation</label>
                                            <input type="text" class="form-control" name="txtcode_plantation" id="txtcode_plantation" value="<?php echo $code_plantation; ?>" readonly maxlength="100">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="txtproducteur_code">Code Producteur</label>
                                            <input type="text" class="form-control" id="txtproducteur_code" name="txtproducteur_code" required placeholder="Tapez le code du producteur..." oninput="searchProducer()" list="producersList" maxlength="100">
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
                                            <select class="form-control" id="secteur_selector" name="txtsecteur_code" required onchange="updateSecteurName()">
                                                <option value="" disabled selected>Choisissez un secteur</option>
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
                                            <input type="text" class="form-control" name="txtdepartement" id="txtdepartement" required maxlength="225">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="txtsous_prefecture">Sous-Préfecture</label>
                                            <input type="text" class="form-control" name="txtsous_prefecture" id="txtsous_prefecture" required maxlength="225">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="txtvillage">Village</label>
                                            <input type="text" class="form-control" name="txtvillage" id="txtvillage" required maxlength="225">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="txtsuperficie_hectares">Superficie (ha)</label>
                                            <input type="number" class="form-control" name="txtsuperficie_hectares" id="txtsuperficie_hectares" step="0.00001" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="txtproduction_annuelle_estimee">Production Annuelle Estimée</label>
                                            <input type="number" class="form-control" name="txtproduction_annuelle_estimee" id="txtproduction_annuelle_estimee" step="0.00001" required>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="txtannee_plantation">Année de Plantation</label>
                                            <input type="number" class="form-control" name="txtannee_plantation" id="txtannee_plantation" min="1900" max="2099" step="1" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="txtgeolocalise">Géolocalisé</label>
                                            <select class="form-control" name="txtgeolocalise" id="txtgeolocalise" required>
                                                <option value="oui">Oui</option>
                                                <option value="non">Non</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary" name="btnadd">Ajouter</button>
                                    <a href="plantationlist.php" class="btn btn-danger">Annuler</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                    </script>