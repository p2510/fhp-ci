<?php
class AccessGuard {
    // Define the roles and their access levels
    private static $accessRoles = [
        'Admin' => ['*'], // Admin has access to all pages
        'User' => ['addproduct', 'productlist', 'editproducteur', 'viewproduct', 'logout'],
        'Middle' => ['addproduct', 'productlist', 'editproducteur', 'viewproduct', 'category', 'delegue', 'logout'],
    ];

    // Static method to check access based on user role
    public static function canAccess($role, $page) {
        // Admin has access to all pages
        if ($role == 'Admin') {
            return true;
        }

        // Check the specific allowed pages for other roles
        return in_array($page, self::$accessRoles[$role] ?? []);
    }

    // Static method to protect access to certain pages
    public static function protectPage($page) {
        // Check if the session role is set and if access is allowed
        if (!isset($_SESSION['role']) || !self::canAccess($_SESSION['role'], $page)) {
            // Redirect to an access denied page
            header('Location: 403.php');
            exit;
        }
    }
    
}

?>