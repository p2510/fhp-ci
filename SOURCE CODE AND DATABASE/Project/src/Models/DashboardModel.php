<?php
class DashboardModel {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function getTotalProducts() {
        $query = $this->pdo->prepare("SELECT COUNT(*) as total FROM tbl_product");
        $query->execute();
        return $query->fetchColumn();
    }

    public function getTotalSectors() {
        $query = $this->pdo->prepare("SELECT COUNT(*) as total FROM tbl_secteurs");
        $query->execute();
        return $query->fetchColumn();
    }

    /*public function getTotalDelegates() {
        $query = $this->pdo->prepare("SELECT COUNT(*) as total FROM tbl_delegue");
        $query->execute();
        return $query->fetchColumn();
    }*/

    public function getTotalUsers() {
        $query = $this->pdo->prepare("SELECT COUNT(*) as total FROM tbl_user");
        $query->execute();
        return $query->fetchColumn();
    }
}
?>