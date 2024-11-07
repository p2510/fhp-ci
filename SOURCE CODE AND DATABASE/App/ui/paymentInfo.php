<?php
                    include_once 'connectdb.php';
                    session_start();
include_once 'guard.php';


                    if ($_SESSION['useremail'] == "" ) {
                        header('location:../index.php');
                    }
                    AccessGuard::protectPage('paymentInfo');

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
                        $name = $_POST['name'];
                        $firstname = $_POST['firstname'];
                        $secteur_name = $_POST['txtsecteur_name'];
                        $rib = $_POST['rib'];
                        $nom_banque = $_POST['nom_banque'];
                        $code_guichet = $_POST['code_guichet'];
                        $numero_de_compte = $_POST['numero_de_compte'];
                        $cle_rib = $_POST['cle_rib'];
                        $mobile_money_choice = $_POST['mobile_money_choice'];
                        $phone = $_POST['phone'];
                    
                        // Insertion des données dans la base de données
                        $insert = $pdo->prepare("INSERT INTO payment (
                            code_producteur, nom, prenom, secteur, rib, nom_banque, code_guichet, numero_de_compte, cle_rib, mobile_money_choice, phone
                        ) VALUES (
                            :producteur_code, :name, :firstname, :secteur_name, :rib, :nom_banque, :code_guichet, :numero_de_compte, :cle_rib, :mobile_money_choice, :phone
                        )");
                    
                        $insert->bindParam(':producteur_code', $producteur_code);
                        $insert->bindParam(':name', $name);
                        $insert->bindParam(':firstname', $firstname);
                        $insert->bindParam(':secteur_name', $secteur_name);
                        $insert->bindParam(':rib', $rib);
                        $insert->bindParam(':nom_banque', $nom_banque);
                        $insert->bindParam(':code_guichet', $code_guichet);
                        $insert->bindParam(':numero_de_compte', $numero_de_compte);
                        $insert->bindParam(':cle_rib', $cle_rib);
                        $insert->bindParam(':mobile_money_choice', $mobile_money_choice);
                        $insert->bindParam(':phone', $phone);
                    
                        if ($insert->execute()) {
                            $_SESSION['status'] = "Information de paiement ajoutée avec succès";
                            echo '<script type="text/javascript">
                                    alert("Information de paiement ajoutée avec succès");
                                    window.location.href = "paymentInfo.php";
                                </script>';
                        } else {
                            $_SESSION['status'] = "Échec de l\'ajout de Information de paiement";
                            echo '<script type="text/javascript">
                                    alert("Échec de l\'ajout de Information de paiement");
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

                                    <div class="form-group col-md-12">
                                        <label for="txtproducteur_code">Code Producteur</label>
                                        <input type="text" class="form-control" id="txtproducteur_code"
                                            name="txtproducteur_code" required
                                            placeholder="Tapez le code du producteur..." oninput="searchProducer()"
                                            list="producersList" maxlength="100">
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
                                        <label for="name">Nom</label>
                                        <input type="text" class="form-control" name="name" id="producer-name" required
                                            readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="firstname">Prénom</label>
                                        <input type="text" class="form-control" name="firstname" id="producer-firstname"
                                            required readonly>
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="secteur_selector">Secteur</label>
                                        <input type="text" class="form-control" name="txtsecteur_name"
                                            id="producer-sector-name" required readonly>

                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="rib">Rib</label>
                                        <input type="text" class="form-control" name="rib" id="rib" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="nom_banque">Nom de la banque</label>
                                        <input type="text" class="form-control" name="nom_banque" id="nom_banque"
                                            required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="code_guichet">Code guichet</label>
                                        <input type="text" class="form-control" name="code_guichet" id="code_guichet"
                                            required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="numero_de_compte">Numéro de compte</label>
                                        <input type="number" class="form-control" name="numero_de_compte"
                                            id="numero_de_compte" step="1" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="cle_rib">Clé Rib</label>
                                        <input type="number" class="form-control" name="cle_rib" id="cle_rib" step="1"
                                            required>
                                    </div>
                                </div>

                                <div class="form-row">

                                    <div class="form-group col-md-6">
                                        <label for="mobile_money_choice">Mode de paiement ( Mobile money )</label>
                                        <select class="form-control" name="mobile_money_choice" id="mobile_money_choice"
                                            required>
                                            <option value="wave">Wave</option>
                                            <option value="om">Orange money</option>
                                            <option value="mm">Moov money</option>
                                            <option value="momo">Mtn money</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="phone">Téléphone</label>
                                        <input type="text" class="form-control" name="phone" id="phone" required>
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
            document.getElementById('producer-name').value = options[i].dataset.name;
            document.getElementById('producer-firstname').value = options[i].dataset.firstname;
            document.getElementById('producer-sector-name').value = options[i].dataset.secteurName;

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
            document.getElementById('producer-name').value = options[i].dataset.name;
            document.getElementById('producer-firstname').value = options[i].dataset.firstname;
            document.getElementById('producer-sector-name').value = options[i].dataset.secteurName;
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