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

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Sélectionner les informations existantes de la plantation
    $select = $pdo->prepare("SELECT * FROM tbl_plantations WHERE id = :id");
    $select->bindParam(':id', $id);
    $select->execute();
    $row = $select->fetch(PDO::FETCH_ASSOC);

    if ($row) {
        $code_plantation = $row['code_plantation'];
        $producteur_code = $row['producteur_code'];
        $secteur_code = $row['secteur_code'];
        $secteur_name = $row['secteur_name'];
        $departement = $row['departement'];
        $sous_prefecture = $row['sous_prefecture'];
        $village = $row['village'];
        $superficie_hectares = $row['superficie_hectares'];
        $production_annuelle_estimee = $row['production_annuelle_estimee'];
        $annee_plantation = $row['annee_plantation'];
        $geolocalise = $row['geolocalise'];
    } else {
        echo '<script type="text/javascript">alert("Plantation non trouvée"); window.location.href = "plantationlist.php";</script>';
        exit;
    }
}

// Logique pour la mise à jour de la plantation
if (isset($_POST['btnupdate'])) {
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

    // Mise à jour des données dans la base de données
    $update = $pdo->prepare("UPDATE tbl_plantations SET 
        producteur_code = :producteur_code, 
        secteur_code = :secteur_code, 
        secteur_name = :secteur_name, 
        departement = :departement, 
        sous_prefecture = :sous_prefecture, 
        village = :village, 
        superficie_hectares = :superficie_hectares, 
        production_annuelle_estimee = :production_annuelle_estimee, 
        annee_plantation = :annee_plantation, 
        geolocalise = :geolocalise
        WHERE id = :id");

    $update->bindParam(':id', $id);
    $update->bindParam(':producteur_code', $producteur_code);
    $update->bindParam(':secteur_code', $secteur_code);
    $update->bindParam(':secteur_name', $secteur_name);
    $update->bindParam(':departement', $departement);
    $update->bindParam(':sous_prefecture', $sous_prefecture);
    $update->bindParam(':village', $village);
    $update->bindParam(':superficie_hectares', $superficie_hectares);
    $update->bindParam(':production_annuelle_estimee', $production_annuelle_estimee);
    $update->bindParam(':annee_plantation', $annee_plantation);
    $update->bindParam(':geolocalise', $geolocalise);

    if ($update->execute()) {
        $_SESSION['status'] = "Plantation mise à jour avec succès";
        echo '<script type="text/javascript">
                alert("Plantation mise à jour avec succès");
                window.location.href = "plantationlist.php";
            </script>';
    } else {
        $_SESSION['status'] = "Échec de la mise à jour de la plantation";
        echo '<script type="text/javascript">
                alert("Échec de la mise à jour de la plantation");
            </script>';
    }
}
?>

<!-- Formulaire HTML pour la mise à jour de plantation -->
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Mettre à jour la Plantation</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- Card pour afficher les informations de la plantation -->
                <div class="col-lg-12">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h5 class="m-0">Formulaire de Mise à Jour de Plantation</h5>
                        </div>
                        <form action="" method="post">
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtcode_plantation">Code Plantation</label>
                                        <input type="text" class="form-control" name="txtcode_plantation" value="<?php echo $code_plantation; ?>" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtproducteur_code">Code Producteur</label>
                                        <input type="text" class="form-control" id="txtproducteur_code" name="txtproducteur_code" value="<?php echo $producteur_code; ?>" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="secteur_selector">Secteur</label>
                                        <select class="form-control" id="secteur_selector" name="txtsecteur_code" required onchange="updateSecteurName()">
                                            <option value="" disabled>Choisissez un secteur</option>
                                            <?php
                                            $select = $pdo->prepare("SELECT * FROM tbl_secteurs ORDER BY secteur_id");
                                            $select->execute();
                                            while ($row = $select->fetch(PDO::FETCH_ASSOC)) {
                                                $selected = ($row['secteur_code'] == $secteur_code) ? 'selected' : '';
                                                echo "<option value='" . $row['secteur_code'] . "' data-secteur-name='" . $row['secteur_name'] . "' $selected>" . $row['secteur_name'] . "</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <!-- Champ caché pour stocker le nom du secteur sélectionné -->
                                    <input type="hidden" id="txtsecteur_name" name="txtsecteur_name" value="<?php echo $secteur_name; ?>">

                                    <div class="form-group col-md-6">
                                        <label for="txtdepartement">Département</label>
                                        <input type="text" class="form-control" name="txtdepartement" value="<?php echo $departement; ?>" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtsous_prefecture">Sous-Préfecture</label>
                                        <input type="text" class="form-control" name="txtsous_prefecture" value="<?php echo $sous_prefecture; ?>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtvillage">Village</label>
                                        <input type="text" class="form-control" name="txtvillage" value="<?php echo $village; ?>" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtsuperficie_hectares">Superficie (ha)</label>
                                        <input type="number" class="form-control" name="txtsuperficie_hectares" value="<?php echo $superficie_hectares; ?>" step="0.00001" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtproduction_annuelle_estimee">Production Annuelle Estimée</label>
                                        <input type="number" class="form-control" name="txtproduction_annuelle_estimee" value="<?php echo $production_annuelle_estimee; ?>" step="0.00001" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtannee_plantation">Année de Plantation</label>
                                        <input type="number" class="form-control" name="txtannee_plantation" value="<?php echo $annee_plantation; ?>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtgeolocalise">Géolocalisé</label>
                                        <select class="form-control" name="txtgeolocalise">
                                            <option value="non" <?php if ($geolocalise == 'non') echo 'selected'; ?>>non</option>
                                            <option value="oui" <?php if ($geolocalise == 'oui') echo 'selected'; ?>>oui</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" name="btnupdate" class="btn btn-primary">Mettre à Jour</button>
                                <a href="plantationlist.php" class="btn btn-secondary">Annuler</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Script pour mettre à jour le nom du secteur automatiquement -->
<script>
function updateSecteurName() {
    const secteurSelector = document.getElementById('secteur_selector');
    const selectedOption = secteurSelector.options[secteurSelector.selectedIndex];
    const secteurName = selectedOption.getAttribute('data-secteur-name');
    document.getElementById('txtsecteur_name').value = secteurName;
}
</script>

<?php include_once 'footer.php'; ?>
