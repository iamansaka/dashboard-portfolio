<?php

use Bramus\Router\Router;

session_start();

// Les constants 
define('ROOT', __DIR__);
define("URL", str_replace("index.php", "", (isset($_SERVER['HTTPS']) ? "https" : "http") ."://" . $_SERVER['HTTP_HOST'] . $_SERVER["PHP_SELF"]));

// Import autoload
require_once './vendor/autoload.php';

// Whoops 
$whoops = new \Whoops\Run;
$whoops->pushHandler(new \Whoops\Handler\PrettyPageHandler);
$whoops->register();

// Create Router instance
$router = new Router();

// Define routes
$router->get('/', '\App\Controllers\HomeController@index');

// Run it!
$router->run();