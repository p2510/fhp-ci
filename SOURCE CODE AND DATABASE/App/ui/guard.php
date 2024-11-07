<?php
class AccessGuard {
    // Define the roles and their access levels
    private static $accessRoles = [
        'Admin' => ['*'], // Admin has access to all pages
        'User' => ['addproduct', 'productlist', 'editproducteur', 'viewproduct','addplantation','plantationlist','editplantation','plantationdelete','viewplantation' ,'paymentInfo','logout'],
        'Middle' => ['addproduct', 'productlist', 'editproducteur', 'viewproduct', 'category', 'delegue','viewproduct','addplantation','editplantation','plantationdelete','viewplantation', 'paymentInfo','logout'],
    ];

    
    public static function canAccess($role, $page) {
        // Test temporaire pour afficher le rôle et la page

        if ($role === 'Admin') {
            return true;
        }
        return in_array($page, self::$accessRoles[$role] ?? []);
    }

    public static function protectPage($page) {
     

       if (!isset($_SESSION['role']) || !self::canAccess($_SESSION['role'], $page)) {
        header('location:403.php');

        }
    }
}

?>