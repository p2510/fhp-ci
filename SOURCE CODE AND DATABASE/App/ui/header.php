<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="../dist/img/fph-ci.png">
    <title>FPH-CI Producteurs</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">

    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">

    <!-- Select2 -->
    <link rel="stylesheet" href="../plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">



    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>



    <!-- DataTables -->
    <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">


    <!-- pdfmake -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.js"></script>

    <script src="../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css"></script>


    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="../plugins/sweetalert2/sweetalert2.min.css">

</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <!-- <a href="index3.html" class="nav-link">Home</a> -->
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <!-- <a href="#" class="nav-link">Contact</a> -->
                </li>
            </ul>

            <!-- Right navbar links -->
        </nav>
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="dashboard.php" class="brand-link">
                <img src="../dist/img/fph-ci.png" alt="AdminLTE Logo" class="" style="opacity: .8; width:70px">
                <span class="brand-text font-weight-light">FPH-CI Producteurs</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="../dist/img/avatar2.png" class="" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block"><?php echo $_SESSION['username']; ?></a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
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
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Gérer la génération du code producteur
            document.getElementById('secteur_selector').addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const secteur_code = selectedOption.getAttribute('data-secteur_code');

                if (secteur_code) {
                    // Générer les 7 chiffres aléatoires
                    const randomDigits = Math.floor(1000000 + Math.random() * 9000000);
                    const producteurCode = secteur_code +
                        randomDigits; // Combine le code secteur et les chiffres aléatoires

                    // Mettre à jour la valeur du champ producteur_code pour afficher le code généré
                    document.getElementById('producteur_code').value = producteurCode;

                    // Remplir également le champ caché txtsecteur_code
                    document.getElementById('txtsecteur_code').value = secteur_code;
                }
            });
        });
        </script>