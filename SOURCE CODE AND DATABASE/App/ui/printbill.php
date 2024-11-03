<?php

// Inclure la bibliothèque FPDF et la connexion à la base de données
require('fpdf/fpdf.php');
include_once 'connectdb.php';
session_start();
// Récupérer l'ID du producteur depuis l'URL
$id = $_GET["id"];
$select = $pdo->prepare("SELECT * FROM tbl_producteurs WHERE producteur_id = :id");
$select->bindParam(':id', $id);
$select->execute();
$row = $select->fetch(PDO::FETCH_OBJ);

if (!$row) {
    echo "<div class='alert alert-danger'>Aucun producteur trouvé avec cet ID.</div>";
    exit;
}
sendlog(
  $pdo,
  'Génération Fiche',
  $_SESSION['username'] . " a généré la fiche du producteur N°".$id." - ".$row->nom." ".$row->prenom,
  'Succès',

  $_SESSION['userid'],
  $_SESSION['username'],

  'Producteur',
  $id,
  $row->nom." ".$row->prenom,
);
// Fonction pour corriger l'orientation de l'image
function correctImageOrientation($filename) {
    if (function_exists('exif_read_data')) {
        $exif = @exif_read_data($filename);
        if (!empty($exif['Orientation'])) {
            $image = imagecreatefromjpeg($filename);
            switch ($exif['Orientation']) {
                case 3:
                    $image = imagerotate($image, 180, 0); // Rotation à 180 degrés
                    break;
                case 6:
                    $image = imagerotate($image, -90, 0); // Rotation à -90 degrés
                    break;
                case 8:
                    $image = imagerotate($image, 90, 0); // Rotation à 90 degrés
                    break;
            }
            imagejpeg($image, $filename, 90); // Réenregistre l'image corrigée
            imagedestroy($image);
        }
    }
}
// Créer un objet PDF
$pdf = new FPDF('P', 'mm', 'A4');
$pdf->AddPage();

// Afficher le logo FPH-CI en haut à gauche, plus grand
$pdf->Image('../dist/img/fph-ci.png', 10, 10, 70);  // X = 10, Y = 10, largeur = 70

// Afficher le logo FPH-CI en haut à gauche, plus grand
$pdf->Image('../dist/img/MODELE FICHE TECHNIQUE.png', 0, 0, 210); // Taille de la page en mm : 210mm de largeur pour A4


// Afficher la photo du producteur à droite du logo, encadrée avec des dimensions de photo d'identité
$photoPath = 'uploads/' . $row->photo;

// Corriger l'orientation de la photo avant de l'utiliser
correctImageOrientation($photoPath);

// Vérifier l'extension du fichier photo (jpg ou png)
$photoExtension = pathinfo($row->photo, PATHINFO_EXTENSION);

// Convertir l'extension en majuscules car FPDF utilise des majuscules pour le format
$photoExtension = strtoupper($photoExtension);

// Vérifier si le fichier de la photo existe et a une extension acceptée
if (file_exists($photoPath) && in_array($photoExtension, ['JPG', 'JPEG', 'PNG'])) {
    // Utiliser l'image dans le PDF en spécifiant l'extension détectée
    $pdf->Image($photoPath, 150, 10, 40, 50, $photoExtension);
} else {
    // Si l'image n'existe pas ou n'a pas une extension supportée, laisser une case vide à l'emplacement prévu pour la photo
    $pdf->Rect(150, 10, 40, 50); // Dessine un rectangle pour représenter l'emplacement de la photo
}

// Titre principal
$pdf->SetFont('Arial', 'B', 22);
$pdf->SetXY(10, 70);


// Ajouter un espace après le titre
$pdf->Ln(20);

// Afficher les détails du producteur sans tableau
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Nom Complet: ', 0, 0); // Texte en gras
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->nom) . ' ' . strtoupper($row->prenom), 0, 1); // Texte normal

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Code Producteur: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->producteur_code), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Secteur: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->secteur_name) . ' (' . strtoupper($row->secteur_code) . ')', 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Departement: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->departement), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Sous-Prefecture: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->sous_prefecture), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Localite: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->localite), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Date de Naissance: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, $row->date_naissance, 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Lieu de Naissance: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->lieu_naissance), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(80, 10, 'Sous-prefecture du Lieu de Naissance: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->sous_pref_naissance), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(80, 10, 'Departement du Lieu de Naissance: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->departement_naissance), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(60, 10, 'Type de Piece d\'Identite: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->type_piece_identite), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Numero de Piece: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->numero_piece), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Autre Piece: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->autre_piece), 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(70, 10, 'Contact Telephonique: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, $row->contact_telephonique, 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Superficie Totale: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, $row->superficie_totale . ' Hectares  ', 0, 1);

$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(40, 10, 'Delegue Village: ', 0, 0);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(0, 10, strtoupper($row->delegue_village), 0, 1);

// Ajouter un espace avant la signature
$pdf->Ln(10);

// Ajouter la signature du producteur centrée en bas
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(0, 3, 'Signature du Producteur', 0, 1, 'C');

// Vérifier que l'image de la signature existe avant de l'afficher
$signaturePath = 'signatures/' . $row->signature;
if (!empty($row->signature) && file_exists($signaturePath)) {
    $pdf->Image($signaturePath, 75, $pdf->GetY(), 60, 30, 'PNG'); // Signature centrée
} else {
    // Afficher un texte indiquant qu'il n'y a pas de signature, mais ne bloquez pas l'impression
    $pdf->Cell(0, 6, 'Aucune signature disponible', 0, 1, 'C');
}

// Générer le PDF
$pdf->Output('I', 'FicheTechnique_Producteur_' . $row->producteur_code . '.pdf');

