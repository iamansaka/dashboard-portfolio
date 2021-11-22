<?php

namespace App\Controllers;

class HomeController extends Controller {

    public function index() {
        return $this->view('home/index');
    }

    public function loginPost() {
        
    }

    public function logout() {
        session_destroy();

        return header('Location: /');
    }

}