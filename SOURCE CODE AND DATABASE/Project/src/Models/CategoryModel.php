<?php
class CategoryModel {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function getTotalCategories() {
        $query = $this->pdo->prepare("SELECT COUNT(*) as total FROM tbl_secteurs");
        $query->execute();
        return $query->fetchColumn();
    }

    public function getTotalProductsInCategories() {
        $query = $this->pdo->prepare("SELECT COUNT(*) as total FROM tbl_product");
        $query->execute();
        return $query->fetchColumn();
    }

    public function getRecentCategories() {
        $query = $this->pdo->prepare("SELECT * FROM tbl_secteurs  LIMIT 5");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getTopCategories() {
        $query = $this->pdo->prepare("SELECT category, COUNT(pid) as total FROM tbl_product GROUP BY category ORDER BY total DESC LIMIT 5");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
?>