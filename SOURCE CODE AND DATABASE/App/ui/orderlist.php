<?php
include_once 'connectdb.php';
session_start();

if($_SESSION['useremail']==""  OR $_SESSION['role']==""){

  header('location:../index.php');

  }


  if ($_SESSION['role'] == "Admin") {
    include_once 'header.php';
  } else {
      include_once 'headeruser.php';
  }
  $html = '';
  if(isset($_POST['search'])){

       $producteur_code = $_POST['producteur_code'];

       // Requête pour récupérer les informations du producteur en utilisant le code producteur
       $sql = "SELECT * FROM tbl_producteurs WHERE producteur_code='$producteur_code'";

       $result = $pdo->query($sql);

       if($result->rowCount() > 0){
           $html = "<div class='card' style='width:200px; padding:0;' >";
           while($row = $result->fetch(PDO::FETCH_ASSOC)){

              $nom = $row["nom"];
              $prenom = $row["prenom"];
              $secteur_name = $row['secteur_name'];
              $secteur_code = $row['secteur_code'];
              $contact_telephonique = $row['contact_telephonique'];
              $photo = 'uploads/' . $row['photo'];
              $signature = 'signatures/' . $row['signature'];
              $date_creation = date('d M Y', strtotime($row['created_at'])); // Utilisez la date de création

              $html.="
              <!-- second id card  -->
              <div class='custom-container' style='text-align:left; border:2px dotted black;'>
                    <div class='header'>
                    </div>
                    <div class='container-2'>
                        <div class='box-1'>
                        <img src='$photo'/>
                        </div>
                        <div class='box-2'>
                            <h2>$nom</h2>
                            <p style='font-size: 14px; color: black'>$prenom</p>
                        </div>
                        <div class='box-3'>
                        </div>
                    </div>
                    <div class='container-3'>
                        <div class='info-1'>
                            <div class='id'>
                                <h4>Code Producteur</h4>
                                <p>$producteur_code</p>
                            </div>
                            <div class='dob'>
                                <h4>Contact</h4>
                                <p>$contact_telephonique</p>
                            </div>
                        </div>
                        <div class='info-2'>
                            <div class='join-date'>
                                <h4>Secteur</h4>
                                <p>$secteur_name</p>
                            </div>
                            <div class='expire-date'>
                                <h4>Code Secteur</h4>
                                <p>$secteur_code</p>
                            </div>
                        </div>
                        <div class='info-3'>
                            <div class='email'>
                                <h4>Date de Creation</h4>
                                <p>$date_creation</p>
                            </div>
                        </div>
                        <div class='info-4'>
                            <div class='sign'>
                                <br>
                                Signature</p>
                              <img src='$signature' class='signature-image'/>
                            </div>
                        </div>
                        <!-- id card end -->
              ";
              sendlog(
                $pdo,
                'Génération Carte',
                $_SESSION['username'] . " a généré la carte du producteur N°".$row["producteur_id"]." - $nom $prenom",
                'Succès',

                $_SESSION['userid'],
                $_SESSION['username'],

                'Producteur',
                $row["producteur_id"],
                "$nom $prenom",
              );
}

}

}

?>

<style>

body

.lavkush img {
  border-radius: 8px;
  border: 2px solid blue;
}
hr.new2 {
  border-top: 1px dashed black;
  width:350px;
  text-align:left;
  align-items:left;
}
 /* second id card  */
 p{
     font-size: 13px;
     margin-top: -5px;
 }

 .custom-container {
    width: 650px;
    height: 40vh;
    margin: auto;
    background-color: white;
    box-shadow: 0 1px 10px rgb(146 161 176 / 50%);
    overflow: hidden;
    border-radius: 10px;
}

.header {
    /* border: 2px solid black; */
    width: 70vh;
    height: 15vh;
    margin: 20px auto;
    background-color: white;
    /* box-shadow: 0 1px 10px rgb(146 161 176 / 50%); */
    /* border-radius: 10px; */
    background-image: url('../dist/img/Code_Camp_BD1.png');
    background-repeat: no-repeat; /* Empêche la répétition de l'image */
    background-size: contain; /* Adapte l'image à l'intérieur du conteneur */
    overflow: hidden;
    font-family: 'Poppins', sans-serif;
}

.header h1 {
    color: #069833;
    text-align: right;
    margin-right: 20px;
    margin-top: 15px;
}

.header p {
    color: rgb(157, 51, 0);
    text-align: right;
    margin-right: 22px;
    margin-top: -10px;
}

.container-2 {
    /* border: 2px solid red; */
    width: 73vh;
    height: 10vh;
    margin: 0px auto;
    margin-top: -20px;
    display: flex;
}

.box-1 {
    border: 4px solid #fff;
    width: 90px;
    height: 95px;
    margin: -40px 25px;
    border-radius: 3px;
}

.box-1 img {
    width: 120px;
    height: 120px;
}

.box-2 {
    /* border: 2px solid purple; */
    width: 33vh;
    height: 8vh;
    margin: 10px 0px;
    padding: 10px 20px 20px 40px;
    text-align: left;
    font-family: 'Poppins', sans-serif;
}

.box-2 h2 {
    font-size: 1.3rem;
    margin-top: -5px;
    color: #069833;
    ;
}

.box-2 p {
    font-size: 0.7rem;
    margin-top: -5px;
    color: #069833;
}

.box-3 {
    /* border: 2px solid rgb(21, 255, 0); */
    width: 8vh;
    height: 8vh;
    margin: 8px 0px 8px 30px;
}

.box-3 img {
    width: 8vh;
}

.container-3 {
    width: 73vh;
    height: 12vh;
    margin: 0px auto;
    margin-top: 10px;
    display: flex;
    padding-left: 40px;
    font-family: 'Shippori Antique B1', sans-serif;
    font-size: 0.7rem;
}


.info-1 {
    /* border: 1px solid rgb(255, 38, 0); */
    width: 17vh;
    height: 12vh;
}

.id {
    /* border: 1px solid rgb(2, 92, 17); */
    width: 17vh;
    height: 5vh;
}

.id h4 {
    color: #069833;
    font-size:15px;
}

.dob {
    /* border: 1px solid rgb(0, 46, 105); */
    width: 17vh;
    height: 5vh;
    margin: 8px 0px 0px 0px;
}

.dob h4 {
    color: #069833;
    font-size:15px;
}

.info-2 {
    /* border: 1px solid rgb(4, 0, 59); */
    width: 17vh;
    height: 12vh;
}

.join-date {
    /* border: 1px solid rgb(2, 92, 17); */
    width: 17vh;
    height: 5vh;
}

.join-date h4 {
    color: #069833;
    font-size:15px;
}

.expire-date {
    /* border: 1px solid rgb(0, 46, 105); */
    width: 17vh;
    height: 5vh;
    margin: 8px 0px 0px 0px;
}

.expire-date h4 {
    color: #069833;
    font-size:15px;
}

.info-3 {
    /* border: 1px solid rgb(255, 38, 0); */
    width: 17vh;
    height: 12vh;
}

.email {
    /* border: 1px solid rgb(2, 92, 17); */
    width: 22vh;
    height: 5vh;
}

.email h4 {
    color: #069833;
    font-size:15px;
}

.phone {
    /* border: 1px solid rgb(0, 46, 105); */
    width: 17vh;
    height: 5vh;
    margin: 8px 0px 0px 0px;
}

.info-4 {
    /* border: 2px solid rgb(255, 38, 0); */
    width: 22vh;
    height: 12vh;
    margin: 0px 0px 0px 0px;
    font-size:15px;
}

.phone h4 {
    color: #069833;
    font-size:15px;
}

.sign {
    /* border: 1px solid rgb(0, 46, 105); */
    width: 100px;
    height: 100px;
    margin: 0px 0px 0px 0px;
    text-align: center;
}
/* Ajoute ce style CSS pour rendre la signature plus petite */
.signature-image {
    width: 130px;  /* Ajuste cette valeur selon la taille souhaitée */
    height: auto; /* Garde l'aspect ratio de la signature */
    display: block;
    margin: -15px 0px 10px -20px;
}

    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.js"></script>
  </head>
  <body>
  <div class="main-container" style="margin-top: 50px;">
  <!-- Conteneur de génération d'identité agrandi -->
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card jumbotron" style="padding: 20px;">
        <div class="card-body">
          <form class="form" method="POST" action="orderlist.php">
            <label for="producteur_code" style="font-size: 18px;">Veuillez entrer le Code Producteur</label>
            <input class="form-control mr-sm-2" type="search" placeholder="Entrez le Code Producteur    " name="producteur_code" style="height: 45px; font-size: 16px;"> <!-- Zone de saisie agrandie -->
            <small id="emailHelp" class="form-text text-muted"></small>
            <br>
            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="search" style="padding: 10px 20px; font-size: 16px;">Generer la carte</button> <!-- Bouton agrandi -->
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Conteneur de la carte d'identité générée agrandi -->
  <div class="row" style="margin-top: 30px;">
    <div class="col-md-8 offset-md-2"> <!-- Card de la carte d'identité générée élargie -->
      <div class="card" style="padding: 20px;">
        <div class="card-header" style="font-size: 18px; text-align: center;">
          Carte Producteur generé
        </div>
        <div id="id-card-container" style="padding: 15px;"> <!-- Utilisation d'un ID unique pour la carte -->
          <div class="card-body" id="mycard">
            <?php echo $html ?>
          </div>
        </div>
      </div>

      <!-- Bouton de téléchargement placé en bas et centré -->
      <div style="text-align: center; margin-top: 15px;">
        <button id="demo" class="downloadtable btn btn-primary hide-on-download" onclick="downloadtable()" style="padding: 10px 20px; font-size: 16px;"> Telecharger Carte</button> <!-- Agrandir le bouton -->
      </div>
    </div>
  </div>
</div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>

    <script>

function downloadtable() {
    // Sélectionne l'élément que tu veux masquer
    var button = document.querySelector('.hide-on-download');
    // Masque le bouton
    button.style.display = 'none';

    // Récupère seulement le div de la carte
    var node = document.querySelector('.custom-container'); // Assure-toi que c'est la bonne classe

    domtoimage.toPng(node)
        .then(function (dataUrl) {
            var img = new Image();
            img.src = dataUrl;
            downloadURI(dataUrl, "id-card.png");

            // Réaffiche le bouton après le téléchargement
            button.style.display = 'block';
        })
        .catch(function (error) {
            console.error('oops, something went wrong', error);

            // Réaffiche le bouton même en cas d'erreur
            button.style.display = 'block';
        });
}




    function downloadURI(uri, name) {
        var link = document.createElement("a");
        link.download = name;
        link.href = uri;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        delete link;
    }



</script>
  </body>
</html>


