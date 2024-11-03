<?php
require '../config/database.php';
require '../src/Controllers/AuthController.php';

$authController = new AuthController();
$authController->login();


exit;