<?php
session_start();
include_once './../../config/database.php';


class AuthController {
    public function login() {
        // Redirection immédiate si l'utilisateur est déjà connecté
        
        if (isset($_SESSION['useremail']) && $_SESSION['useremail'] != '') {
            $this->redirectBasedOnRole($_SESSION['role']);
        }

        // Vérifie si le formulaire de connexion a été soumis
        if (isset($_POST['btn_login'])) {
            $useremail = $_POST['txt_email'];
            $password = $_POST['txt_password'];

            global $pdo;  // Utilisation de $pdo si défini dans database.php
            $select = $pdo->prepare("SELECT * FROM tbl_user WHERE useremail = ? AND userpassword = ?");
            $select->execute([$useremail, $password]);

            $row = $select->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                // Stocker les informations dans la session
                $_SESSION['userid'] = $row['userid'];
                $_SESSION['username'] = $row['username'];
                $_SESSION['useremail'] = $row['useremail'];
                $_SESSION['role'] = $row['role'];

                $_SESSION['status'] = 'Connexion Validée';
                $_SESSION['status_code'] = 'success';

                // Redirection basée sur le rôle
                $this->redirectBasedOnRole($row['role']);
            } else {
                // En cas d'échec de connexion
                $_SESSION['status'] = 'Mot de passe ou email incorrect';
                $_SESSION['status_code'] = 'error';
            }
        }
        // Si l'utilisateur n'est pas connecté et n'a pas soumis le formulaire, affichez le formulaire de connexion
           $this->showLoginForm();
    }

    private function redirectBasedOnRole($role) {
        // Fonction de redirection basée sur le rôle
        if ($role == 'Admin') {
            header('location:  ../Views/dashboard.php');
        } elseif ($role == 'User') {
            header('location: ../Views/addproduct.php');
        }
        exit;
    }
    private function showLoginForm() {
        // Incluez votre page de connexion ici, par exemple:
        header('location: ../src/Views/login.php');
      
    }
}

$authController = new AuthController();
$authController->login();