<?php
                    include_once 'connectdb.php';
                    session_start();
                


                    if ($_SESSION['useremail'] == "" ) {
                        header('location:../index.php');
                    }
          


                    

                    // Logique pour l'ajout de plantation
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {  
                $data = json_decode(file_get_contents('php://input'), true);
    
                if (!empty($data)) {
                    foreach ($data as $form) {
                        $producteur_code = $form['txtproducteur_code'];
                        $name = $form['name'];
                        $firstname = $form['firstname'];
                        $secteur_name = $form['txtsecteur_name'];
                        $rib = $form['rib'];
                        $nom_banque = $form['nom_banque'];
                        $code_guichet = $form['code_guichet'];
                        $numero_de_compte = $form['numero_de_compte'];
                        $cle_rib = $form['cle_rib'];
                        $mobile_money_choice = $form['mobile_money_choice'];
                        $phone = $form['phone'];
                    
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
                }    
            }  
                 
 ?>