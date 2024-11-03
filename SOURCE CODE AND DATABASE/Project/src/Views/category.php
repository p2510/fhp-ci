<!-- category_dashboard.php -->
<?php
session_start();
include_once '../../config/database.php';
include_once '../../src/Models/CategoryModel.php';

class CategoryController {
    private $categoryModel;

    public function __construct($pdo) {
        $this->categoryModel = new CategoryModel($pdo);
    }

    public function index() {
        $data = [
            'total_categories' => $this->categoryModel->getTotalCategories(),
            'total_products' => $this->categoryModel->getTotalProductsInCategories(),
            'recent_categories' => $this->categoryModel->getRecentCategories(),
            'top_categories' => $this->categoryModel->getTopCategories()
        ];
        return $data;
    }
}

$categoryController = new CategoryController($pdo);
$totals = $categoryController->index();


// Indiquer le contenu à inclure
$content = './Content/category_content.php';

// Inclure le layout par défaut
include './Layouts/default.php'; 
?>