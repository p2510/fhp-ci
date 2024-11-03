<!-- Content for category dashboard -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Tableau de Bord des Catégories</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <!-- Navigation Breadcrumbs -->
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3><?php echo $totals['total_categories']; ?></h3>
                                <p>Total Catégories</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-list"></i>
                            </div>
                            <a href="category_list.php" class="small-box-footer">Plus d'infos <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3><?php echo $totals['total_products']; ?></h3>
                                <p>Total Produits dans les Catégories</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="product_list.php" class="small-box-footer">Plus d'infos <i
                                    class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">Catégories les Plus Actives</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nom de la Catégorie</th>
                                            <th>Total Produits</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php
                                        
                                            $counter = 1;
                                            foreach ($totals['top_categories'] as $category) {
                                                echo '
                                                <tr>
                                                    <td>' . $counter . '</td>
                                                    <td>' . htmlspecialchars($category->category) . '</td>
                                                    <td>' . htmlspecialchars($category->total) . '</td>
                                                </tr>';
                                                $counter++;
                                            }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h5 class="m-0">Catégories Récemment Ajoutées</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nom</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $counter = 1;
                                            foreach ($totals['recent_categories'] as $category) {
                                                echo '
                                                <tr>
                                                    <td>' . $counter . '</td>
                                                    <td>' . htmlspecialchars($category->secteur_name) . '</td>
                                                 
                                                </tr>';
                                                $counter++;
                                            }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>