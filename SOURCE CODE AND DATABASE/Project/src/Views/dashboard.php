<!-- dashboard.php -->
<?php
session_start();
include_once '../../config/database.php';
include_once '../../src/Models/DashboardModel.php';

class DashboardController {
    private $dashboardModel;

    public function __construct($pdo) {
        $this->dashboardModel = new DashboardModel($pdo);
    }

    public function index() {
        $data = [
            'total_product' => $this->dashboardModel->getTotalProducts(),
            'total_secteurs' => $this->dashboardModel->getTotalSectors(),
            // 'total_delegue' => $this->dashboardModel->getTotalDelegates(),
            'total_users' => $this->dashboardModel->getTotalUsers()
        ];
        return $data;
    }
}

$dashboardController = new DashboardController($pdo);
$totals = $dashboardController->index();

// Indiquer le contenu à inclure
$content = './Content/dashboard_content.php';

// Inclure le layout par défaut
include './Layouts/default.php'; 